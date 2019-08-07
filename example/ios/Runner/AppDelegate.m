#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
@import stripe_payment;
#import <Stripe/Stripe.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* stripeChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"stripe_payment"
                                            binaryMessenger:controller];

    StripePaymentPlugin* plugin = [[StripePaymentPlugin alloc] init];

    [stripeChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        [plugin handleMethodCall:call result:result];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [plugin handleMethodCall:[FlutterMethodCall methodCallWithMethodName:@"setPublishableKey" arguments:@"pk_test_aSaULNS8cJU6Tvo20VAXy6rp"] result:^(id  _Nullable result) {

        }];
        [plugin handleMethodCall:[FlutterMethodCall methodCallWithMethodName:@"addSource" arguments:nil] result:^(id  _Nullable result) {

        }];
    });
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


@end
