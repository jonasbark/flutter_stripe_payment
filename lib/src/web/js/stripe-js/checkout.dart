@JS()
library stripe_js.checkout;

import "package:js/js.dart";

// Module @stripe/stripe-js
@anonymous
@JS()
abstract class RedirectToCheckoutServerOptions {
  /// The ID of the [Checkout Session](https://stripe.com/docs/api/checkout/sessions) that is used in [Checkout's server integration](https://stripe.com/docs/payments/checkout/one-time).
  external String get sessionId;
  external set sessionId(String v);
  external factory RedirectToCheckoutServerOptions({String sessionId});
}

@anonymous
@JS()
abstract class RedirectToCheckoutClientOptions {
  /// The URL to which Stripe should send customers when payment is complete.
  /// If you’d like access to the Checkout Session for the successful payment, read more about it in our guide on [fulfilling your payments with webhooks](https://stripe.com/docs/payments/checkout/fulfillment#webhooks).
  external String get successUrl;
  external set successUrl(String v);

  /// The URL to which Stripe should send customers when payment is canceled.
  external String get cancelUrl;
  external set cancelUrl(String v);

  /// An array of objects representing the items that your customer would like to purchase.
  /// These items are shown as line items in the Checkout interface and make up the total amount to be collected by Checkout.
  external List<
      dynamic /*{
      /**
       * The ID of the SKU that the customer would like to purchase
       */
      sku?: string;

      /**
       * The ID of the plan that the customer would like to subscribe to.
       */
      plan?: string;

      /**
       * The quantity of units for the item.
       */
      quantity?: number;
    }*/
      > get items;
  external set items(
      List<
              dynamic /*{
      /**
       * The ID of the SKU that the customer would like to purchase
       */
      sku?: string;

      /**
       * The ID of the plan that the customer would like to subscribe to.
       */
      plan?: string;

      /**
       * The quantity of units for the item.
       */
      quantity?: number;
    }*/
              >
          v);

  /// A unique string to reference the Checkout session.
  /// This can be a customer ID, a cart ID, or similar.
  /// It is included in the `checkout.session.completed` webhook and can be used to fulfill the purchase.
  external String get clientReferenceId;
  external set clientReferenceId(String v);

  /// The email address used to create the customer object.
  /// If you already know your customer's email address, use this attribute to prefill it on Checkout.
  external String get customerEmail;
  external set customerEmail(String v);

  /// Specify whether Checkout should collect the customer’s billing address.
  /// If set to `required`, Checkout will attempt to collect the customer’s billing address.
  /// If not set or set to `auto` Checkout will only attempt to collect the billing address when necessary.
  external String /*'auto'|'required'*/ get billingAddressCollection;
  external set billingAddressCollection(String /*'auto'|'required'*/ v);

  /// Provides configuration for Checkout to collect a shipping address from a customer.
  external dynamic
      /*{
      /**
       * An array of two-letter ISO country codes representing which countries
       * Checkout should provide as options for shipping locations. The codes are
       * expected to be uppercase. Unsupported country codes: AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI.
       */
      allowedCountries: string[];
    }*/
      get shippingAddressCollection;
  external set shippingAddressCollection(
      dynamic
          /*{
      /**
       * An array of two-letter ISO country codes representing which countries
       * Checkout should provide as options for shipping locations. The codes are
       * expected to be uppercase. Unsupported country codes: AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI.
       */
      allowedCountries: string[];
    }*/
          v);

  /// The [IETF language tag](https://en.wikipedia.org/wiki/IETF_language_tag) of the locale to display Checkout in.
  /// Default is `auto` (Stripe detects the locale of the browser).
  external String /*'auto'|'da'|'de'|'en'|'es'|'fi'|'fr'|'it'|'ja'|'ms'|'nb'|'nl'|'pl'|'pt'|'pt-BR'|'sv'|'zh'*/ get locale;
  external set locale(
      String /*'auto'|'da'|'de'|'en'|'es'|'fi'|'fr'|'it'|'ja'|'ms'|'nb'|'nl'|'pl'|'pt'|'pt-BR'|'sv'|'zh'*/ v);

  /// Describes the type of transaction being performed by Checkout in order to customize relevant text on the page, such as the **Submit** button.
  /// `submitType` can only be specified when using using line items or SKUs, and not subscriptions.
  /// The default is `auto`.
  external String /*'auto'|'book'|'donate'|'pay'*/ get submitType;
  external set submitType(String /*'auto'|'book'|'donate'|'pay'*/ v);
  external factory RedirectToCheckoutClientOptions(
      {String successUrl,
      String cancelUrl,
      List<
              dynamic /*{
      /**
       * The ID of the SKU that the customer would like to purchase
       */
      sku?: string;

      /**
       * The ID of the plan that the customer would like to subscribe to.
       */
      plan?: string;

      /**
       * The quantity of units for the item.
       */
      quantity?: number;
    }*/
              >
          items,
      String clientReferenceId,
      String customerEmail,
      String /*'auto'|'required'*/ billingAddressCollection,
      dynamic
          /*{
      /**
       * An array of two-letter ISO country codes representing which countries
       * Checkout should provide as options for shipping locations. The codes are
       * expected to be uppercase. Unsupported country codes: AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI.
       */
      allowedCountries: string[];
    }*/
          shippingAddressCollection,
      String /*'auto'|'da'|'de'|'en'|'es'|'fi'|'fr'|'it'|'ja'|'ms'|'nb'|'nl'|'pl'|'pt'|'pt-BR'|'sv'|'zh'*/ locale,
      String /*'auto'|'book'|'donate'|'pay'*/ submitType});
}

/*type RedirectToCheckoutOptions =
    | RedirectToCheckoutServerOptions
    | RedirectToCheckoutClientOptions;
*/

// End module @stripe/stripe-js