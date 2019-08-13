# stripe_payment

A Flutter plugin to integrate the stripe plugin for iOS and Android. Currently only adding a credit card as paymet method is implemented.

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
StripeSource.setPublishableKey("pk_test");
```
from somewhere in your code, e.g. your main.dart file.

To open the dialog:
```dart
StripeSource.addSource().then((String token) {
    print(token); //your stripe card source token
});
```

## TODO

- [ ] better error handling
- [ ] internationalization
- [ ] more stripe library implementations?
