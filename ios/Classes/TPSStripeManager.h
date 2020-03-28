//
//  TPSStripeManager.h
//  TPSStripe
//
//  Created by Anton Petrov on 28.10.16.
//  Copyright © 2016 Tipsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PassKit/PassKit.h>
#import <Stripe/Stripe.h>
#import "RCTConvert.h"

/**
 * Block that bridge modules use to resolve the JS promise waiting for a result.
 * Nil results are supported and are converted to JS's undefined value.
 */
typedef void (^RCTPromiseResolveBlock)(id result);

/**
 * Block that bridge modules use to reject the JS promise waiting for a result.
 * The error may be nil but it is preferable to pass an NSError object for more
 * precise error messages.
 */
typedef void (^RCTPromiseRejectBlock)(NSString *code, NSString *message, NSError *error);


@interface StripeModule : NSObject <PKPaymentAuthorizationViewControllerDelegate, STPAddCardViewControllerDelegate>

@property (nonatomic) STPRedirectContext *redirectContext;


-(void)init:(NSDictionary *)options errorCodes:(NSDictionary *)errors;

-(void)setStripeAccount:(NSString *)_stripeAccount;

-(void)deviceSupportsApplePay:(RCTPromiseResolveBlock)resolve
                     rejecter:(RCTPromiseRejectBlock)reject;

-(void)canMakeApplePayPayments:(NSDictionary *)options
                      resolver:(RCTPromiseResolveBlock)resolve
                      rejecter:(RCTPromiseRejectBlock)reject;

-(void)potentiallyAvailableNativePayNetworks:(RCTPromiseResolveBlock)resolve
                                    rejecter:(RCTPromiseRejectBlock)reject;

-(void)createPaymentMethod:(NSDictionary<NSString *, id> *)untypedParams
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject;

-(void)confirmPaymentIntent:(NSDictionary<NSString*, id>*)untypedParams
                   resolver:(RCTPromiseResolveBlock)resolve
                   rejecter:(RCTPromiseRejectBlock)reject;

-(void)authenticatePaymentIntent:(NSDictionary<NSString*, id> *)untypedParams
                        resolver:(RCTPromiseResolveBlock)resolve
                        rejecter:(RCTPromiseRejectBlock)reject;

-(void)confirmSetupIntent:(NSDictionary<NSString*, id> *)untypedParams
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject;

-(void)authenticateSetupIntent:(NSDictionary<NSString*, id>*)params
                      resolver:(RCTPromiseResolveBlock)resolve
                      rejecter:(RCTPromiseRejectBlock)reject;

-(void)completeApplePayRequest:(RCTPromiseResolveBlock)resolve
                      rejecter:(RCTPromiseRejectBlock)reject;

-(void)cancelApplePayRequest:(RCTPromiseResolveBlock)resolve
                    rejecter:(RCTPromiseRejectBlock)reject;

-(void)createTokenWithCard:(NSDictionary *)params
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject;

-(void)createTokenWithBankAccount:(NSDictionary *)params
                         resolver:(RCTPromiseResolveBlock)resolve
                         rejecter:(RCTPromiseRejectBlock)reject;

-(void)createSourceWithParams:(NSDictionary *)params
                     resolver:(RCTPromiseResolveBlock)resolve
                     rejecter:(RCTPromiseRejectBlock)reject;

-(void)paymentRequestWithCardForm:(NSDictionary *)options
                         resolver:(RCTPromiseResolveBlock)resolve
                         rejecter:(RCTPromiseRejectBlock)reject;

-(void)paymentRequestWithApplePay:(NSArray *)items
                      withOptions:(NSDictionary *)options
                         resolver:(RCTPromiseResolveBlock)resolve
                         rejecter:(RCTPromiseRejectBlock)reject;

-(void)paymentMethodFromApplePay:(NSArray *)items
                     withOptions:(NSDictionary *)options
                        resolver:(RCTPromiseResolveBlock)resolve
                        rejecter:(RCTPromiseRejectBlock)reject;

-(void)openApplePaySetup;

@end
