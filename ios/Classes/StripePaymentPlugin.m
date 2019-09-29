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
    else {
        result(FlutterMethodNotImplemented);
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

@end
