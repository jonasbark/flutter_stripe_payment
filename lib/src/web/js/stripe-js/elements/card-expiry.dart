@JS()
library stripe_js.elements.card_expiry;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeCardExpiryElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeCardExpiryElementOptions {
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
  external factory StripeCardExpiryElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      String placeholder,
      bool disabled});
}

@anonymous
@JS()
abstract class StripeCardExpiryElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'cardExpiry'*/ get elementType;
  external set elementType(String /*'cardExpiry'*/ v);
  external factory StripeCardExpiryElementChangeEvent(
      {String /*'cardExpiry'*/ elementType,
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
