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
