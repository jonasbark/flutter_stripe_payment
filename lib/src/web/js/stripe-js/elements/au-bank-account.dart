@JS()
library stripe_js.elements.au_bank_account;

import "package:js/js.dart";
import "base.dart"
    show StripeElementClasses, StripeElementStyle, StripeElementChangeEvent;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripeAuBankAccountElement = StripeElementBase & {
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
  };
*/
@anonymous
@JS()
abstract class StripeAuBankAccountElementOptions {
  external StripeElementClasses get classes;
  external set classes(StripeElementClasses v);
  external StripeElementStyle get style;
  external set style(StripeElementStyle v);

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
  external factory StripeAuBankAccountElementOptions(
      {StripeElementClasses classes,
      StripeElementStyle style,
      String /*'default'|'solid'*/ iconStyle,
      bool hideIcon,
      bool disabled});
}

@anonymous
@JS()
abstract class StripeAuBankAccountElementChangeEvent
    implements StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'auBankAccount'*/ get elementType;
  external set elementType(String /*'auBankAccount'*/ v);

  /// The bank name corresponding to the entered BSB.
  external String get bankName;
  external set bankName(String v);

  /// The branch name corresponding to the entered BSB.
  external String get branchName;
  external set branchName(String v);
  external factory StripeAuBankAccountElementChangeEvent(
      {String /*'auBankAccount'*/ elementType,
      String bankName,
      String branchName,
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
