@JS()
library stripe_js;

import "package:js/js.dart";
import "stripe-js/elements.dart" show StripeElements, StripeElementsOptions;
import "stripe-js/payment-request.dart" show PaymentRequest, PaymentRequestOptions;
import "stripe-js/payment-intents.dart"
    show
        ConfirmAuBecsDebitPaymentData,
        ConfirmCardPaymentData,
        ConfirmCardPaymentOptions,
        ConfirmFpxPaymentData,
        ConfirmFpxPaymentOptions,
        ConfirmIdealPaymentData,
        ConfirmIdealPaymentOptions,
        ConfirmSepaDebitPaymentData;
import "stripe-js/setup-intents.dart"
    show
        ConfirmAuBecsDebitSetupData,
        ConfirmCardSetupData,
        ConfirmCardSetupOptions,
        ConfirmSepaDebitSetupData;
import "stripe-js/elements/base.dart" show StripeElementBase;
import "stripe-js/token-and-sources.dart"
    show
        CreateTokenIbanData,
        CreateTokenCardData,
        CreateTokenPiiData,
        CreateTokenBankAccountData,
        RetrieveSourceParam;
import "api/Tokens.dart" show Account, Person;
import "api/Sources.dart" show SourceCreateParams, Source;
import "api/PaymentIntents.dart" show PaymentIntent;
import "api/PaymentMethods.dart" show PaymentMethod;
import "api/SetupIntents.dart" show SetupIntent;
import "package:js/js_util.dart" show promiseToFuture;

/// <reference path='./checkout.d.ts' />
/// <reference path='./elements.d.ts' />
/// <reference path='./payment-intents.d.ts' />
/// <reference path='./setup-intents.d.ts' />
/// <reference path='./payment-request.d.ts' />
/// <reference path='./token-and-sources.d.ts' />

@JS('Stripe')
external Stripe initializeStripe(String publishableKey);

// Module @stripe/stripe-js
//@anonymous
@JS()
class Stripe {
  /// //////////////////////////
  /// Elements
  /// https://stripe.com/docs/js/elements_object
  /// //////////////////////////
  /// Create an `Elements` instance, which manages a group of elements.
  external StripeElements elements([StripeElementsOptions options]);

  /// //////////////////////////
  /// Payment Request
  /// https://stripe.com/docs/js/payment_request
  /// //////////////////////////
  /// Use `stripe.paymentRequest` to create a `PaymentRequest` object.
  /// Creating a `PaymentRequest` requires that you configure it with an `options` object.
  /// In Safari, `stripe.paymentRequest` uses Apple Pay, and in other browsers it uses the [Payment Request API standard](https://www.w3.org/TR/payment-request/).
  external PaymentRequest paymentRequest(PaymentRequestOptions options);
}

@anonymous
@JS()
abstract class _Stripe {
  external Promise<dynamic /*void|{error: StripeError}*/ > redirectToCheckout(
      dynamic /*RedirectToCheckoutServerOptions|RedirectToCheckoutClientOptions*/ options);
  external Promise<
          dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmAuBecsDebitPayment(String clientSecret,
          [ConfirmAuBecsDebitPaymentData data]);
  external Promise<
          dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmCardPayment(String clientSecret,
          [ConfirmCardPaymentData data, ConfirmCardPaymentOptions options]);
  external Promise<
          dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmFpxPayment(String clientSecret,
          [ConfirmFpxPaymentData data, ConfirmFpxPaymentOptions options]);
  external Promise<
          dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmIdealPayment(String clientSecret,
          [ConfirmIdealPaymentData data, ConfirmIdealPaymentOptions options]);
  external Promise<
          dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmSepaDebitPayment(String clientSecret,
          [ConfirmSepaDebitPaymentData data]);
  external Promise<
          dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      handleCardAction(String clientSecret);
  external Promise<
          dynamic /*{paymentMethod?: PaymentMethod; error?: StripeError}*/ >
      createPaymentMethod(
          dynamic /*CreatePaymentMethodAuBecsDebitData|CreatePaymentMethodCardData|CreatePaymentMethodIdealData|CreatePaymentMethodFpxData|CreatePaymentMethodSepaDebitData*/ paymentMethodData);
  external Promise<
          dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      retrievePaymentIntent(String clientSecret);
  external Promise<
          dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      confirmAuBecsDebitSetup(String clientSecret,
          [ConfirmAuBecsDebitSetupData data]);
  external Promise<
          dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      confirmCardSetup(String clientSecret,
          [ConfirmCardSetupData data, ConfirmCardSetupOptions options]);
  external Promise<
          dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      confirmSepaDebitSetup(String clientSecret,
          [ConfirmSepaDebitSetupData data]);
  external Promise<
          dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      retrieveSetupIntent(String clientSecret);

  /// //////////////////////////
  /// Token and Sources
  /// https://stripe.com/docs/js/tokens_sources
  /// //////////////////////////
  /// Use `stripe.createToken` to convert information collected by an `IbanElement` into a single-use [Token](https://stripe.com/docs/api#tokens) that you safely pass to your server to use in an API call.
  /// @docs https://stripe.com/docs/js/tokens_sources/create_token?type=ibanElement
  /*external Promise<{token?: Token; error?: StripeError}> createToken(StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeIbanElementChangeEvent) => any
    ): StripeIbanElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeIbanElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeIbanElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeIbanElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeIbanElement;

    /**
     * Updates the options the `IbanElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `IbanElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeIbanElementOptions>): void;
  } tokenType, CreateTokenIbanData data);*/
  /// Use `stripe.createToken` to convert information collected by card elements into a single-use [Token](https://stripe.com/docs/api#tokens) that you safely pass to your server to use in an API call.
  /// @docs https://stripe.com/docs/js/tokens_sources/create_token?type=cardElement
  /*external Promise<{token?: Token; error?: StripeError}> createToken(StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeCardElementChangeEvent) => any
    ): StripeCardElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeCardElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeCardElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeCardElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeCardElement;

    /**
     * Updates the options the `CardElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `CardElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeCardElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeCardNumberElementChangeEvent) => any
    ): StripeCardNumberElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeCardNumberElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeCardNumberElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeCardNumberElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeCardNumberElement;

    /**
     * Updates the options the `CardNumberElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `Element` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeCardNumberElementOptions>): void;
  } tokenType, [CreateTokenCardData data]);*/
  /// Use `stripe.createToken` to convert personally identifiable information (PII) into a single-use [Token](https://stripe.com/docs/api#tokens) for account identity verification.
  /// @docs https://stripe.com/docs/js/tokens_sources/create_token?type=pii
  /*external Promise<{token?: Token; error?: StripeError}> createToken('pii' tokenType, CreateTokenPiiData data);*/
  /// Use `stripe.createToken` to convert bank account information into a single-use token that you safely pass to your server to use in an API call.
  /// @docs https://stripe.com/docs/js/tokens_sources/create_token?type=bank_account
  /*external Promise<{token?: Token; error?: StripeError}> createToken('bank_account' tokenType, CreateTokenBankAccountData data);*/
  /// Use `stripe.createToken` to tokenize the recollected CVC for a saved card.
  /// First, include the `cvc_update_beta_1` flag when creating an instance of the Stripe object.
  /// Next, render an `CardCvcElement` to collect the data.
  /// Then pass the `CardCvcElement` to `stripe.createToken` to tokenize the collected data.
  /// @docs https://stripe.com/docs/js/tokens_sources/create_token?type=bank_account
  /*external Promise<{token?: Token; error?: StripeError}> createToken('cvc_update' tokenType, [StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeCardCvcElementChangeEvent) => any
    ): StripeCardCvcElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeCardCvcElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeCardCvcElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeCardCvcElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeCardCvcElement;

    /**
     * Updates the options the `CardCvcElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `CardCvcElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeCardCvcElementOptions>): void;
  } element]);*/
  /// Use `stripe.createToken` to create a single-use token that wraps a user’s legal entity information.
  /// Use this when creating or updating a Connect account.
  /// See the [account tokens documentation](https://stripe.com/docs/connect/account-tokens) to learn more.
  /*external Promise<{token?: Token; error?: StripeError}> createToken('account' tokenType, Account data);*/
  /// Use `stripe.createToken` to create a single-use token that represents the details for a person.
  /// Use this when creating or updating persons associated with a Connect account.
  /// See the [documentation](https://stripe.com/docs/connect/account-tokens) to learn more.
  /*external Promise<{token?: Token; error?: StripeError}> createToken('person' tokenType, Person data);*/
  external Promise<dynamic /*{token?: Token; error?: StripeError}*/ > createToken(
      String /*'pii'|'bank_account'|'cvc_update'|'account'|'person'*/ tokenType,
      [dynamic /*CreateTokenIbanData|CreateTokenCardData|CreateTokenPiiData|CreateTokenBankAccountData|Account|Person*/ data_element]);

  /// Use `stripe.createSource` to convert payment information collected by elements into a `Source` object that you safely pass to your server to use in an API call.
  /// See the [Sources documentation](https://stripe.com/docs/sources) for more information about sources.
  /*external Promise<{source?: Source; error?: StripeError}> createSource(StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeAuBankAccountElementChangeEvent) => any
    ): StripeAuBankAccountElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeAuBankAccountElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeAuBankAccountElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeAuBankAccountElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeAuBankAccountElement;

    /**
     * Updates the options the `AuBankAccountElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `AuBankAccountElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeAuBankAccountElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeCardElementChangeEvent) => any
    ): StripeCardElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeCardElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeCardElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeCardElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeCardElement;

    /**
     * Updates the options the `CardElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `CardElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeCardElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeCardNumberElementChangeEvent) => any
    ): StripeCardNumberElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeCardNumberElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeCardNumberElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeCardNumberElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeCardNumberElement;

    /**
     * Updates the options the `CardNumberElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `Element` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeCardNumberElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeCardExpiryElementChangeEvent) => any
    ): StripeCardExpiryElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeCardExpiryElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeCardExpiryElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeCardExpiryElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeCardExpiryElement;

    /**
     * Updates the options the `CardExpiryElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `CardExpiryElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeCardExpiryElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeCardCvcElementChangeEvent) => any
    ): StripeCardCvcElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeCardCvcElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeCardCvcElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeCardCvcElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeCardCvcElement;

    /**
     * Updates the options the `CardCvcElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `CardCvcElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeCardCvcElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeFpxBankElementChangeEvent) => any
    ): StripeFpxBankElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeFpxBankElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeFpxBankElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeFpxBankElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeFpxBankElement;

    /**
     * Updates the options the `FpxBankElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `FpxBankElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeFpxBankElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeIbanElementChangeEvent) => any
    ): StripeIbanElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeIbanElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeIbanElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeIbanElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeIbanElement;

    /**
     * Updates the options the `IbanElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `IbanElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeIbanElementOptions>): void;
  }|StripeElementBase&{
    /**
     * The change event is triggered when the `Element`'s value changes.
     */
    on(
      eventType: 'change',
      handler: (event: StripeIdealBankElementChangeEvent) => any
    ): StripeIdealBankElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(eventType: 'ready', handler: () => any): StripeIdealBankElement;

    /**
     * Triggered when the element gains focus.
     */
    on(eventType: 'focus', handler: () => any): StripeIdealBankElement;

    /**
     * Triggered when the element loses focus.
     */
    on(eventType: 'blur', handler: () => any): StripeIdealBankElement;

    /**
     * Triggered when the escape key is pressed within the element.
     */
    on(eventType: 'escape', handler: () => any): StripeIdealBankElement;

    /**
     * Updates the options the `IdealBankElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `IdealBankElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(options: Partial<StripeIdealBankElementOptions>): void;
  }|StripeElementBase&{
    /**
     * Triggered when the payment request button is clicked.
     */
    on(
      eventType: 'click',
      handler: (event: StripePaymentRequestButtonElementClickEvent) => any
    ): StripePaymentRequestButtonElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(
      eventType: 'ready',
      handler: () => any
    ): StripePaymentRequestButtonElement;

    /**
     * Triggered when the element gains focus.
     */
    on(
      eventType: 'focus',
      handler: () => any
    ): StripePaymentRequestButtonElement;

    /**
     * Triggered when the element loses focus.
     */
    on(
      eventType: 'blur',
      handler: () => any
    ): StripePaymentRequestButtonElement;

    /**
     * Updates the options the `PaymentRequestButtonElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `PaymentRequestButtonElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(
      options: Partial<
        Omit<StripePaymentRequestButtonElementOptions, 'paymentRequest'>
      >
    ): void;
  } element, SourceCreateParams sourceData);*/
  /// Use `stripe.createSource` to convert raw payment information into a `Source` object that you safely pass to your server to use in an API call.
  /// See the [Sources documentation](https://stripe.com/docs/sources) for more information about sources.
  /*external Promise<{source?: Source; error?: StripeError}> createSource(SourceCreateParams sourceData);*/
  external Promise<dynamic /*{source?: Source; error?: StripeError}*/ >
      createSource(SourceCreateParams element_sourceData,
          [SourceCreateParams sourceData]);

  /// Retrieve a [Source](https://stripe.com/docs/api#sources) using its unique ID and client secret.
  /// @docs https://stripe.com/docs/js/tokens_sources/retrieve_source
  external Promise<dynamic /*{source?: Source; error?: StripeError}*/ >
      retrieveSource(RetrieveSourceParam source);
}

extension StripeExtensions on Stripe {
  Future<dynamic /*void|{error: StripeError}*/ > redirectToCheckout(
      dynamic /*RedirectToCheckoutServerOptions|RedirectToCheckoutClientOptions*/ options) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.redirectToCheckout(options));
  }

  Future<dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmAuBecsDebitPayment(String clientSecret,
          [ConfirmAuBecsDebitPaymentData data]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmAuBecsDebitPayment(clientSecret, data));
  }

  Future<dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmCardPayment(String clientSecret,
          [ConfirmCardPaymentData data, ConfirmCardPaymentOptions options]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmCardPayment(clientSecret, data, options));
  }

  Future<dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmFpxPayment(String clientSecret,
          [ConfirmFpxPaymentData data, ConfirmFpxPaymentOptions options]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmFpxPayment(clientSecret, data, options));
  }

  Future<dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmIdealPayment(String clientSecret,
          [ConfirmIdealPaymentData data, ConfirmIdealPaymentOptions options]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmIdealPayment(clientSecret, data, options));
  }

  Future<dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      confirmSepaDebitPayment(String clientSecret,
          [ConfirmSepaDebitPaymentData data]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmSepaDebitPayment(clientSecret, data));
  }

  Future<dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      handleCardAction(String clientSecret) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.handleCardAction(clientSecret));
  }

  Future<dynamic /*{paymentMethod?: PaymentMethod; error?: StripeError}*/ >
      createPaymentMethod(
          dynamic /*CreatePaymentMethodAuBecsDebitData|CreatePaymentMethodCardData|CreatePaymentMethodIdealData|CreatePaymentMethodFpxData|CreatePaymentMethodSepaDebitData*/ paymentMethodData) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.createPaymentMethod(paymentMethodData));
  }

  Future<dynamic /*{paymentIntent?: PaymentIntent; error?: StripeError}*/ >
      retrievePaymentIntent(String clientSecret) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.retrievePaymentIntent(clientSecret));
  }

  Future<dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      confirmAuBecsDebitSetup(String clientSecret,
          [ConfirmAuBecsDebitSetupData data]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmAuBecsDebitSetup(clientSecret, data));
  }

  Future<dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      confirmCardSetup(String clientSecret,
          [ConfirmCardSetupData data, ConfirmCardSetupOptions options]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmCardSetup(clientSecret, data, options));
  }

  Future<dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      confirmSepaDebitSetup(String clientSecret,
          [ConfirmSepaDebitSetupData data]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.confirmSepaDebitSetup(clientSecret, data));
  }

  Future<dynamic /*{setupIntent?: SetupIntent; error?: StripeError}*/ >
      retrieveSetupIntent(String clientSecret) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.retrieveSetupIntent(clientSecret));
  }

  Future<dynamic /*{token?: Token; error?: StripeError}*/ > createToken(
      String /*'pii'|'bank_account'|'cvc_update'|'account'|'person'*/ tokenType,
      [dynamic /*CreateTokenIbanData|CreateTokenCardData|CreateTokenPiiData|CreateTokenBankAccountData|Account|Person*/ data_element]) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.createToken(tokenType, data_element));
  }

  Future<dynamic /*{source?: Source; error?: StripeError}*/ > createSource(
      SourceCreateParams element_sourceData,
      [SourceCreateParams sourceData]) {
    final Object t = this;
    final _Stripe tt = t;
    if (sourceData == null) {
      return promiseToFuture(tt.createSource(element_sourceData));
    }
    return promiseToFuture(tt.createSource(element_sourceData, sourceData));
  }

  Future<dynamic /*{source?: Source; error?: StripeError}*/ > retrieveSource(
      RetrieveSourceParam source) {
    final Object t = this;
    final _Stripe tt = t;
    return promiseToFuture(tt.retrieveSource(source));
  }
}

/// Use `Stripe(publishableKey, options?)` to create an instance of the `Stripe` object.
/// The Stripe object is your entrypoint to the rest of the Stripe.js SDK.
/// Your Stripe publishable [API key](https://stripe.com/docs/keys) is required when calling this function, as it identifies your website to Stripe.
/// When you’re ready to accept live payments, replace the test key with your live key in production.
/// Learn more about how API keys work in [test mode and live mode](https://stripe.com/docs/dashboard#viewing-test-data).
typedef Stripe StripeConstructor(

    /// Your publishable key.
    String publishableKey,
    [

    /// Initialization options.
    StripeConstructorOptions options]);

@anonymous
@JS()
abstract class StripeConstructorOptions {
  /// For usage with [Connect](https://stripe.com/docs/connect) only.
  /// Specifying a connected account ID (e.g., `acct_24BFMpJ1svR5A89k`) allows you to perform actions on behalf of that account.
  external String get stripeAccount;
  external set stripeAccount(String v);

  /// Override your account's [API version](https://stripe.com/docs/api/versioning).
  external String get apiVersion;
  external set apiVersion(String v);

  /// The [IETF language tag](https://en.wikipedia.org/wiki/IETF_language_tag) used to globally configure localization in Stripe.js.
  /// Setting the locale here will localize error strings for all Stripe.js methods.
  /// It will also configure the locale for [Elements](#element_mount) and [Checkout](https://stripe.com/docs/js/checkout/redirect_to_checkout). Default is `auto` (Stripe detects the locale of the browser).
  /// Supported values depend on which features you are using.
  /// Checkout supports a slightly different set of locales than the rest of Stripe.js.
  /// If you are planning on using Checkout, make sure to use a [value](#checkout_redirect_to_checkout-options-locale) that it supports.
  external String /*'auto'|'ar'|'da'|'de'|'en'|'es'|'fi'|'fr'|'he'|'it'|'ja'|'lt'|'lv'|'ms'|'nb'|'nl'|'no'|'pl'|'pt'|'pt-BR'|'ru'|'sv'|'zh'*/ get locale;
  external set locale(
      String /*'auto'|'ar'|'da'|'de'|'en'|'es'|'fi'|'fr'|'he'|'it'|'ja'|'lt'|'lv'|'ms'|'nb'|'nl'|'no'|'pl'|'pt'|'pt-BR'|'ru'|'sv'|'zh'*/ v);
  external factory StripeConstructorOptions(
      {String stripeAccount,
      String apiVersion,
      String /*'auto'|'ar'|'da'|'de'|'en'|'es'|'fi'|'fr'|'he'|'it'|'ja'|'lt'|'lv'|'ms'|'nb'|'nl'|'no'|'pl'|'pt'|'pt-BR'|'ru'|'sv'|'zh'*/ locale});
}

/*type StripeErrorType =
    /**
     * Failure to connect to Stripe's API.
     */
    | 'api_connection_error'

    /**
     * API errors cover any other type of problem (e.g., a temporary problem with Stripe's servers), and are extremely uncommon.
     */
    | 'api_error'

    /**
     * Failure to properly authenticate yourself in the request.
     */
    | 'authentication_error'

    /**
     * Card errors are the most common type of error you should expect to handle.
     * They result when the user enters a card that can't be charged for some reason.
     */
    | 'card_error'

    /**
     * Idempotency errors occur when an `Idempotency-Key` is re-used on a request that does not match the first request's API endpoint and parameters.
     */
    | 'idempotency_error'

    /**
     * Invalid request errors arise when your request has invalid parameters.
     */
    | 'invalid_request_error'

    /**
     * Too many requests hit the API too quickly.
     */
    | 'rate_limit_error'

    /**
     * Errors triggered by our client-side libraries when failing to validate fields (e.g., when a card number or expiration date is invalid or incomplete).
     */
    | 'validation_error';
*/
@anonymous
@JS()
abstract class StripeError {
  /// The type of error.
  external String /*'api_connection_error'|'api_error'|'authentication_error'|'card_error'|'idempotency_error'|'invalid_request_error'|'rate_limit_error'|'validation_error'*/ get type;
  external set type(
      String /*'api_connection_error'|'api_error'|'authentication_error'|'card_error'|'idempotency_error'|'invalid_request_error'|'rate_limit_error'|'validation_error'*/ v);

  /// For card errors, the ID of the failed charge
  external String get charge;
  external set charge(String v);

  /// For some errors that could be handled programmatically, a short string indicating the [error code](https://stripe.com/docs/error-codes) reported.
  external String get code;
  external set code(String v);

  /// For card errors resulting from a card issuer decline, a short string indicating the [card issuer’s reason for the decline](https://stripe.com/docs/declines#issuer-declines) if they provide one.
  external String get decline_code;
  external set decline_code(String v);

  /// A URL to more information about the [error code](https://stripe.com/docs/error-codes) reported.
  external String get doc_url;
  external set doc_url(String v);

  /// A human-readable message providing more details about the error. For card errors, these messages can be shown to your users.
  external String get message;
  external set message(String v);

  /// If the error is parameter-specific, the parameter related to the error.
  /// For example, you can use this to display a message near the correct form field.
  external String get param;
  external set param(String v);

  /// The `PaymentIntent` object for errors returned on a request involving a `PaymentIntent`.
  external PaymentIntent get payment_intent;
  external set payment_intent(PaymentIntent v);

  /// The `PaymentMethod` object for errors returned on a request involving a `PaymentMethod`.
  external PaymentMethod get payment_method;
  external set payment_method(PaymentMethod v);

  /// The `SetupIntent` object for errors returned on a request involving a `SetupIntent`.
  external SetupIntent get setup_intent;
  external set setup_intent(SetupIntent v);

  /// The `Source` object for errors returned on a request involving a `Source`.
  external Source get source;
  external set source(Source v);
  external factory StripeError(
      {String /*'api_connection_error'|'api_error'|'authentication_error'|'card_error'|'idempotency_error'|'invalid_request_error'|'rate_limit_error'|'validation_error'*/ type,
      String charge,
      String code,
      String decline_code,
      String doc_url,
      String message,
      String param,
      PaymentIntent payment_intent,
      PaymentMethod payment_method,
      SetupIntent setup_intent,
      Source source});
}

// End module @stripe/stripe-js
@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
