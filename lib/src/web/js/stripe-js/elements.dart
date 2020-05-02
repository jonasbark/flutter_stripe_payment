@JS()
library stripe_js.elements;

import "package:js/js.dart";
import "elements/base.dart" show StripeElementBase;
import "elements/au-bank-account.dart" show StripeAuBankAccountElementOptions;
import "elements/card.dart" show StripeCardElementOptions;
import "elements/card-number.dart" show StripeCardNumberElementOptions;
import "elements/card-expiry.dart" show StripeCardExpiryElementOptions;
import "elements/card-cvc.dart" show StripeCardCvcElementOptions;
import "elements/fpx-bank.dart" show StripeFpxBankElementOptions;
import "elements/iban.dart" show StripeIbanElementOptions;
import "elements/ideal-bank.dart" show StripeIdealBankElementOptions;
import "elements/payment-request-button.dart"
    show StripePaymentRequestButtonElementOptions;

/// <reference path='./elements/card.d.ts' />
/// <reference path='./elements/card-number.d.ts' />
/// <reference path='./elements/card-expiry.d.ts' />
/// <reference path='./elements/card-cvc.d.ts' />
/// <reference path='./elements/iban.d.ts' />
/// <reference path='./elements/ideal-bank.d.ts' />
/// <reference path='./elements/fpx-bank.d.ts' />
/// <reference path='./elements/payment-request-button.d.ts' />
/// <reference path='./elements/au-bank-account.d.ts' />

// Module @stripe/stripe-js
@anonymous
@JS()
abstract class StripeElements {
  /// //////////////////////////
  /// auBankAccount
  /// //////////////////////////
  /// Requires beta access:
  /// Contact [Stripe support](https://support.stripe.com/) for more information.
  /// Creates an `AuBankAccountElement`.
  /*external StripeElementBase&{
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
  } create('auBankAccount' elementType, [StripeAuBankAccountElementOptions options]);*/
  /// //////////////////////////
  /// card
  /// //////////////////////////
  /// Creates a `CardElement`.
  /*external StripeElementBase&{
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
  } create('card' elementType, [StripeCardElementOptions options]);*/
  /// //////////////////////////
  /// cardNumber
  /// //////////////////////////
  /// Creates a `CardNumberElement`.
  /*external StripeElementBase&{
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
  } create('cardNumber' elementType, [StripeCardNumberElementOptions options]);*/
  /// //////////////////////////
  /// cardExpiry
  /// //////////////////////////
  /// Creates a `CardExpiryElement`.
  /*external StripeElementBase&{
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
  } create('cardExpiry' elementType, [StripeCardExpiryElementOptions options]);*/
  /// //////////////////////////
  /// cardCvc
  /// //////////////////////////
  /// Creates a `CardCvcElement`.
  /*external StripeElementBase&{
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
  } create('cardCvc' elementType, [StripeCardCvcElementOptions options]);*/
  /// //////////////////////////
  /// fpxBank
  /// //////////////////////////
  /// Creates an `FpxBankElement`.
  /*external StripeElementBase&{
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
  } create('fpxBank' elementType, StripeFpxBankElementOptions options);*/
  /// //////////////////////////
  /// iban
  /// //////////////////////////
  /// Creates an `IbanElement`.
  /*external StripeElementBase&{
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
  } create('iban' elementType, [StripeIbanElementOptions options]);*/
  /// //////////////////////////
  /// idealBank
  /// //////////////////////////
  /// Creates an `IdealBankElement`.
  /*external StripeElementBase&{
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
  } create('idealBank' elementType, [StripeIdealBankElementOptions options]);*/
  /// //////////////////////////
  /// paymentRequestButton
  /// //////////////////////////
  /// Creates a `PaymentRequestButtonElement`.
  /// @docs https://stripe.com/docs/stripe-js/elements/payment-request-button
  /*external StripeElementBase&{
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
  } create('paymentRequestButton' elementType, StripePaymentRequestButtonElementOptions options);*/
  external create(
      String /*'auBankAccount'|'card'|'cardNumber'|'cardExpiry'|'cardCvc'|'fpxBank'|'iban'|'idealBank'|'paymentRequestButton'*/ elementType,
      [dynamic /*StripeAuBankAccountElementOptions|StripeCardElementOptions|StripeCardNumberElementOptions|StripeCardExpiryElementOptions|StripeCardCvcElementOptions|StripeFpxBankElementOptions|StripeIbanElementOptions|StripeIdealBankElementOptions|StripePaymentRequestButtonElementOptions*/ options]);
  /*external StripeElementBase&{
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
  }|Null getElement('auBankAccount' elementType);*/
  /*external StripeElementBase&{
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
  }|Null getElement('card' elementType);*/
  /*external StripeElementBase&{
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
  }|Null getElement('cardNumber' elementType);*/
  /*external StripeElementBase&{
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
  }|Null getElement('cardExpiry' elementType);*/
  /*external StripeElementBase&{
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
  }|Null getElement('cardCvc' elementType);*/
  /*external StripeElementBase&{
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
  }|Null getElement('fpxBank' elementType);*/
  /*external StripeElementBase&{
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
  }|Null getElement('iban' elementType);*/
  /*external StripeElementBase&{
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
  }|Null getElement('idealBank' elementType);*/
  /// Looks up a previously created `Element` by its type.
  /*external StripeElementBase&{
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
  }|Null getElement('paymentRequestButton' elementType);*/
  external getElement(
      String /*'auBankAccount'|'card'|'cardNumber'|'cardExpiry'|'cardCvc'|'fpxBank'|'iban'|'idealBank'|'paymentRequestButton'*/ elementType);
}

/*type StripeElementType =
    | 'auBankAccount'
    | 'card'
    | 'cardNumber'
    | 'cardExpiry'
    | 'cardCvc'
    | 'fpxBank'
    | 'iban'
    | 'idealBank'
    | 'paymentRequestButton';
*/
/*type StripeElement =
    | StripeAuBankAccountElement
    | StripeCardElement
    | StripeCardNumberElement
    | StripeCardExpiryElement
    | StripeCardCvcElement
    | StripeFpxBankElement
    | StripeIbanElement
    | StripeIdealBankElement
    | StripePaymentRequestButtonElement;
*/
/// Options to create an `Elements` instance with.
@anonymous
@JS()
abstract class StripeElementsOptions {
  /// An array of custom fonts, which elements created from the `Elements` object can use.
  external List<dynamic /*CssFontSource|CustomFontSource*/ > get fonts;
  external set fonts(List<dynamic /*CssFontSource|CustomFontSource*/ > v);

  /// The [IETF language tag](https://en.wikipedia.org/wiki/IETF_language_tag) of the locale to display placeholders and error strings in.
  /// Default is `auto` (Stripe detects the locale of the browser).
  /// Setting the locale does not affect the behavior of postal code validation—a valid postal code for the billing country of the card is still required.
  external String /*'auto'|'ar'|'da'|'de'|'en'|'es'|'fi'|'fr'|'he'|'it'|'ja'|'lt'|'lv'|'ms'|'nb'|'nl'|'no'|'pl'|'pt'|'pt-BR'|'ru'|'sv'|'zh'*/ get locale;
  external set locale(
      String /*'auto'|'ar'|'da'|'de'|'en'|'es'|'fi'|'fr'|'he'|'it'|'ja'|'lt'|'lv'|'ms'|'nb'|'nl'|'no'|'pl'|'pt'|'pt-BR'|'ru'|'sv'|'zh'*/ v);
  external factory StripeElementsOptions(
      {List<dynamic /*CssFontSource|CustomFontSource*/ > fonts,
      String /*'auto'|'ar'|'da'|'de'|'en'|'es'|'fi'|'fr'|'he'|'it'|'ja'|'lt'|'lv'|'ms'|'nb'|'nl'|'no'|'pl'|'pt'|'pt-BR'|'ru'|'sv'|'zh'*/ locale});
}

/// Use a `CssFontSource` to pass custom fonts via a stylesheet URL when creating an `Elements` object.
@anonymous
@JS()
abstract class CssFontSource {
  /// A relative or absolute URL pointing to a CSS file with [@font-face](https://developer.mozilla.org/en/docs/Web/CSS/@font-face) definitions, for example:
  /// https://fonts.googleapis.com/css?family=Open+Sans
  /// Note that if you are using a [content security policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) (CSP), [additional directives](https://stripe.com/docs/security#content-security-policy) may be necessary.
  external String get cssSrc;
  external set cssSrc(String v);
  external factory CssFontSource({String cssSrc});
}

/// Use a `CustomFontSource` to pass custom fonts when creating an `Elements` object.
@anonymous
@JS()
abstract class CustomFontSource {
  /// The name to give the font
  external String get family;
  external set family(String v);

  /// A valid [src](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face/src) value pointing to your custom font file.
  /// This is usually (though not always) a link to a file with a `.woff` , `.otf`, or `.svg` suffix.
  external String get src;
  external set src(String v);

  /// A valid [font-display](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face/font-display) value.
  external String get display;
  external set display(String v);

  /// Defaults to `normal`.
  external String /*'normal'|'italic'|'oblique'*/ get style;
  external set style(String /*'normal'|'italic'|'oblique'*/ v);

  /// A valid [unicode-range](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face/unicode-range) value.
  external String get unicodeRange;
  external set unicodeRange(String v);

  /// A valid [font-weight](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight), as a string.
  external String get weight;
  external set weight(String v);
  external factory CustomFontSource(
      {String family,
      String src,
      String display,
      String /*'normal'|'italic'|'oblique'*/ style,
      String unicodeRange,
      String weight});
}

// End module @stripe/stripe-js
