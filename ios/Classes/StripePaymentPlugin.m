#import "StripePaymentPlugin.h"
#import <Stripe/Stripe.h>
#import "TPSStripeManager.h"

@implementation StripePaymentPlugin {
    FlutterResult flutterResult;
    StripeModule* stripeModule;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"stripe_payment" binaryMessenger:[registrar messenger]];
    
    StripePaymentPlugin* instance = [[StripePaymentPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        stripeModule = [[StripeModule alloc] init];
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"init" isEqualToString: call.method]) {
        [stripeModule init:call.arguments[@"options"] errorCodes:call.arguments[@"errorCodes"]];
    } else if ([@"deviceSupportsApplePay" isEqualToString:call.method]) {
        [stripeModule deviceSupportsApplePay:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"canMakeApplePayPayments" isEqualToString:call.method]) {
        [stripeModule canMakeApplePayPayments:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"potentiallyAvailableNativePayNetworks" isEqualToString:call.method]) {
        [stripeModule potentiallyAvailableNativePayNetworks:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"createPaymentMethod" isEqualToString:call.method]) {
        [stripeModule createPaymentMethod:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"confirmPaymentIntent" isEqualToString:call.method]) {
        [stripeModule confirmPaymentIntent:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"authenticatePaymentIntent" isEqualToString:call.method]) {
        [stripeModule authenticatePaymentIntent:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"confirmSetupIntent" isEqualToString:call.method]) {
        [stripeModule confirmSetupIntent:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"authenticateSetupIntent" isEqualToString:call.method]) {
        [stripeModule authenticateSetupIntent:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"completeApplePayRequest" isEqualToString:call.method]) {
        [stripeModule completeApplePayRequest:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"cancelApplePayRequest" isEqualToString:call.method]) {
        [stripeModule cancelApplePayRequest:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"createTokenWithCard" isEqualToString:call.method]) {
        [stripeModule createTokenWithCard:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"createTokenWithBankAccount" isEqualToString:call.method]) {
        [stripeModule createTokenWithBankAccount:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"createSourceWithParams" isEqualToString:call.method]) {
        [stripeModule createSourceWithParams:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"paymentRequestWithCardForm" isEqualToString:call.method]) {
        [stripeModule paymentRequestWithCardForm:call.arguments resolver:result rejecter:^(NSString *code, NSString *message, NSError *error) {
            result([FlutterError errorWithCode:code message:message details:error]);
        }];
    } else if ([@"paymentRequestWithApplePay" isEqualToString:call.method]) {
        /*[stripeModule paymentRequestWithApplePay:<#(NSArray *)#> withOptions:<#(NSDictionary *)#> resolver:<#^(id result)resolve#> rejecter:<#^(NSString *code, NSString *message, NSError *error)reject#>]*/
    } else if ([@"openApplePaySetup" isEqualToString:call.method]) {
        [stripeModule openApplePaySetup];
    }
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
