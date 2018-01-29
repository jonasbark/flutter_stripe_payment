#import <Flutter/Flutter.h>
#import "STPAddSourceViewController.h"

@interface StripePaymentPlugin : NSObject<FlutterPlugin, STPAddSourceViewControllerDelegate>

@property (nonatomic, retain) UIViewController *viewController;

@end
