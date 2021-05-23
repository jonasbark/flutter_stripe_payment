> **⚠ WARNING: This plugin has been discontinued.**  
> Head over to [migration.md](migration.md) for migrate to the new flutter_stripe plugin


[![pub package](https://img.shields.io/pub/v/stripe_payment.svg)](https://pub.dev/packages/stripe_payment)

# stripe_payment

#### Conveniently secure payments methods using Stripe.

## Quick Glance

- This Flutter plugin is a straight port from the tipsi-stripe plugin for React Native - we tried to 
keep the API as close as possible, so the documentation applies this plugin.
- Collect chargeable tokens from users' **Card Input** and** Apple & Google Pay**.
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

## Blog Posts
- [Build a marketplace in your Flutter app and accept payments using Stripe and Firebase](https://medium.com/flutter-community/build-a-marketplace-in-your-flutter-app-and-accept-payments-using-stripe-and-firebase-72f3f7228625)

## Xcode 12.5 support
Xcode 12.5 is not supported - see this [discussion](https://github.com/jonasbark/flutter_stripe_payment/issues/284#issuecomment-828293850) for a fix
