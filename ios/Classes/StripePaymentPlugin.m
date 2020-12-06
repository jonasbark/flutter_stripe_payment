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
    
    id rejecter = ^(NSString *code, NSString *message, NSError *error) {
        result([FlutterError errorWithCode:code ?: @"-" message:message details:error.localizedDescription]);
    };
    if ([@"setOptions" isEqualToString: call.method]) {
        [stripeModule init:call.arguments[@"options"] errorCodes:call.arguments[@"errorCodes"]];
        result(nil);
    } else if ([@"setStripeAccount" isEqualToString:call.method]) {
        [stripeModule setStripeAccount:call.arguments[@"stripeAccount"]];
        result(nil);
    } else if ([@"deviceSupportsApplePay" isEqualToString:call.method]) {
        [stripeModule deviceSupportsApplePay:result rejecter:rejecter];
    } else if ([@"canMakeApplePayPayments" isEqualToString:call.method]) {
        [stripeModule canMakeApplePayPayments:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"potentiallyAvailableNativePayNetworks" isEqualToString:call.method]) {
        [stripeModule potentiallyAvailableNativePayNetworks:result rejecter:rejecter];
    } else if ([@"createPaymentMethod" isEqualToString:call.method]) {
        [stripeModule createPaymentMethod:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"confirmPaymentIntent" isEqualToString:call.method]) {
        [stripeModule confirmPaymentIntent:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"authenticatePaymentIntent" isEqualToString:call.method]) {
        [stripeModule authenticatePaymentIntent:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"confirmSetupIntent" isEqualToString:call.method]) {
        [stripeModule confirmSetupIntent:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"authenticateSetupIntent" isEqualToString:call.method]) {
        [stripeModule authenticateSetupIntent:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"completeApplePayRequest" isEqualToString:call.method]) {
        [stripeModule completeApplePayRequest:result rejecter:rejecter];
    } else if ([@"cancelApplePayRequest" isEqualToString:call.method]) {
        [stripeModule cancelApplePayRequest:result rejecter:rejecter];
    } else if ([@"createTokenWithCard" isEqualToString:call.method]) {
        [stripeModule createTokenWithCard:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"createTokenWithBankAccount" isEqualToString:call.method]) {
        [stripeModule createTokenWithBankAccount:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"createSourceWithParams" isEqualToString:call.method]) {
        [stripeModule createSourceWithParams:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"paymentRequestWithCardForm" isEqualToString:call.method]) {
        [stripeModule paymentRequestWithCardForm:call.arguments resolver:result rejecter:rejecter];
    } else if ([@"paymentRequestWithApplePay" isEqualToString:call.method]) {
        [stripeModule paymentRequestWithApplePay:call.arguments[@"items"] withOptions:call.arguments[@"options"] resolver:result rejecter:rejecter];
    } else if ([@"paymentMethodFromApplePay" isEqualToString:call.method]) {
        [stripeModule paymentMethodFromApplePay:call.arguments[@"items"] withOptions:call.arguments[@"options"] resolver:result rejecter:rejecter];
    } else if ([@"openApplePaySetup" isEqualToString:call.method]) {
        [stripeModule openApplePaySetup];
    }
}
@end
