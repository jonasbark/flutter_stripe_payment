#import "StripePaymentPlugin.h"
#import <Stripe/Stripe.h>

@implementation StripePaymentPlugin {
    FlutterResult flutterResult;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"stripe_payment" binaryMessenger:[registrar messenger]];
    
    StripePaymentPlugin* instance = [[StripePaymentPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"setSettings" isEqualToString:call.method]) {
        [[STPPaymentConfiguration sharedConfiguration] setPublishableKey:call.arguments[@"publishableKey"]];
        if (call.arguments[@"merchantIdentifier"]) {
            [[STPPaymentConfiguration sharedConfiguration] setAppleMerchantIdentifier: call.arguments[@"merchantIdentifier"]];
        }
    }
    else if ([@"addSource" isEqualToString:call.method]) {
        [self openStripeCardVC:result];
    } else if ([@"createTokenWithBankAccount" isEqualToString:call.method]) {
        
        NSDictionary* argDict = call.arguments;
        NSString* accountHolderName = [argDict objectForKey:@"accountHolderName"];
        NSString* accountHolderType = [argDict objectForKey:@"accountHolderType"];
        NSString* accountNumber = [argDict objectForKey:@"accountNumber"];
        NSString* bankName = [argDict objectForKey:@"bankName"];
        NSString* countryCode = [argDict objectForKey:@"countryCode"];
        NSString* currency = [argDict objectForKey:@"currency"];
        NSString* fingerprint = [argDict objectForKey:@"fingerprint"];
        NSString* last4 = [argDict objectForKey:@"last4"];
        NSString* routingNumber = [argDict objectForKey:@"routingNumber"];
        
        STPBankAccountParams* params = [[STPBankAccountParams alloc] init];

        params.accountHolderName = accountHolderName;
        STPBankAccountHolderType holderType = STPBankAccountHolderTypeIndividual;
        if ([accountHolderType caseInsensitiveCompare:@"company"]) {
            holderType = STPBankAccountHolderTypeCompany;
        }
                
        params.accountHolderType = holderType;
        params.accountNumber = accountNumber;
        params.country = countryCode;
        params.currency = currency;
        params.routingNumber = routingNumber;
    
        
        [STPAPIClient.sharedClient createTokenWithBankAccount:params completion:^(STPToken * _Nullable token, NSError * _Nullable error) {
            if (error) {
                NSString* errorCode = [NSString stringWithFormat:@"%li", error.code];
                FlutterError* flutterError = [FlutterError errorWithCode:errorCode message:error.localizedFailureReason details:nil];
                result(flutterError);
            } else {
                result(token);
            }
        }];
    }
    else if ([@"confirmPayment" isEqualToString:call.method]) {
        [self confirmPayment:call.arguments[@"paymentMethodId"] clientSecret:call.arguments[@"clientSecret"] result:result];
    }
    else if ([@"setupPayment" isEqualToString:call.method]) {
        [self setupPayment:call.arguments[@"paymentMethodId"] clientSecret:call.arguments[@"clientSecret"] result:result];
    }
    else if ([@"nativePay" isEqualToString:call.method]) {
        NSNumber* subtotal = call.arguments[@"subtotal"];
        NSNumber* tax = call.arguments[@"tax"];
        NSNumber* tip = call.arguments[@"tip"];
        NSString* currency = call.arguments[@"currency"];

        [self fetchNativeToken:subtotal tax:tax tip:tip currency:currency result:result];
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

-(void) fetchNativeToken:(NSNumber*)subtotal tax:(NSNumber*)tax tip:(NSNumber*)tip currency:(NSString*)currency result:(FlutterResult)result {

    flutterResult = result;

    PKPaymentRequest *paymentRequest = [Stripe paymentRequestWithMerchantIdentifier:[STPPaymentConfiguration sharedConfiguration].appleMerchantIdentifier country:@"US" currency:currency];

    double total = subtotal.doubleValue + tax.doubleValue + tip.doubleValue;

    paymentRequest.paymentSummaryItems = @[
       [PKPaymentSummaryItem summaryItemWithLabel:@"Tip" amount:[NSDecimalNumber decimalNumberWithDecimal:tip.decimalValue]],
       [PKPaymentSummaryItem summaryItemWithLabel:@"Tax" amount:[NSDecimalNumber decimalNumberWithDecimal:tax.decimalValue]],
       [PKPaymentSummaryItem summaryItemWithLabel:@"Subtotal" amount:[NSDecimalNumber decimalNumberWithDecimal:subtotal.decimalValue]],
       [PKPaymentSummaryItem summaryItemWithLabel:paymentRequest.merchantIdentifier amount:[NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:total].decimalValue]]
   ];

    if ([Stripe canSubmitPaymentRequest:paymentRequest]) {
        PKPaymentAuthorizationViewController *paymentAuthorizationViewController = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:paymentRequest];
        paymentAuthorizationViewController.delegate = self;
        UIViewController* controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
        [controller presentViewController:paymentAuthorizationViewController animated:true completion:nil];
    } else {
        flutterResult([FlutterError errorWithCode:@"Can't submit request" message:nil details:nil]);
    }
}

-(void)confirmPayment:(NSString*)paymentMethodId clientSecret:(NSString*)clientSecret result:(FlutterResult)result {
    flutterResult = result;

    STPPaymentIntentParams* paymentIntentParams = [[STPPaymentIntentParams alloc] initWithClientSecret:clientSecret];
    paymentIntentParams.paymentMethodId = paymentMethodId;

    [[STPPaymentHandler sharedHandler] confirmPayment:paymentIntentParams withAuthenticationContext:self completion:^(STPPaymentHandlerActionStatus status, STPPaymentIntent * _Nullable intent, NSError * _Nullable error) {

        if (status == STPPaymentHandlerActionStatusSucceeded) {
            self->flutterResult(intent.stripeId);
        } else if (error) {
            self->flutterResult([FlutterError errorWithCode:[NSString stringWithFormat:@"%li", (long)status] message:error.localizedDescription details:nil]);
        }
    }];
}

-(void)setupPayment:(NSString*)paymentMethodId clientSecret:(NSString*)clientSecret result:(FlutterResult)result {
    flutterResult = result;

    STPSetupIntentConfirmParams* paymentIntentParams = [[STPSetupIntentConfirmParams alloc] initWithClientSecret:clientSecret];
    paymentIntentParams.paymentMethodID = paymentMethodId;

    [[STPPaymentHandler sharedHandler] confirmSetupIntent:paymentIntentParams withAuthenticationContext:self completion:^(STPPaymentHandlerActionStatus status, STPSetupIntent * _Nullable intent, NSError * _Nullable error) {
        if (status == STPPaymentHandlerActionStatusSucceeded) {
            self->flutterResult(intent.stripeID);
        } else if (error) {
            self->flutterResult([FlutterError errorWithCode:[NSString stringWithFormat:@"%li", (long)status] message:error.localizedDescription details:nil]);
        }
    }];
}

-(void)openStripeCardVC:(FlutterResult) result {
    flutterResult = result;

    STPAddSourceViewController* addSourceVC = [[STPAddSourceViewController alloc] init];
    addSourceVC.srcDelegate = self;
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:addSourceVC];
    [navigationController setModalPresentationStyle:UIModalPresentationFormSheet];

    UIViewController* controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [controller presentViewController:navigationController animated:true completion:nil];
}

#pragma mark Card View

- (void)addCardViewControllerDidCancel:(STPAddSourceViewController *)addCardViewController {
    [addCardViewController dismissViewControllerAnimated:true completion:nil];
}

- (void)addCardViewController:(STPAddSourceViewController *)addCardViewController
       didCreatePaymentMethod:(nonnull STPPaymentMethod *)paymentMethod
                   completion:(nonnull STPErrorBlock)completion {
    flutterResult(paymentMethod.stripeId);
    
    [addCardViewController dismissViewControllerAnimated:true completion:nil];
}

- (UIViewController *)authenticationPresentingViewController {
    return [[[UIApplication sharedApplication] keyWindow] rootViewController];
}

#pragma mark PKPayment
-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(nonnull PKPayment *)payment handler:(nonnull void (^)(PKPaymentAuthorizationResult * _Nonnull))completion {

    [[STPAPIClient sharedClient] createTokenWithPayment:payment completion:^(STPToken * _Nullable token, NSError * _Nullable error) {
        if (error) {
            self->flutterResult([FlutterError errorWithCode:error.localizedDescription message:nil details:nil]);
        }
        else {
            self->flutterResult(token.tokenId);
        }
    }];
}

-(void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller {
    [controller dismissViewControllerAnimated:true completion:nil];
}

@end
