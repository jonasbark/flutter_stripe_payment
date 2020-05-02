@JS()
library api.SetupIntents;

import "package:js/js.dart";
import "PaymentMethods.dart" show PaymentMethod;

// Module @stripe/stripe-js
/// The SetupIntent object.
@anonymous
@JS()
abstract class SetupIntent {
  /// Unique identifier for the object.
  external String get id;
  external set id(String v);

  /// String representing the object's type. Objects of the same type share the same value.
  external String /*'setup_intent'*/ get object;
  external set object(String /*'setup_intent'*/ v);

  /// Reason for cancellation of this SetupIntent, one of `abandoned`, `requested_by_customer`, or `duplicate`.
  external String /*'abandoned'|'duplicate'|'requested_by_customer'|Null*/ get cancellation_reason;
  external set cancellation_reason(
      String /*'abandoned'|'duplicate'|'requested_by_customer'|Null*/ v);

  /// The client secret of this SetupIntent. Used for client-side retrieval using a publishable key.
  /// The client secret can be used to complete payment setup from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
  external String /*String|Null*/ get client_secret;
  external set client_secret(String /*String|Null*/ v);

  /// Time at which the object was created. Measured in seconds since the Unix epoch.
  external num get created;
  external set created(num v);

  /// An arbitrary string attached to the object. Often useful for displaying to users.
  external String /*String|Null*/ get description;
  external set description(String /*String|Null*/ v);

  /// The error encountered in the previous SetupIntent confirmation.
  external LastSetupError /*LastSetupError|Null*/ get last_setup_error;
  external set last_setup_error(LastSetupError /*LastSetupError|Null*/ v);

  /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  external bool get livemode;
  external set livemode(bool v);

  /// If present, this property tells you what actions you need to take in order for your customer to continue payment setup.
  external NextAction /*NextAction|Null*/ get next_action;
  external set next_action(NextAction /*NextAction|Null*/ v);

  /// ID of the payment method used with this SetupIntent.
  external String /*String|Null*/ get payment_method;
  external set payment_method(String /*String|Null*/ v);

  /// The list of payment method types (e.g. card) that this SetupIntent is allowed to set up.
  external List<String> get payment_method_types;
  external set payment_method_types(List<String> v);

  /// [Status](https://stripe.com/docs/payments/intents#intent-statuses) of this SetupIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `canceled`, or `succeeded`.
  external String /*'canceled'|'processing'|'requires_action'|'requires_confirmation'|'requires_payment_method'|'succeeded'*/ get status;
  external set status(
      String /*'canceled'|'processing'|'requires_action'|'requires_confirmation'|'requires_payment_method'|'succeeded'*/ v);

  /// Indicates how the payment method is intended to be used in the future.
  /// Use `on_session` if you intend to only reuse the payment method when the customer is in your checkout flow. Use `off_session` if your customer may or may not be in your checkout flow. If not provided, this value defaults to `off_session`.
  external String get usage;
  external set usage(String v);
  external factory SetupIntent(
      {String id,
      String /*'setup_intent'*/ object,
      String /*'abandoned'|'duplicate'|'requested_by_customer'|Null*/ cancellation_reason,
      String /*String|Null*/ client_secret,
      num created,
      String /*String|Null*/ description,
      LastSetupError /*LastSetupError|Null*/ last_setup_error,
      bool livemode,
      NextAction /*NextAction|Null*/ next_action,
      String /*String|Null*/ payment_method,
      List<String> payment_method_types,
      String /*'canceled'|'processing'|'requires_action'|'requires_confirmation'|'requires_payment_method'|'succeeded'*/ status,
      String usage});
}

// Module SetupIntent
/*type CancellationReason =
      | 'abandoned'
      | 'duplicate'
      | 'requested_by_customer';
*/
@anonymous
@JS()
abstract class LastSetupError {
  /// For card errors, the ID of the failed charge.
  external String get charge;
  external set charge(String v);

  /// For some errors that could be handled programmatically, a short string indicating the [error code](https://stripe.com/docs/error-codes) reported.
  external String get code;
  external set code(String v);

  /// For card errors resulting from a card issuer decline, a short string indicating the [card issuer's reason for the decline](https://stripe.com/docs/declines#issuer-declines) if they provide one.
  external String get decline_code;
  external set decline_code(String v);

  /// A URL to more information about the [error code](https://stripe.com/docs/error-codes) reported.
  external String get doc_url;
  external set doc_url(String v);

  /// A human-readable message providing more details about the error. For card errors, these messages can be shown to your users.
  external String get message;
  external set message(String v);

  /// If the error is parameter-specific, the parameter related to the error. For example, you can use this to display a message near the correct form field.
  external String get param;
  external set param(String v);
  external PaymentMethod get payment_method;
  external set payment_method(PaymentMethod v);

  /// The type of error returned. One of `api_connection_error`, `api_error`, `authentication_error`, `card_error`, `idempotency_error`, `invalid_request_error`, or `rate_limit_error`
  external String /*'api_connection_error'|'api_error'|'authentication_error'|'card_error'|'idempotency_error'|'invalid_request_error'|'rate_limit_error'*/ get type;
  external set type(
      String /*'api_connection_error'|'api_error'|'authentication_error'|'card_error'|'idempotency_error'|'invalid_request_error'|'rate_limit_error'*/ v);
  external factory LastSetupError(
      {String charge,
      String code,
      String decline_code,
      String doc_url,
      String message,
      String param,
      PaymentMethod payment_method,
      String /*'api_connection_error'|'api_error'|'authentication_error'|'card_error'|'idempotency_error'|'invalid_request_error'|'rate_limit_error'*/ type});
}

// Module LastSetupError
/*type Type =
        | 'api_connection_error'
        | 'api_error'
        | 'authentication_error'
        | 'card_error'
        | 'idempotency_error'
        | 'invalid_request_error'
        | 'rate_limit_error';
*/

// End module LastSetupError
@anonymous
@JS()
abstract class NextAction {
  external RedirectToUrl get redirect_to_url;
  external set redirect_to_url(RedirectToUrl v);

  /// Type of the next action to perform, one of `redirect_to_url` or `use_stripe_sdk`.
  external String get type;
  external set type(String v);

  /// When confirming a SetupIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.
  external UseStripeSdk get use_stripe_sdk;
  external set use_stripe_sdk(UseStripeSdk v);
  external factory NextAction(
      {RedirectToUrl redirect_to_url,
      String type,
      UseStripeSdk use_stripe_sdk});
}

// Module NextAction
@anonymous
@JS()
abstract class RedirectToUrl {
  /// If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
  external String /*String|Null*/ get return_url;
  external set return_url(String /*String|Null*/ v);

  /// The URL you must redirect your customer to in order to authenticate.
  external String /*String|Null*/ get url;
  external set url(String /*String|Null*/ v);
  external factory RedirectToUrl(
      {String /*String|Null*/ return_url, String /*String|Null*/ url});
}

@anonymous
@JS()
abstract class UseStripeSdk {}

// End module NextAction
/*type Status =
      | 'canceled'
      | 'processing'
      | 'requires_action'
      | 'requires_confirmation'
      | 'requires_payment_method'
      | 'succeeded';
*/

// End module SetupIntent
@anonymous
@JS()
abstract class SetupIntentConfirmParams {
  /// This hash contains details about the Mandate to create
  external dynamic /*JSMap of <String,dynamic>*/ get mandate_data;
  external set mandate_data(dynamic /*JSMap of <String,dynamic>*/ v);

  /// The URL to redirect your customer back to after they authenticate on the payment method's app or site.
  /// If you'd prefer to redirect to a mobile application, you can alternatively supply an application URI scheme.
  /// This parameter is only used for cards and other redirect-based payment methods.
  external String get return_url;
  external set return_url(String v);
  external factory SetupIntentConfirmParams(
      {dynamic /*JSMap of <String,dynamic>*/ mandate_data, String return_url});
}

// End module @stripe/stripe-js
