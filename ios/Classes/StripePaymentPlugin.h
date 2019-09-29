#import <Flutter/Flutter.h>
#import "STPAddSourceViewController.h"

@interface StripePaymentPlugin : NSObject<FlutterPlugin, STPAddPaymentMethodViewControllerDelegate, STPAuthenticationContext>

@end
