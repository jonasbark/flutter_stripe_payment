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
  if ([@"addSource" isEqualToString:call.method]) {
      [self openStripeCardVC:result];
  }
  else if ([@"setPublishableKey" isEqualToString:call.method]) {
      [[STPPaymentConfiguration sharedConfiguration] setPublishableKey:call.arguments];
  }
  else {
      result(FlutterMethodNotImplemented);
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

- (void)addCardViewControllerDidCancel:(STPAddSourceViewController *)addCardViewController {
    [addCardViewController dismissViewControllerAnimated:true completion:nil];
}

- (void)addCardViewController:(STPAddSourceViewController *)addCardViewController
              didCreatePaymentMethod:(nonnull STPPaymentMethod *)paymentMethod
                   completion:(nonnull STPErrorBlock)completion {
    flutterResult(paymentMethod.stripeId);
    
    [addCardViewController dismissViewControllerAnimated:true completion:nil];
}

@end
