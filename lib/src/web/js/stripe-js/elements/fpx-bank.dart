@JS()
library stripe_js.elements.fpx_bank;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeFpxBankElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeFpxBankElementOptions {
  external StripeElementClasses get classes;
  external set classes(StripeElementClasses v);
  external StripeElementStyle get style;
  external set style(StripeElementStyle v);

  /// A pre-filled value for the Element.
  /// Can be one of the banks listed in the [FPX guide](https://stripe.com/docs/payments/fpx#bank-reference) (e.g., `affin_bank`).
  external String get value;
  external set value(String v);

  /// The type of the FPX accountholder.
  external String /*'individual'|'company'*/ get accountHolderType;
  external set accountHolderType(String /*'individual'|'company'*/ v);

  /// Applies a disabled state to the Element such that user input is not accepted.
  /// Default is false.
  external bool get disabled;
  external set disabled(bool v);
  external factory StripeFpxBankElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      String value,
      String /*'individual'|'company'*/ accountHolderType,
      bool disabled});
}

@anonymous
@JS()
abstract class StripeFpxBankElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'fpxBank'*/ get elementType;
  external set elementType(String /*'fpxBank'*/ v);

  /// The selected bank.
  /// Can be one of the banks listed in the [FPX guide](https://stripe.com/docs/payments/fpx#bank-reference).
  external String get value;
  external set value(String v);
  external factory StripeFpxBankElementChangeEvent(
      {String /*'fpxBank'*/ elementType,
      String value,
      bool empty,
      bool complete,
      dynamic
          /*dynamic|{
          type: 'validation_error';
          code: string;
          message: string;
        }*/
          error});
}

// End module @stripe/stripe-js
