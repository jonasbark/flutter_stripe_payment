@JS()
library stripe_js.elements.card;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeCardElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeCardElementOptions {
  external StripeElementClasses get classes;
  external set classes(StripeElementClasses v);
  external StripeElementStyle get style;
  external set style(StripeElementStyle v);

  /// A pre-filled set of values to include in the input (e.g., `{postalCode: '94110'}`).
  /// Note that sensitive card information (card number, CVC, and expiration date) cannot be pre-filled.
  external dynamic /*{postalCode?: string}*/ get value;
  external set value(dynamic /*{postalCode?: string}*/ v);

  /// Hide the postal code field.
  /// Default is `false`.
  /// If you are already collecting a full billing address or postal code elsewhere, set this to `true`.
  external bool get hidePostalCode;
  external set hidePostalCode(bool v);

  /// Appearance of the icon in the Element.
  external String /*'default'|'solid'*/ get iconStyle;
  external set iconStyle(String /*'default'|'solid'*/ v);

  /// Hides the icon in the Element.
  /// Default is `false`.
  external bool get hideIcon;
  external set hideIcon(bool v);

  /// Applies a disabled state to the Element such that user input is not accepted.
  /// Default is false.
  external bool get disabled;
  external set disabled(bool v);
  external factory StripeCardElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      dynamic /*{postalCode?: string}*/ value,
      bool hidePostalCode,
      String /*'default'|'solid'*/ iconStyle,
      bool hideIcon,
      bool disabled});
}

@anonymous
@JS()
abstract class StripeCardElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'card'*/ get elementType;
  external set elementType(String /*'card'*/ v);

  /// An object containing the currently entered `postalCode`.
  external dynamic /*{postalCode: string}*/ get value;
  external set value(dynamic /*{postalCode: string}*/ v);

  /// The card brand of the card number being entered.
  external String /*'visa'|'mastercard'|'amex'|'discover'|'diners'|'jcb'|'unionpay'|'unknown'*/ get brand;
  external set brand(
      String /*'visa'|'mastercard'|'amex'|'discover'|'diners'|'jcb'|'unionpay'|'unknown'*/ v);
  external factory StripeCardElementChangeEvent(
      {String /*'card'*/ elementType,
      dynamic /*{postalCode: string}*/ value,
      String /*'visa'|'mastercard'|'amex'|'discover'|'diners'|'jcb'|'unionpay'|'unknown'*/ brand,
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
