# stripe_payment

A Flutter plugin to integrate the stripe plugin for iOS and Android. 

It supports:
- Adding a credit card as payment method
- SCA and 2FA (two factor authentication)
- confirm + setup payments
- Apple / Google Pay via stripe_native (https://pub.dev/packages/stripe_native)

<img src="https://github.com/jonasbark/flutter_stripe_payment/raw/master/screenshot_android.png" width="300">
<img src="https://github.com/jonasbark/flutter_stripe_payment/raw/master/screenshot_ios.png" width="300">

## Android

**Please be aware that your main activity must extend from FlutterFragmentActivity. Otherwise the Android dialog would've looked very nasty.**

Include this into your project's android/gradle.properties file
```properties
android.useAndroidX=true
android.enableJetifier=true
```

## Usage

To set your publishable key set:
```dart
import 'package:stripe_payment/stripe_payment.dart';
StripePayment.setSettings(StripeSettings(publishableKey: "pk_test_"));
```
from somewhere in your code, e.g. your main.dart file.

To open the dialog for adding a credit card source:
```dart
StripeSource.addSource().then((String token) {
    print(token); //your stripe card source token
});
```

Confirming payments:
```dart
StripePayment.confirmPayment(_paymentMethodId, _currentSecret).then((String token) {
                  setState(() {
                    _confirmPaymentId = token;
                  });
                }).catchError(print);
```

Native payment (refer to https://pub.dev/packages/stripe_native#-readme-tab-)
```dart
StripePayment.useNativePay(Order(20, 1, 1, "Stripe Test")).then((String token) {
                  setState(() {
                    _confirmNativePay = token;
                  });
                }).catchError(print);
```

## TODO

- [ ] better error handling
- [ ] internationalization
- [ ] more stripe library implementations?
