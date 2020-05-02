@JS()
library stripe_js.payment_intents;

import "package:js/js.dart";
import "../api/PaymentMethods.dart"
    show PaymentMethodCreateParams, PaymentMethodCreateParams_BillingDetails;
import "elements/base.dart" show StripeElementBase;
import "../api/shared.dart" show MetadataParam;
import "../api/PaymentIntents.dart" show PaymentIntentConfirmParams, PaymentIntentConfirmParams_Shipping;

// Module @stripe/stripe-js
/// Polyfill for TypeScript < 3.5 compatibility
/*type Omit<T, K extends keyof any> = Pick<T, Exclude<keyof T, K>>;*/
/*type CreatePaymentMethodData =
    | CreatePaymentMethodAuBecsDebitData
    | CreatePaymentMethodCardData
    | CreatePaymentMethodIdealData
    | CreatePaymentMethodFpxData
    | CreatePaymentMethodSepaDebitData;
*/
@anonymous
@JS()
abstract class CreatePaymentMethodCardData
    implements PaymentMethodCreateParams {
  external String /*'card'*/ get type;
  external set type(String /*'card'*/ v);
  external dynamic
      /*StripeElementBase&{
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
  }|{token: string}*/
      get card;
  external set card(
      dynamic
          /*StripeElementBase&{
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
  }|{token: string}*/
          v);
  external factory CreatePaymentMethodCardData(
      {String /*'card'*/ type,
      dynamic
          /*StripeElementBase&{
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
  }|{token: string}*/
          card,
      PaymentMethodCreateParams_BillingDetails billing_details,
      MetadataParam metadata,
      String payment_method});
}

@anonymous
@JS()
abstract class CreatePaymentMethodFpxData implements PaymentMethodCreateParams {
  external String /*'fpx'*/ get type;
  external set type(String /*'fpx'*/ v);
  external dynamic
      /*StripeElementBase&{
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
  }|{
          /**
           * The customer's bank.
           */
          bank: string;
        }*/
      get fpx;
  external set fpx(
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * The customer's bank.
           */
          bank: string;
        }*/
          v);
  external factory CreatePaymentMethodFpxData(
      {String /*'fpx'*/ type,
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * The customer's bank.
           */
          bank: string;
        }*/
          fpx,
      PaymentMethodCreateParams_BillingDetails billing_details,
      MetadataParam metadata,
      String payment_method});
}

@anonymous
@JS()
abstract class CreatePaymentMethodIdealData
    implements PaymentMethodCreateParams {
  external String /*'ideal'*/ get type;
  external set type(String /*'ideal'*/ v);
  external dynamic
      /*StripeElementBase&{
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
  }|{
          /**
           * The customer's bank.
           */
          bank?: string;
        }*/
      get ideal;
  external set ideal(
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * The customer's bank.
           */
          bank?: string;
        }*/
          v);
  external factory CreatePaymentMethodIdealData(
      {String /*'ideal'*/ type,
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * The customer's bank.
           */
          bank?: string;
        }*/
          ideal,
      PaymentMethodCreateParams_BillingDetails billing_details,
      MetadataParam metadata,
      String payment_method});
}

@anonymous
@JS()
abstract class CreatePaymentMethodSepaDebitData
    implements PaymentMethodCreateParams {
  external String /*'sepa_debit'*/ get type;
  external set type(String /*'sepa_debit'*/ v);
  external dynamic
      /*StripeElementBase&{
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
  }|{
          /**
           * An IBAN account number.
           */
          iban: string;
        }*/
      get sepa_debit;
  external set sepa_debit(
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * An IBAN account number.
           */
          iban: string;
        }*/
          v);

  /// The customer's billing details.
  /// `name` and `email` are required.
  /// @docs https://stripe.com/docs/api/payment_methods/create#create_payment_method-billing_details
  external PaymentMethodCreateParams_BillingDetails
      /*PaymentMethodCreateParams_BillingDetails&{
      name: string;
      email: string;
    }*/
      get billing_details;
  external set billing_details(
      PaymentMethodCreateParams_BillingDetails
          /*PaymentMethodCreateParams_BillingDetails&{
      name: string;
      email: string;
    }*/
          v);
  external factory CreatePaymentMethodSepaDebitData(
      {String /*'sepa_debit'*/ type,
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * An IBAN account number.
           */
          iban: string;
        }*/
          sepa_debit,
      PaymentMethodCreateParams_BillingDetails
          /*PaymentMethodCreateParams_BillingDetails&{
      name: string;
      email: string;
    }*/
          billing_details,
      MetadataParam metadata,
      String payment_method});
}

@anonymous
@JS()
abstract class CreatePaymentMethodAuBecsDebitData
    implements PaymentMethodCreateParams {
  /// Requires beta access:
  /// Contact [Stripe support](https://support.stripe.com/) for more information.
  external String /*'au_becs_debit'*/ get type;
  external set type(String /*'au_becs_debit'*/ v);

  /// Requires beta access:
  /// Contact [Stripe support](https://support.stripe.com/) for more information.
  external dynamic
      /*StripeElementBase&{
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
  }|{
          /**
           * A BSB number.
           */
          bsb_number: string;

          /**
           * An account number.
           */
          account_number: string;
        }*/
      get au_becs_debit;
  external set au_becs_debit(
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * A BSB number.
           */
          bsb_number: string;

          /**
           * An account number.
           */
          account_number: string;
        }*/
          v);

  /// The customer's billing details.
  /// `name` and `email` are required.
  /// @docs https://stripe.com/docs/api/payment_methods/create#create_payment_method-billing_details
  external PaymentMethodCreateParams_BillingDetails
      /*PaymentMethodCreateParams_BillingDetails&{
      name: string;
      email: string;
    }*/
      get billing_details;
  external set billing_details(
      PaymentMethodCreateParams_BillingDetails
          /*PaymentMethodCreateParams_BillingDetails&{
      name: string;
      email: string;
    }*/
          v);
  external factory CreatePaymentMethodAuBecsDebitData(
      {String /*'au_becs_debit'*/ type,
      dynamic
          /*StripeElementBase&{
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
  }|{
          /**
           * A BSB number.
           */
          bsb_number: string;

          /**
           * An account number.
           */
          account_number: string;
        }*/
          au_becs_debit,
      PaymentMethodCreateParams_BillingDetails
          /*PaymentMethodCreateParams_BillingDetails&{
      name: string;
      email: string;
    }*/
          billing_details,
      MetadataParam metadata,
      String payment_method});
}

/// Data to be sent with a `stripe.confirmCardPayment` request.
/// Refer to the [Payment Intents API](https://stripe.com/docs/api/payment_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmCardPaymentData implements PaymentIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `PaymentIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);
  external factory ConfirmCardPaymentData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String /*String|''*/ receipt_email,
      String return_url,
      bool save_payment_method,
      String /*'off_session'|'on_session'|Null*/ setup_future_usage,
      PaymentIntentConfirmParams_Shipping /*PaymentIntentConfirmParams_Shipping|Null*/ shipping});
}

/// An options object to control the behavior of `stripe.confirmCardPayment`.
@anonymous
@JS()
abstract class ConfirmCardPaymentOptions {
  /// Set this to `false` if you want to [handle next actions yourself](https://stripe.com/docs/payments/payment-intents/verifying-status#next-actions), or if you want to defer next action handling until later (e.g. for use in the [PaymentRequest API](https://stripe.com/docs/stripe-js/elements/payment-request-button#complete-payment-intents)).
  /// Default is `true`.
  external bool get handleActions;
  external set handleActions(bool v);
  external factory ConfirmCardPaymentOptions({bool handleActions});
}

/// Data to be sent with a `stripe.confirmSepaDebitPayment` request.
/// Refer to the [Payment Intents API](https://stripe.com/docs/api/payment_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmSepaDebitPaymentData
    implements PaymentIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `PaymentIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);

  /// To save the SEPA Direct Debit account for reuse, set this parameter to `off_session`.
  /// SEPA Direct Debit only accepts an `off_session` value for this parameter.
  external String /*'off_session'*/ get setup_future_usage;
  external set setup_future_usage(String /*'off_session'*/ v);
  external factory ConfirmSepaDebitPaymentData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      String /*'off_session'*/ setup_future_usage,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String /*String|''*/ receipt_email,
      String return_url,
      bool save_payment_method,
      PaymentIntentConfirmParams_Shipping /*PaymentIntentConfirmParams_Shipping|Null*/ shipping});
}

/// Data to be sent with a `stripe.confirmFpxPayment` request.
/// Refer to the [Payment Intents API](https://stripe.com/docs/api/payment_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmFpxPaymentData implements PaymentIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `PaymentIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);

  /// The url your customer will be directed to after they complete authentication.
  /// @recommended
  external String get return_url;
  external set return_url(String v);
  external factory ConfirmFpxPaymentData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      String return_url,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String /*String|''*/ receipt_email,
      bool save_payment_method,
      String /*'off_session'|'on_session'|Null*/ setup_future_usage,
      PaymentIntentConfirmParams_Shipping /*PaymentIntentConfirmParams_Shipping|Null*/ shipping});
}

/// An options object to control the behavior of `stripe.confirmFpxPayment`.
@anonymous
@JS()
abstract class ConfirmFpxPaymentOptions {
  /// Set this to `false` if you want to [manually handle the authorization redirect](https://stripe.com/docs/payments/fpx#handle-redirect).
  /// Default is `true`.
  external bool get handleActions;
  external set handleActions(bool v);
  external factory ConfirmFpxPaymentOptions({bool handleActions});
}

/// Data to be sent with a `stripe.confirmIdealPayment` request.
/// Refer to the [Payment Intents API](https://stripe.com/docs/api/payment_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmIdealPaymentData implements PaymentIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `PaymentIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);

  /// The url your customer will be directed to after they complete authentication.
  /// @recommended
  external String get return_url;
  external set return_url(String v);
  external factory ConfirmIdealPaymentData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      String return_url,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String /*String|''*/ receipt_email,
      bool save_payment_method,
      String /*'off_session'|'on_session'|Null*/ setup_future_usage,
      PaymentIntentConfirmParams_Shipping /*PaymentIntentConfirmParams_Shipping|Null*/ shipping});
}

/// An options object to control the behavior of `stripe.confirmIdealPayment`.
@anonymous
@JS()
abstract class ConfirmIdealPaymentOptions {
  /// Set this to `false` if you want to [manually handle the authorization redirect](https://stripe.com/docs/payments/ideal#handle-redirect).
  /// Default is `true`.
  external bool get handleActions;
  external set handleActions(bool v);
  external factory ConfirmIdealPaymentOptions({bool handleActions});
}

/// Data to be sent with a `stripe.confirmAuBecsDebitPayment` request.
/// Refer to the [Payment Intents API](https://stripe.com/docs/api/payment_intents/confirm) for a full list of parameters.
@anonymous
@JS()
abstract class ConfirmAuBecsDebitPaymentData
    implements PaymentIntentConfirmParams {
  /// Either the `id` of an existing [PaymentMethod](https://stripe.com/docs/api/payment_methods), or an object containing data to create a `PaymentMethod` with.
  /// This field is optional if a `PaymentMethod` has already been attached to this `PaymentIntent`.
  /// @recommended
  external dynamic /*String|Pick<TExclude<keyof TK>>*/ get payment_method;
  external set payment_method(dynamic /*String|Pick<TExclude<keyof TK>>*/ v);

  /// To save the BECS Direct Debit account for reuse, set this parameter to `off_session`.
  /// BECS Direct Debit only accepts an `off_session` value for this parameter.
  external String /*'off_session'*/ get setup_future_usage;
  external set setup_future_usage(String /*'off_session'*/ v);
  external factory ConfirmAuBecsDebitPaymentData(
      {dynamic /*String|Pick<TExclude<keyof TK>>*/ payment_method,
      String /*'off_session'*/ setup_future_usage,
      dynamic /*JSMap of <String,dynamic>*/ mandate_data,
      String /*String|''*/ receipt_email,
      String return_url,
      bool save_payment_method,
      PaymentIntentConfirmParams_Shipping /*PaymentIntentConfirmParams_Shipping|Null*/ shipping});
}

// End module @stripe/stripe-js
