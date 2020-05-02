@JS()
library stripe_js.elements.ideal_bank;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeIdealBankElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeIdealBankElementOptions {
  external StripeElementClasses get classes;
  external set classes(StripeElementClasses v);
  external StripeElementStyle get style;
  external set style(StripeElementStyle v);

  /// Appearance of the icon in the Element.
  external String /*'default'|'solid'*/ get iconStyle;
  external set iconStyle(String /*'default'|'solid'*/ v);

  /// A pre-filled value for the Element.
  /// Can be one of the banks listed in the [iDEAL guide](https://stripe.com/docs/sources/ideal#specifying-customer-bank) (e.g., `abn_amro`).
  external String get value;
  external set value(String v);

  /// Hides the icon in the Element.
  /// Default is `false`.
  external bool get hideIcon;
  external set hideIcon(bool v);

  /// Applies a disabled state to the Element such that user input is not accepted.
  /// Default is false.
  external bool get disabled;
  external set disabled(bool v);
  external factory StripeIdealBankElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      String /*'default'|'solid'*/ iconStyle,
      String value,
      bool hideIcon,
      bool disabled});
}

@anonymous
@JS()
abstract class StripeIdealBankElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'idealBank'*/ get elementType;
  external set elementType(String /*'idealBank'*/ v);

  /// The selected bank.
  /// Can be one of the banks listed in the [iDEAL guide](https://stripe.com/docs/sources/ideal#specifying-customer-bank).
  external String get value;
  external set value(String v);
  external factory StripeIdealBankElementChangeEvent(
      {String /*'idealBank'*/ elementType,
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
