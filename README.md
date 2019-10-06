# stripe_payment

#### Conveniently secure payments methods using Stripe.

## Quick Glance

- Collect chargable tokens from users' **Card Input** and **Apple & Google Pay**
- For **SCA** compliant apps, setup payment intents for later confirmation.


<img src="https://github.com/jonasbark/flutter_stripe_payment/raw/master/screenshot_android.png">

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

#### (Optional) Create a merchant identifier on the Google Play console

### iOS (Apple Pay)

1) On the Stripe dashboard, go to Settings -> Apple Pay -> Add Application.
2) Follow the instructions that popup to link Stripe with Apple.

![Stripe Apple Pay Setup](https://miro.medium.com/max/396/1*YXaDZi1VYkfNXfM9Px6dIA.png)

3) Take note of your merchant identifier, and open the iOS module in Xcode.
4) Navigate the project panel, add Apple Pay under signing capabilites with the merchant identifer created in step 1.

![Apple Signing Capabilites](https://miro.medium.com/max/735/1*1-qwONvN5qMSsRYZyP57Hw.png)

## Setup

Using **publishable key** and **merchant identifier**, ready the app for collecting user payment information. This needs to be done prior to opening card input or a native payment sheet.

```dart
var settings = StripeSettings(publishableKey:"pk_test_yZuUz6SqmH4lA7SrlAvYCh003MvJiJlR", merchantIdentifier: "merchant.stripe-example", androidProductionEnvironment: false);
StripePayment.setSettings(settings);
```

## Card Input

Using **addSource**, collect a chargable token from the user's card information. This token can be used as a source by the [Stripe Charge API](https://stripe.com/docs/charges).

```dart
var token = await StripeSource.addSource();
```

## Native Payment

Opening Apple & Google pay is done with **useNativePay**. 

```dart
var order = Order(20, 1, 1, "EUR");
var token = await StripePayment.useNativePay(order)
```

### iOS Payment Sheet Animation

The Apple Pay sheet spins infront of the user, after using the token, show the user whether the transaction was successful or not.

```dart
var chargeSucceeded = AppAPI.charge(token, amount);
StripePayment.confirmNativePay(chargeSucceeded);
```

