
/// Wether the checkout includes at least a subscription or just plain items
enum CheckoutMode {
  payment,
  subscription,
}

String _checkoutModeToString(CheckoutMode type) {
  switch (type) {
    case CheckoutMode.payment: return 'payment';
    case CheckoutMode.subscription: return 'subscription';
  }
}

/// Describes the type of transaction being performed by Checkout in order to
/// customize relevant text on the page, such as the Submit button.
/// [SubmitType] can only be specified when using using line items or SKUs,
/// and not subscriptions.
///
/// The default is auto.
enum SubmitType {
  auto,
  book,
  donate,
  pay,
}

String _submitTypeToString(SubmitType type) {
  switch (type) {
    case SubmitType.auto: return 'auto';
    case SubmitType.book: return 'book';
    case SubmitType.donate: return 'donate';
    case SubmitType.pay: return 'pay';
  }
}

/// Maps options that are passed to `redirectToCheckout`.
/// @see https://stripe.com/docs/js/checkout/redirect_to_checkout
class Checkout {
  /// Using Uri instead of plain [String]. Use `Uri.dataFromString()`
  /// to quickly transform your urls, if needed.
  Uri? successUrl;

  /// Using Uri instead of plain [String]. Use `Uri.dataFromString()`
  /// to quickly transform your urls, if needed.
  Uri? cancelUrl;

  /// Client-server integration uses a sessionId to control
  /// what - and at which price - is being purchased.
  /// @see https://stripe.com/docs/api/checkout/sessions/create
  String? sessionId;

  /// Client-only integrations.
  List<CheckoutLineItem>? lineItems;

  /// The mode of the Checkout Session, one of payment or subscription.
  /// Required if using lineItems with the client-only integration.
  CheckoutMode? mode;

  /// A unique string to reference the Checkout session.
  /// This can be a customer ID, a cart ID, or similar.
  /// It is included in the checkout.session.completed webhook and can be used
  /// to fulfill the purchase.
  String? clientReferenceId;

  /// The email address used to create the customer object.
  /// If you already know your customer's email address, use this attribute
  /// to prefill it on Checkout.
  String? customerEmail;

  /// Specify whether Checkout should collect the customer’s billing address.
  /// If set to required, Checkout will attempt to collect the customer’s billing address.
  /// If not set or set to auto Checkout will only attempt to collect the billing
  /// address when necessary.
  String? billingAddressCollection;

  /// When set, provides configuration for Checkout to collect a shipping address
  /// from a customer.
  ShippingAddressCollection? shippingAddressCollection;

  /// A locale that will be used to localize the display of Checkout.
  /// Default is auto (Stripe detects the locale of the browser).
  String? locale;

  /// Describes the type of transaction being performed by Checkout in order to
  /// customize relevant text on the page, such as the Submit button.
  /// [SubmitType] can only be specified when using using line items or SKUs,
  /// and not subscriptions.
  SubmitType? submitType;

  Checkout({
    this.successUrl,
    this.cancelUrl,
    this.sessionId,
    this.lineItems,
    this.mode,
    this.clientReferenceId,
    this.billingAddressCollection = 'auto',
    this.shippingAddressCollection,
    this.locale = 'auto',
    this.submitType = SubmitType.auto,
  }) :
    assert(
      sessionId != null || lineItems != null,
      'Please provide either a sessionId or lineItems to proceed to checkout.'
    ),
    assert(
      sessionId != null
      || sessionId == null && mode != null,
      'Mode is mandatory for client-only integrations,'
    ),
    assert(
      sessionId != null
      || sessionId == null && successUrl != null,
      'successUrl is mandatory for client-only integrations,'
    ),
    assert(
      sessionId != null
      || sessionId == null && cancelUrl != null,
      'cancelUrl is mandatory for client-only integrations,'
    );

  Map<String, Object?> toJson() {
    final data = Map<String, dynamic>();

    // Client + server integration
    if (sessionId != null) {
      data['sessionId'] = sessionId;
    } else {
      data['lineItems'] = lineItems!
        .map((lineItem) => lineItem.toJson());
      data['mode'] = _checkoutModeToString(mode!);
      data['successUrl'] = successUrl!.toString();
      data['cancelUrl'] = cancelUrl!.toString();

      /// Optional fields (client-only integrations)
      if (clientReferenceId != null)
        data['clientReferenceId'] = clientReferenceId;
      if (customerEmail != null)
        data['customerEmail'] = customerEmail;
      if (billingAddressCollection != null)
        data['billingAddressCollection'] = billingAddressCollection;
      if (shippingAddressCollection != null)
        data['shippingAddressCollection'] = shippingAddressCollection!.toJson();
      if (locale != null)
        data['locale'] = locale;
      if (submitType != null)
        data['submitType'] = _submitTypeToString(submitType!);
    }

    return data;
  }
}

/// Maps the [Checkout] item
class CheckoutLineItem {
  final String price;
  final int quantity;

  CheckoutLineItem({
    required this.price,
    required this.quantity,
  });

  Map<String, Object?> toJson() =>
    {
      'price': price,
      'quantity': quantity,
    };
}

class ShippingAddressCollection {
  final List<String> allowedCountries;

  ShippingAddressCollection(this.allowedCountries);

  Map<String, Object?> toJson() =>
    {
      'allowedCountries': allowedCountries,
    };
}

/// Boilerplate code to parse errors
class CheckoutResult {
  CheckoutResultError? error;

  CheckoutResult({ this.error });

  bool get hasError =>
    error != null;

  factory CheckoutResult.fromJson(Map<String, dynamic>? json) =>
    CheckoutResult(
      error: json?.containsKey('error') == true
        ? CheckoutResultError.fromJson(json!['error'])
        : null
    );
}

class CheckoutResultError {
  final String message;

  CheckoutResultError(this.message);

  factory CheckoutResultError.fromJson(Map<String, dynamic>? json) =>
    CheckoutResultError(
      json?.containsKey('message') == true
        ? json!['message']
        : null
    );
}
