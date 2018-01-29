#import "StripePaymentPlugin.h"
#import <Stripe/Stripe.h>

@implementation StripePaymentPlugin {
    FlutterResult flutterResult;
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:@"stripe_payment" binaryMessenger:[registrar messenger]];
    
    UIViewController *viewController = (UIViewController *)registrar.messenger;
    StripePaymentPlugin* instance = [[StripePaymentPlugin alloc] initWithViewController:viewController];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)initWithViewController:(UIViewController *)viewController {
    self = [super init];
    if (self) {
        self.viewController = viewController;
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"addSource" isEqualToString:call.method]) {
      [self openStripeCardVC:self.viewController result:result];
  }
  else if ([@"setPublishableKey" isEqualToString:call.method]) {
      [[STPPaymentConfiguration sharedConfiguration] setPublishableKey:call.arguments];
  }
  else {
      result(FlutterMethodNotImplemented);
  }
}

-(void)openStripeCardVC:(UIViewController*)controller result:(FlutterResult) result {
    flutterResult = result;
    
    STPAddSourceViewController* addSourceVC = [[STPAddSourceViewController alloc] init];
    addSourceVC.srcDelegate = self;
    
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:addSourceVC];
    [navigationController setModalPresentationStyle:UIModalPresentationFormSheet];
    
    [controller presentViewController:navigationController animated:true completion:nil];
}

- (void)addCardViewControllerDidCancel:(STPAddSourceViewController *)addCardViewController {
    [addCardViewController dismissViewControllerAnimated:true completion:nil];
}

- (void)addCardViewController:(STPAddSourceViewController *)addCardViewController
              didCreateSource:(STPSource *)source
                   completion:(STPErrorBlock)completion {
    flutterResult(source.stripeID);
    
    [addCardViewController dismissViewControllerAnimated:true completion:nil];
}

@end
