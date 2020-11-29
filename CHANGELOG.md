## [1.0.9]
- fix issues with Stripe iOS dependency

## [1.0.8]
- fix errors with shippingMethod for Apple Play (thanks @andhieka)
- preserve card name on iOS (thanks @brauliolomeli)
- currency support for CreditCard model (thanks @cis-emp1822)

## [1.0.7]
- update Stripe iOS dependency to support Xcode 11.4 (#131)
- bump Android gradle for latest Flutter support (thanks @ened)

## [1.0.6]
- fix #97 (thanks @sandeep-at-airlift)
- support Stripe Connected accounts (thanks @nicowernli)

## [1.0.5]
- fix Android kotlin compilation problems (#72)
- fix canMakeNativePayPayments request when it includes a list of networks (thanks @alexstuckey)

## [1.0.4]
- fix Android configuration for Activities (#68)

## [1.0.3]
- fix completeNativePayRequest + cancelNativePayRequest methods (thanks @jocelyngirard)

## [1.0.2]
- cancelling paymentRequestWithCardForm will now return the Future on Android (fixes #55)
- update minimum deployment target for iOS to 10.0

## [1.0.0]

the stripe_payment plugin is now ported from tipsi-stripe React Native plugin: 
https://github.com/tipsi/tipsi-stripe
New features include:
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

## [0.3.2]

* Add native iOS confirmation
* readme update

## [0.3.1] - 01.10.2019

* Lowered iOS minimum deployment target to 9.0
* removed dependency to stripe_native
* removed useNativeReceipt method

## [0.3.0] - 29.09.2019

Breaking change:
Initialize the plugin has changed:
StripePayment.setSettings(StripeSettings(publishableKey: "pk_test_"));

Added support for:
* SCA and 2FA (two factor authentication)
* confirm + setup payments
* Apple / Google Pay via stripe_native (https://pub.dev/packages/stripe_native)


## [0.2.1] - 27.08.2019

* Update Stripe dependencies

## [0.2.0] - 13.08.2019

* BREAKING: This plugin now uses the Payment Intent to create a payment method instead of creating a Source.

## [0.1.1] - 07.08.2019

* Breaking: Minimum Android target is 19 (from 18)
* Breaking: Minimum iOS target is 9.0 (from 8.0)
* Update Android Stripe dependency to 10.2.1
* Update iOS Stripe dependency to 16.0.3

## [0.1.0] - 22.02.2019

* Breaking change: use AndroidX

## [0.0.9] - 07.02.2019

* Updating Android Gradle

## [0.0.8] - 08.12.2018

* Fix crash on iOS for newer Flutter beta (fixes https://github.com/jonasbark/flutter_stripe_payment/issues/12) 

## [0.0.7] - 03.12.2018

* Increase Kotlin and Gradle versions

## [0.0.6] - 16.05.2018

* Dart 2 fixes

## [0.0.5] - 20.03.2018

* Compatible with Flutter SDK >=0.1.4 <2.0.0"

## [0.0.4] - 29.01.2018

* Initial release.
