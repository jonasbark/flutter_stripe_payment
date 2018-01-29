#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <Stripe/Stripe.h>

@implementation AppDelegate {
    FlutterResult flutterResult;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* stripeChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"stripe_payment"
                                            binaryMessenger:controller];
    
    [stripeChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([call.method isEqualToString:@"openPayment"]) {
            [self openStripeCardVC:controller result:result];
        }
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self openStripeCardVC:controller result:nil];
    });
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

-(void)openStripeCardVC:(FlutterViewController*)controller result:(FlutterResult) result {
    flutterResult = result;
    
    [[STPPaymentConfiguration sharedConfiguration] setPublishableKey:@"pk_test"];
    
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
