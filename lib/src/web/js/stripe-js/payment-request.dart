@JS()
library stripe_js.payment_request;

import "package:js/js.dart";
import "../api/Tokens.dart" show Token;
import "../api/PaymentMethods.dart" show PaymentMethod;
import "../api/Sources.dart" show Source;
import "package:js/js_util.dart" show promiseToFuture;

// Module @stripe/stripe-js
@anonymous
@JS()
abstract class PaymentRequest {
  /// Shows the browser’s payment interface.
  /// When using the `PaymentRequestButtonElement`, this is called for you automatically.
  /// This method must be called as the result of a user interaction (for example, in a click handler).
  external void show();

  /// `PaymentRequest` instances can be updated with an options object.
  /// `paymentRequest.update` can only be called when the browser payment interface is not showing.
  /// Listen to the [click](https://stripe.com/docs/js/element/events) and [cancel](https://stripe.com/docs/js/element/events) events to detect if the payment interface has been initiated.
  /// To update the `PaymentRequest` right before the payment interface is initiated, call `paymentRequest.update` in your click event handler.
  external void update(PaymentRequestUpdateOptions options);

  /// Stripe.js automatically creates a `Token` after the customer is done interacting with the browser’s payment interface.
  /// To access the created `Token`, listen for this event.
  /*external PaymentRequest on('token' eventType, dynamic handler(PaymentRequestTokenEvent event));*/
  /// Stripe.js automatically creates a `PaymentMethod` after the customer is done interacting with the browser’s payment interface.
  /// To access the created `PaymentMethod`, listen for this event.
  /*external PaymentRequest on('paymentmethod' eventType, dynamic handler(PaymentRequestPaymentMethodEvent event));*/
  /// Stripe.js automatically creates a `Source` after the customer is done interacting with the browser’s payment interface.
  /// To access the created `Source`, listen for this event.
  /*external PaymentRequest on('source' eventType, dynamic handler(PaymentRequestSourceEvent event));*/
  /// The cancel event is emitted from a `PaymentRequest` when the browser's payment interface is dismissed.
  /// Note that in some browsers, the payment interface may be dismissed by the customer even after they authorize the payment.
  /// This means that you may receive a cancel event on your `PaymentRequest` object after receiving a `token`, `paymentmethod`, or `source` event.
  /// If you’re using the cancel event as a hook for canceling the customer’s order, make sure you also refund the payment that you just created.
  /*external PaymentRequest on('cancel' eventType, dynamic handler());*/
  /// The `shippingaddresschange` event is emitted from a `PaymentRequest` whenever the customer selects a new address in the browser's payment interface.
  /*external PaymentRequest on('shippingaddresschange' eventType, dynamic handler(PaymentRequestShippingAddressEvent event));*/
  /// The `shippingoptionchange` event is emitted from a `PaymentRequest` whenever the customer selects a new shipping option in the browser's payment interface.
  /*external PaymentRequest on('shippingoptionchange' eventType, dynamic handler(PaymentRequestShippingOptionEvent event));*/
  external PaymentRequest on(
      String /*'token'|'paymentmethod'|'source'|'cancel'|'shippingaddresschange'|'shippingoptionchange'*/ eventType,
      Function /*dynamic Function(PaymentRequestTokenEvent)|dynamic Function(PaymentRequestPaymentMethodEvent)|dynamic Function(PaymentRequestSourceEvent)|dynamic Function()|dynamic Function(PaymentRequestShippingAddressEvent)|dynamic Function(PaymentRequestShippingOptionEvent)*/ handler);
}

@anonymous
@JS()
abstract class _PaymentRequest {
  external Promise<CanMakePaymentResult /*CanMakePaymentResult|Null*/ >
      canMakePayment();
}

extension PaymentRequestExtensions on PaymentRequest {
  Future<CanMakePaymentResult /*CanMakePaymentResult|Null*/ > canMakePayment() {
    final Object t = this;
    final _PaymentRequest tt = t;
    return promiseToFuture(tt.canMakePayment());
  }
}

@anonymous
@JS()
abstract class CanMakePaymentResult {
  /// `true` if the browser payment API supports Apple Pay.
  /// In this case, you‘ll want to show a button that conforms to the Apple Pay [Human Interface Guidelines](https://developer.apple.com/apple-pay/web-human-interface-guidelines/).
  /// Note that using the `PaymentRequestButtonElement` is automatically cross-browser.
  /// If you use this `PaymentRequest` object to create a `paymentRequestButton` Element, you don't need to check `applePay` yourself.
  external bool get applePay;
  external set applePay(bool v);
  external factory CanMakePaymentResult({bool applePay});
}

@anonymous
@JS()
abstract class PaymentRequestUpdateOptions {
  /// Three character currency code (e.g., `usd`).
  external String get currency;
  external set currency(String v);

  /// This `PaymentRequestItem` is shown to the customer in the browser’s payment interface.
  external PaymentRequestItem get total;
  external set total(PaymentRequestItem v);

  /// An array of PaymentRequestItem objects.
  /// These objects are shown as line items in the browser’s payment interface.
  /// Note that the sum of the line item amounts does not need to add up to the `total` amount above.
  external List<PaymentRequestItem> get displayItems;
  external set displayItems(List<PaymentRequestItem> v);

  /// An array of `ShippingOption` objects.
  /// The first shipping option listed appears in the browser payment interface as the default option.
  external List<PaymentRequestShippingOption> get shippingOptions;
  external set shippingOptions(List<PaymentRequestShippingOption> v);
  external factory PaymentRequestUpdateOptions(
      {String currency,
      PaymentRequestItem total,
      List<PaymentRequestItem> displayItems,
      List<PaymentRequestShippingOption> shippingOptions});
}

/// An set of options to create this `PaymentRequest` instance with.
/// These options can be updated using `paymentRequest.update`.
@anonymous
@JS()
abstract class PaymentRequestOptions {
  /// The two-letter country code of your Stripe account (e.g., `US`).
  external String get country;
  external set country(String v);

  /// Three character currency code (e.g., `usd`).
  external String get currency;
  external set currency(String v);

  /// This `PaymentRequestItem` is shown to the customer in the browser’s payment interface.
  external PaymentRequestItem get total;
  external set total(PaymentRequestItem v);

  /// An array of PaymentRequestItem objects.
  /// These objects are shown as line items in the browser’s payment interface.
  /// Note that the sum of the line item amounts does not need to add up to the `total` amount above.
  external List<PaymentRequestItem> get displayItems;
  external set displayItems(List<PaymentRequestItem> v);

  /// By default, the browser's payment interface only asks the customer for actual payment information.
  /// A customer name can be collected by setting this option to `true`.
  /// This collected name will appears in the `PaymentRequestEvent` object.
  /// We highly recommend you collect at least one of name, email, or phone as this also results in collection of billing address for Apple Pay.
  /// The billing address can be used to perform address verification and block fraudulent payments.
  /// For all other payment methods, the billing address is automatically collected when available.
  external bool get requestPayerName;
  external set requestPayerName(bool v);

  /// See the `requestPayerName` option.
  external bool get requestPayerPhone;
  external set requestPayerPhone(bool v);

  /// See the `requestPayerName` option.
  external bool get requestPayerEmail;
  external set requestPayerEmail(bool v);

  /// Collect shipping address by setting this option to `true`.
  /// The address appears in the `PaymentRequestEvent`.
  /// You must also supply a valid `PaymentRequestShippingOption` to the `shippingOptions` property.
  /// This can be up front at the time `stripe.paymentRequest` is called, or in response to a `shippingaddresschange` event using the `updateWith` callback.
  external bool get requestShipping;
  external set requestShipping(bool v);

  /// An array of `ShippingOption` objects.
  /// The first shipping option listed appears in the browser payment interface as the default option.
  external List<PaymentRequestShippingOption> get shippingOptions;
  external set shippingOptions(List<PaymentRequestShippingOption> v);
  external factory PaymentRequestOptions(
      {String country,
      String currency,
      PaymentRequestItem total,
      List<PaymentRequestItem> displayItems,
      bool requestPayerName,
      bool requestPayerPhone,
      bool requestPayerEmail,
      bool requestShipping,
      List<PaymentRequestShippingOption> shippingOptions});
}

/// A `PaymentRequestItem` object is used to configure a `PaymentRequest`.
@anonymous
@JS()
abstract class PaymentRequestItem {
  /// The amount in the currency's subunit (e.g. cents, yen, etc.)
  external num get amount;
  external set amount(num v);

  /// A name that the browser shows the customer in the payment interface.
  external String get label;
  external set label(String v);

  /// If you might change this amount later (for example, after you have calcluated shipping costs), set this to `true`.
  /// Note that browsers treat this as a hint for how to display things, and not necessarily as something that will prevent submission.
  external bool get pending;
  external set pending(bool v);
  external factory PaymentRequestItem({num amount, String label, bool pending});
}

/// The `ShippingOption` object describes a shipping method used with a `PaymentRequest`.
@anonymous
@JS()
abstract class PaymentRequestShippingOption {
  /// A unique ID you create to keep track of this shipping option.
  /// You’ll be told the ID of the selected option on changes and on completion.
  external String get id;
  external set id(String v);

  /// A short label for this shipping option.
  external String get label;
  external set label(String v);

  /// A longer description of this shipping option.
  external String get detail;
  external set detail(String v);

  /// The amount to show for this shipping option.
  /// If the cost of this shipping option depends on the shipping address the customer enters, listen for the `shippingaddresschange` event.
  external num get amount;
  external set amount(num v);
  external factory PaymentRequestShippingOption(
      {String id, String label, String detail, num amount});
}

/*type PaymentRequestCompleteStatus =
    /**
     * Report to the browser that the payment was successful, and that it can close any active payment interface.
     */
    | 'success'

    /**
     * Report to the browser that you were unable to process the customer‘s payment.
     * Browsers may re-show the payment interface, or simply show a message and close.
     */
    | 'fail'

    /**
     * Equivalent to `fail`, except that the browser can choose to show a more-specific error message.
     */
    | 'invalid_payer_name'

    /**
     * Equivalent to `fail`, except that the browser can choose to show a more-specific error message.
     */
    | 'invalid_payer_phone'

    /**
     * Equivalent to `fail`, except that the browser can choose to show a more-specific error message.
     */
    | 'invalid_payer_email'

    /**
     * Equivalent to `fail`, except that the browser can choose to show a more-specific error message.
     */
    | 'invalid_shipping_address';
*/
@anonymous
@JS()
abstract class PaymentRequestEvent {
  /// Call this function with a `CompleteStatus` when you have processed the token data provided by the API.
  /// Note that you must must call complete within 30 seconds.
  external void Function(
          String /*'success'|'fail'|'invalid_payer_name'|'invalid_payer_phone'|'invalid_payer_email'|'invalid_shipping_address'*/)
      get complete;
  external set complete(
      void Function(
              String /*'success'|'fail'|'invalid_payer_name'|'invalid_payer_phone'|'invalid_payer_email'|'invalid_shipping_address'*/)
          v);

  /// The customer's name.
  /// Only present if it was explicitly asked for [creating the PaymentRequest object](https://stripe.com/docs/js/payment_request/create).
  external String get payerName;
  external set payerName(String v);

  /// The customer's email.
  /// Only present if it was explicitly asked for [creating the PaymentRequest object](https://stripe.com/docs/js/payment_request/create).
  external String get payerEmail;
  external set payerEmail(String v);

  /// The customer's phone.
  /// Only present if it was explicitly asked for [creating the PaymentRequest object](https://stripe.com/docs/js/payment_request/create).
  external String get payerPhone;
  external set payerPhone(String v);

  /// The final `ShippingAddress` the customer selected.
  /// Only present when `requestShipping` is `true` when [creating the PaymentRequest object](https://stripe.com/docs/js/payment_request/create), and you've supplied at least one `ShippingOption`.
  external PaymentRequestShippingAddress get shippingAddress;
  external set shippingAddress(PaymentRequestShippingAddress v);

  /// The final `ShippingOption` the customer selected.
  /// Only present when `requestShipping` is `true` when [creating the PaymentRequest object](https://stripe.com/docs/js/payment_request/create), and you've supplied at least one `ShippingOption`.
  external PaymentRequestShippingOption get shippingOption;
  external set shippingOption(PaymentRequestShippingOption v);

  /// The unique name of the payment handler the customer chose to authorize payment.
  /// For example, `basic-card`.
  external String get methodName;
  external set methodName(String v);
  external factory PaymentRequestEvent(
      {void Function(
              String /*'success'|'fail'|'invalid_payer_name'|'invalid_payer_phone'|'invalid_payer_email'|'invalid_shipping_address'*/)
          complete,
      String payerName,
      String payerEmail,
      String payerPhone,
      PaymentRequestShippingAddress shippingAddress,
      PaymentRequestShippingOption shippingOption,
      String methodName});
}

/// Describes a shipping address collected with a `PaymentRequest`.
@anonymous
@JS()
abstract class PaymentRequestShippingAddress {
  /// Two-letter country code, capitalized.
  /// Valid two-letter country codes are specified by ISO3166 alpha-2.
  external String get country;
  external set country(String v);

  /// An array of address line items.
  /// For example, `185 Berry St.`, `Suite 500`, `P.O. Box 12345`, etc.
  external List<String> get addressLine;
  external set addressLine(List<String> v);

  /// The most coarse subdivision of a country.
  /// Depending on the country, this might correspond to a state, a province, an oblast, a prefecture, or something else along these lines.
  external String get region;
  external set region(String v);

  /// The name of a city, town, village, etc.
  external String get city;
  external set city(String v);

  /// The postal code or ZIP code, also known as PIN code in India.
  external String get postalCode;
  external set postalCode(String v);

  /// The name of the recipient.
  /// This might be a person, a business name, or contain “care of” (c/o) instructions.
  external String get recipient;
  external set recipient(String v);

  /// The phone number of the recipient.
  /// Note that this might be different from any phone number you collect with `requestPayerPhone`.
  external String get phone;
  external set phone(String v);

  /// The sorting code as used in, for example, France.
  /// Not present on Apple platforms.
  external String get sortingCode;
  external set sortingCode(String v);

  /// A logical subdivision of a city.
  /// Can be used for things like neighborhoods, boroughs, districts, or UK dependent localities.
  /// Not present on Apple platforms.
  external String get dependentLocality;
  external set dependentLocality(String v);
  external factory PaymentRequestShippingAddress(
      {String country,
      List<String> addressLine,
      String region,
      String city,
      String postalCode,
      String recipient,
      String phone,
      String sortingCode,
      String dependentLocality});
}

@anonymous
@JS()
abstract class PaymentRequestTokenEvent implements PaymentRequestEvent {
  external Token get token;
  external set token(Token v);
  external factory PaymentRequestTokenEvent(
      {Token token,
      void Function(
              String /*'success'|'fail'|'invalid_payer_name'|'invalid_payer_phone'|'invalid_payer_email'|'invalid_shipping_address'*/)
          complete,
      String payerName,
      String payerEmail,
      String payerPhone,
      PaymentRequestShippingAddress shippingAddress,
      PaymentRequestShippingOption shippingOption,
      String methodName});
}

@anonymous
@JS()
abstract class PaymentRequestPaymentMethodEvent implements PaymentRequestEvent {
  external PaymentMethod get paymentMethod;
  external set paymentMethod(PaymentMethod v);
  external factory PaymentRequestPaymentMethodEvent(
      {PaymentMethod paymentMethod,
      void Function(
              String /*'success'|'fail'|'invalid_payer_name'|'invalid_payer_phone'|'invalid_payer_email'|'invalid_shipping_address'*/)
          complete,
      String payerName,
      String payerEmail,
      String payerPhone,
      PaymentRequestShippingAddress shippingAddress,
      PaymentRequestShippingOption shippingOption,
      String methodName});
}

@anonymous
@JS()
abstract class PaymentRequestSourceEvent implements PaymentRequestEvent {
  external Source get source;
  external set source(Source v);
  external factory PaymentRequestSourceEvent(
      {Source source,
      void Function(
              String /*'success'|'fail'|'invalid_payer_name'|'invalid_payer_phone'|'invalid_payer_email'|'invalid_shipping_address'*/)
          complete,
      String payerName,
      String payerEmail,
      String payerPhone,
      PaymentRequestShippingAddress shippingAddress,
      PaymentRequestShippingOption shippingOption,
      String methodName});
}

@anonymous
@JS()
abstract class PaymentRequestShippingAddressEvent {
  /// Call this with an `UpdateDetails` object to merge updates into the current `PaymentRequest` object.
  /// Note that if you subscribe to `shippingaddresschange` events, then you must call `updateWith` within 30 seconds.
  external void Function(PaymentRequestUpdateDetails) get updateWith;
  external set updateWith(void Function(PaymentRequestUpdateDetails) v);

  /// The customer's selected `ShippingAddress`.
  /// To maintain privacy, browsers may anonymize the shipping address by removing sensitive information that is not necessary to calculate shipping costs.
  /// Depending on the country, some fields can be missing or partially redacted.
  /// For example, the shipping address in the U.S. may only contain a city, state, and ZIP code.
  /// The full shipping address appears in the `PaymentRequestEvent` object after the purchase is confirmed in the browser’s payment interface
  external PaymentRequestShippingAddress get shippingAddress;
  external set shippingAddress(PaymentRequestShippingAddress v);
  external factory PaymentRequestShippingAddressEvent(
      {void Function(PaymentRequestUpdateDetails) updateWith,
      PaymentRequestShippingAddress shippingAddress});
}

/*type PaymentRequestUpdateDetailsStatus =
    /**
     * Let the customer proceed.
     */
    | 'success'

    /**
     * Prevent the customer from making the change they just made.
     */
    | 'fail'

    /**
     * Equivalent to `fail`, except we show a more specific error message.
     * Can only be used in a `shippingaddresschange` handler.
     */
    | 'invalid_shipping_address';
*/
/// An object to pass to the `updateWith` callback on `shippingaddresschange` and `shippingoptionchange` events.
@anonymous
@JS()
abstract class PaymentRequestUpdateDetails {
  /// The browser uses this value to show an error message to the customer if they've taken an action that invalidates the payment request.
  external String /*'success'|'fail'|'invalid_shipping_address'*/ get status;
  external set status(String /*'success'|'fail'|'invalid_shipping_address'*/ v);

  /// The new total amount, if applicable.
  external PaymentRequestItem get total;
  external set total(PaymentRequestItem v);

  /// These `PaymentRequestItem`s are shown as line items in the browser's payment interface.
  /// Note that the sum of the line item amounts does not need to add up to the `total` amount.
  external List<PaymentRequestItem> get displayItems;
  external set displayItems(List<PaymentRequestItem> v);

  /// The first shipping option listed appears in the browser payment interface as the default option.
  external List<PaymentRequestShippingOption> get shippingOptions;
  external set shippingOptions(List<PaymentRequestShippingOption> v);
  external factory PaymentRequestUpdateDetails(
      {String /*'success'|'fail'|'invalid_shipping_address'*/ status,
      PaymentRequestItem total,
      List<PaymentRequestItem> displayItems,
      List<PaymentRequestShippingOption> shippingOptions});
}

@anonymous
@JS()
abstract class PaymentRequestShippingOptionEvent {
  /// Call this with an `UpdateDetails` object to merge updates into the current `PaymentRequest` object.
  /// Note that if you subscribe to `shippingaddresschange` events, then you must call `updateWith` within 30 seconds.
  external void Function(PaymentRequestUpdateDetails) get updateWith;
  external set updateWith(void Function(PaymentRequestUpdateDetails) v);

  /// The customer's selected `ShippingOption`.
  external PaymentRequestShippingOption get shippingOption;
  external set shippingOption(PaymentRequestShippingOption v);
  external factory PaymentRequestShippingOptionEvent(
      {void Function(PaymentRequestUpdateDetails) updateWith,
      PaymentRequestShippingOption shippingOption});
}

// End module @stripe/stripe-js
@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
