# stripe_payment

A flutter plugin to integrate the stripe plugin for iOS and Android. Currently only adding a credit card as source is implemented.

![Screenshot Android](https://github.com/jonasbark/flutter_stripe_payment/raw/master/screenshot_android.png)
![Screenshot iOS](https://github.com/jonasbark/flutter_stripe_payment/raw/master/screenshot_ios.png)

## Usage

To set your publishable key set:
```
import 'package:stripe_payment/stripe_source.dart';
StripeSource.setPublishableKey("pk_test_MA0JmL7HowNa25IxNKp4toZF");
```
from somewhere in your code, e.g. your main.dart file.

To open the dialog:
```
StripeSource.addSource.then((String token) {
    print(token); //your stripe card source token
});
```

## Android

Please be aware that your main activity must extend from FlutterFragmentActivity. Otherwise the Android dialog would've looked very nasty.

## TODO

- [ ] better error handling
- [ ] internationalization
- [ ] more stripe library implementations?
