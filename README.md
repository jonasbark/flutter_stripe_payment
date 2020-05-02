[![pub package](https://img.shields.io/pub/v/stripe_payment.svg)](https://pub.dev/packages/stripe_payment)

# WEB - Work In Progress

This is the complimentary Flutter Web implementation for [stripe_payment](https://pub.dev/packages/stripe_payment)

* First stage of implementation:
    * StripePayment.setOptions
    * StripePayment.paymentRequestWithNativePay
    * StripePayment.completeNativePayRequest
    * StripePayment.deviceSupportsNativePay => always true
    * ~~StripePayment.paymentRequestWithCardForm~~
    * ~~StripePayment.confirmPaymentIntent~~
    
## Notes

- stripe_sdk expects the total as int in the smallest currency units, this plugin expects double. How to convert? For now hacked * 100

## Breaking changes
 - canMakeNativePayPayments is no longer bool but returns null if native pay is not available or `CanMakePaymentResponse` 
 containing `bool isApplePay`
  
## Setup
Include `<script src="https://js.stripe.com/v3/"></script>` in your `web/idex.html`



# stripe_payment

#### Conveniently secure payments methods using Stripe.

## Quick Glance

- This Flutter plugin is a straight port from tipsi-stripe plugin for React Native - we tried to 
keep the API as close as possible so the documentation applies this this plugin as well.
- Collect chargable tokens from users' **Card Input** and **Apple & Google Pay**
- For **SCA** compliant apps, setup payment intents for later confirmation.

## Supported features:

### Native Pay -  & G
- canMakeNativePayPayments()
- deviceSupportsNativePay()
- potentiallyAvailableNativePayNetworks()
- completeNativePayRequest()
- cancelNativePayRequest()
### Card Form
- paymentRequestWithCardForm()
### Card Params Object
- createTokenWithCard()
### Bank Account Params Object
- createTokenWithBankAccount()
### Create Source Object With Params
- createSourceWithParams()

<img src="https://github.com/jonasbark/flutter_stripe_payment/raw/master/screenshot_android.png" width="400">

![Apple Pay](https://user-images.githubusercontent.com/7946558/65780165-02838700-e0fe-11e9-9db9-5fe4e44ed819.gif)


## Dependencies

### Android & iOS
- Create a Stripe account and project
- Retrieve a publishable key from the Stripe dashboard
  
![Stripe Dashboard](https://miro.medium.com/max/847/1*GPDsrgR6RXYuRCWiGxIF1g.png)

### Android 
- Requires AndroidX

Include support in android/gradle.properties
```properties
android.useAndroidX=true
android.enableJetifier=true
```
For proper setup also have a look at: https://github.com/jonasbark/flutter_stripe_payment/issues/88#issuecomment-553798157 

## Documentation

As this plugin is a port from tipsi-stripe for React Native you may consult their documentation:
https://github.com/tipsi/tipsi-stripe/tree/experimental-connect/website/docs-md
It includes:
- how to setup Google / Apple Pay
- method documentations