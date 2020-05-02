@JS()
library stripe_js.elements.card_number;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeCardNumberElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeCardNumberElementOptions {
  external StripeElementClasses get classes;
  external set classes(StripeElementClasses v);
  external StripeElementStyle get style;
  external set style(StripeElementStyle v);
  external String get placeholder;
  external set placeholder(String v);

  /// Applies a disabled state to the Element such that user input is not accepted.
  /// Default is false.
  external bool get disabled;
  external set disabled(bool v);

  /// Show a card brand icon in the Element.
  /// Default is `false`.
  external bool get showIcon;
  external set showIcon(bool v);

  /// Appearance of the brand icon in the Element.
  external String /*'default'|'solid'*/ get iconStyle;
  external set iconStyle(String /*'default'|'solid'*/ v);
  external factory StripeCardNumberElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      String placeholder,
      bool disabled,
      bool showIcon,
      String /*'default'|'solid'*/ iconStyle});
}

@anonymous
@JS()
abstract class StripeCardNumberElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'cardNumber'*/ get elementType;
  external set elementType(String /*'cardNumber'*/ v);

  /// The card brand of the card number being entered.
  external String /*'visa'|'mastercard'|'amex'|'discover'|'diners'|'jcb'|'unionpay'|'unknown'*/ get brand;
  external set brand(
      String /*'visa'|'mastercard'|'amex'|'discover'|'diners'|'jcb'|'unionpay'|'unknown'*/ v);
  external factory StripeCardNumberElementChangeEvent(
      {String /*'cardNumber'*/ elementType,
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
