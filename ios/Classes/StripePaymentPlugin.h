#import <Flutter/Flutter.h>
#import "STPAddSourceViewController.h"

API_AVAILABLE(ios(11.0))
typedef void(^NativeCompletion)(PKPaymentAuthorizationResult* _Nonnull);

@interface StripePaymentPlugin : NSObject<FlutterPlugin, STPAddPaymentMethodViewControllerDelegate, STPAuthenticationContext, PKPaymentAuthorizationViewControllerDelegate>
@property (nonatomic) NativeCompletion _Nullable nativeCompletion;
@end
