@JS()
library stripe_js.elements.iban;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeIbanElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeIbanElementOptions {
  external StripeElementClasses get classes;
  external set classes(StripeElementClasses v);
  external StripeElementStyle get style;
  external set style(StripeElementStyle v);
  external List<String> get supportedCountries;
  external set supportedCountries(List<String> v);
  external String get placeholderCountry;
  external set placeholderCountry(String v);

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
  external factory StripeIbanElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      List<String> supportedCountries,
      String placeholderCountry,
      String /*'default'|'solid'*/ iconStyle,
      bool hideIcon,
      bool disabled});
}

@anonymous
@JS()
abstract class StripeIbanElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'iban'*/ get elementType;
  external set elementType(String /*'iban'*/ v);
  external String get country;
  external set country(String v);
  external String get bankName;
  external set bankName(String v);
  external factory StripeIbanElementChangeEvent(
      {String /*'iban'*/ elementType,
      String country,
      String bankName,
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
