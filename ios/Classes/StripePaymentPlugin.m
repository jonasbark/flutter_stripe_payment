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
        NSString* merchantName = call.arguments[@"merchantName"];

        [self fetchNativeToken:subtotal tax:tax tip:tip currency:currency merchantName:merchantName result:result];
    } else if ([@"completeNativePay" isEqualToString:call.method]) {
        bool isSuccess = call.arguments[@"isSuccess"];
        PKPaymentAuthorizationStatus status = isSuccess ? PKPaymentAuthorizationStatusSuccess : PKPaymentAuthorizationStatusFailure;
        PKPaymentAuthorizationResult* result = [[PKPaymentAuthorizationResult alloc] initWithStatus:status errors:nil];
        self.nativeCompletion(result);
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}

-(void) fetchNativeToken:(NSNumber*)subtotal tax:(NSNumber*)tax tip:(NSNumber*)tip currency:(NSString*)currency merchantName:(NSString*)merchantName result:(FlutterResult)result {

    flutterResult = result;

    PKPaymentRequest *paymentRequest = [Stripe paymentRequestWithMerchantIdentifier:[STPPaymentConfiguration sharedConfiguration].appleMerchantIdentifier country:@"US" currency:currency];

    double total = subtotal.doubleValue + tax.doubleValue + tip.doubleValue;

    paymentRequest.paymentSummaryItems = @[
       [PKPaymentSummaryItem summaryItemWithLabel:@"Tip" amount:[NSDecimalNumber decimalNumberWithDecimal:tip.decimalValue]],
       [PKPaymentSummaryItem summaryItemWithLabel:@"Tax" amount:[NSDecimalNumber decimalNumberWithDecimal:tax.decimalValue]],
       [PKPaymentSummaryItem summaryItemWithLabel:@"Subtotal" amount:[NSDecimalNumber decimalNumberWithDecimal:subtotal.decimalValue]],
       [PKPaymentSummaryItem summaryItemWithLabel:merchantName amount:[NSDecimalNumber decimalNumberWithDecimal:[NSNumber numberWithDouble:total].decimalValue]]
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

-(void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller didAuthorizePayment:(nonnull PKPayment *)payment handler:(nonnull void (^)(PKPaymentAuthorizationResult * _Nonnull))completion  API_AVAILABLE(ios(11.0)){

    self.nativeCompletion = completion;

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
