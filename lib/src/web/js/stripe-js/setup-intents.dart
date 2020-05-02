@JS()
library stripe_js.setup_intents;

import "package:js/js.dart";
import "../api/SetupIntents.dart" show SetupIntentConfirmParams;

// Module @stripe/stripe-js
/// Data to be sent with a `stripe.confirmCardSetup` request.
/// Refer to the [Setup Intents API](https://stripe.com/docs/api/setup_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmCardSetupData implements SetupIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `SetupIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);
  external factory ConfirmCardSetupData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String return_url});
}

/// An options object to control the behavior of `stripe.confirmCardSetup`.
@anonymous
@JS()
abstract class ConfirmCardSetupOptions {
  /// Set this to `false` if you want to [handle next actions yourself](https://stripe.com/docs/payments/payment-intents/verifying-status#next-actions), or if you want to defer next action handling until later (e.g. for use in the [PaymentRequest API](https://stripe.com/docs/stripe-js/elements/payment-request-button#complete-payment-intents)).
  /// Default is `true`.
  external bool get handleActions;
  external set handleActions(bool v);
  external factory ConfirmCardSetupOptions({bool handleActions});
}

/// Data to be sent with a `stripe.confirmSepaDebitSetup` request.
/// Refer to the [Setup Intents API](https://stripe.com/docs/api/setup_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmSepaDebitSetupData implements SetupIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `SetupIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);
  external factory ConfirmSepaDebitSetupData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String return_url});
}

/// Data to be sent with a `stripe.confirmAuBecsDebitSetup` request.
/// Refer to the [Setup Intents API](https://stripe.com/docs/api/setup_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmAuBecsDebitSetupData implements SetupIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `SetupIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);
  external factory ConfirmAuBecsDebitSetupData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String return_url});
}

// End module @stripe/stripe-js
