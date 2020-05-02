@JS()
library stripe_js.elements.card_cvc;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeCardCvcElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeCardCvcElementOptions {
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
  external factory StripeCardCvcElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      String placeholder,
      bool disabled});
}

@anonymous
@JS()
abstract class StripeCardCvcElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'cardCvc'*/ get elementType;
  external set elementType(String /*'cardCvc'*/ v);
  external factory StripeCardCvcElementChangeEvent(
      {String /*'cardCvc'*/ elementType,
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
