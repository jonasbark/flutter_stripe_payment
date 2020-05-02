@JS()
library stripe_js.elements.base;

import "package:js/js.dart";

// Module @stripe/stripe-js
@anonymous
@JS()
abstract class StripeElementBase {
  /// The `element.mount` method attaches your [Element](https://stripe.com/docs/js/element) to the DOM.
  /// `element.mount` accepts either a CSS Selector (e.g., `'#card-element'`) or a DOM element.
  /// You need to create a container DOM element to mount an `Element`.
  /// If the container DOM element has a label, the `Element` is automatically focused when its label is clicked.
  /// There are two ways to do this:
  /// 1. Mount the instance within a `<label>`.
  /// 2. Create a `<label>` with a `for` attribute, referencing the ID of your container.
  @JS("@stripe/stripe-js.mount")
  external void mount(dynamic /*String|HTMLElement*/ domElement);

  /// Blurs the element.
  @JS("@stripe/stripe-js.blur")
  external void blur();

  /// Clears the value(s) of the element.
  @JS("@stripe/stripe-js.clear")
  external void clear();

  /// Removes the element from the DOM and destroys it.
  /// A destroyed element can not be re-activated or re-mounted to the DOM.
  @JS("@stripe/stripe-js.destroy")
  external void destroy();

  /// Focuses the element.
  @JS("@stripe/stripe-js.focus")
  external void focus();

  /// Unmounts the element from the DOM.
  /// Call `element.mount` to re-attach it to the DOM.
  @JS("@stripe/stripe-js.unmount")
  external void unmount();
}

/// Customize the appearance of an element using CSS properties passed in a `Style` object, which consists of CSS properties nested under objects for each variant.
@anonymous
@JS()
abstract class StripeElementStyle {
  /// Base variant—all other variants inherit from these styles.
  external StripeElementStyleVariant get base;
  external set base(StripeElementStyleVariant v);

  /// Applied when the element has valid input.
  external StripeElementStyleVariant get complete;
  external set complete(StripeElementStyleVariant v);

  /// Applied when the element has no customer input.
  external StripeElementStyleVariant get empty;
  external set empty(StripeElementStyleVariant v);

  /// Applied when the element has invalid input.
  external StripeElementStyleVariant get invalid;
  external set invalid(StripeElementStyleVariant v);
  external factory StripeElementStyle(
      {StripeElementStyleVariant base,
      StripeElementStyleVariant complete,
      StripeElementStyleVariant empty,
      StripeElementStyleVariant invalid});
}

/// An object with `CSSProperties` supported by Stripe.js.
/// Pseudo-classes and pseudo-elements can also be styled using a nested object inside of a variant.
@anonymous
@JS()
abstract class StripeElementStyleVariant implements StripeElementCSSProperties {
  /*external StripeElementCSSProperties get :hover;*/
  /*external set :hover(StripeElementCSSProperties v);*/
  /*external StripeElementCSSProperties get :focus;*/
  /*external set :focus(StripeElementCSSProperties v);*/
  /*external StripeElementCSSProperties get ::placeholder;*/
  /*external set ::placeholder(StripeElementCSSProperties v);*/
  /*external StripeElementCSSProperties get ::selection;*/
  /*external set ::selection(StripeElementCSSProperties v);*/
  /*external StripeElementCSSProperties get :-webkit-autofill;*/
  /*external set :-webkit-autofill(StripeElementCSSProperties v);*/
  /// Available for all elements except the `paymentRequestButton` element
  /*external StripeElementCSSProperties get :disabled;*/
  /*external set :disabled(StripeElementCSSProperties v);*/
  /// Available for the `cardNumber`, `cardExpiry`, and `cardCvc` elements.
  /*external StripeElementCSSProperties&{display: string} get ::-ms-clear;*/
  /*external set ::-ms-clear(StripeElementCSSProperties&{display: string} v);*/
  external factory StripeElementStyleVariant(
      {
//      StripeElementCSSProperties: hover,
//      StripeElementCSSProperties: focus,
//      StripeElementCSSProperties: disabled,
      String

          /// The [background-color](https://developer.mozilla.org/en-US/docs/Web/CSS/background-color) CSS property.
          /// This property works best with the `::selection` pseudo-class.
          /// In other cases, consider setting the background color on the element's container instaed.
          backgroundColor,
      String

          /// The [color](https://developer.mozilla.org/en-US/docs/Web/CSS/color) CSS property.
          color,
      String

          /// The [font-family](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family) CSS property.
          fontFamily,
      String

          /// The [font-size](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size) CSS property.
          fontSize,
      String

          /// The [font-smoothing](https://developer.mozilla.org/en-US/docs/Web/CSS/font-smoothing) CSS property.
          fontSmoothing,
      String

          /// The [font-style](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style) CSS property.
          fontStyle,
      String

          /// The [font-variant](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant) CSS property.
          fontVariant,
      String

          /// The [font-weight](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight) CSS property.
          fontWeight,
      String

          /// A custom property, used to set the color of the icons that are rendered in an element.
          iconColor,
      String

          /// The [line-height](https://developer.mozilla.org/en-US/docs/Web/CSS/line-height) CSS property.
          /// To avoid cursors being rendered inconsistently across browsers, consider using a padding on the element's container instead.
          lineHeight,
      String

          /// The [letter-spacing](https://developer.mozilla.org/en-US/docs/Web/CSS/letter-spacing) CSS property.
          letterSpacing,
      String

          /// The [text-align](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align) CSS property.
          /// Available for the `cardNumber`, `cardExpiry`, and `cardCvc` elements.
          textAlign,
      num

          /// The [padding](https://developer.mozilla.org/en-US/docs/Web/CSS/padding) CSS property.
          /// Available for the `idealBank` element.
          /// Accepts integer `px` values.
          padding,
      String

          /// The [text-decoration](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration) CSS property.
          textDecoration,
      String

          /// The [text-shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow) CSS property.
          textShadow,
      String

          /// The [text-transform](https://developer.mozilla.org/en-US/docs/Web/CSS/text-transform) CSS property.
          textTransform});
}

@anonymous
@JS()
abstract class StripeElementCSSProperties {
  external String get backgroundColor;
  external set backgroundColor(String v);
  external String get color;
  external set color(String v);
  external String get fontFamily;
  external set fontFamily(String v);
  external String get fontSize;
  external set fontSize(String v);
  external String get fontSmoothing;
  external set fontSmoothing(String v);
  external String get fontStyle;
  external set fontStyle(String v);
  external String get fontVariant;
  external set fontVariant(String v);
  external String get fontWeight;
  external set fontWeight(String v);
  external String get iconColor;
  external set iconColor(String v);
  external String get lineHeight;
  external set lineHeight(String v);
  external String get letterSpacing;
  external set letterSpacing(String v);
  external String get textAlign;
  external set textAlign(String v);
  external num get padding;
  external set padding(num v);
  external String get textDecoration;
  external set textDecoration(String v);
  external String get textShadow;
  external set textShadow(String v);
  external String get textTransform;
  external set textTransform(String v);
  external factory StripeElementCSSProperties(
      {String backgroundColor,
      String color,
      String fontFamily,
      String fontSize,
      String fontSmoothing,
      String fontStyle,
      String fontVariant,
      String fontWeight,
      String iconColor,
      String lineHeight,
      String letterSpacing,
      String textAlign,
      num padding,
      String textDecoration,
      String textShadow,
      String textTransform});
}

/// Use `Classes` to set custom class names on the container DOM element when the Stripe element is in a particular state.
@anonymous
@JS()
abstract class StripeElementClasses {
  /// The base class applied to the container.
  /// Defaults to `StripeElement`.
  external String get base;
  external set base(String v);

  /// The class name to apply when the `Element` is complete.
  /// Defaults to `StripeElement--complete`.
  external String get complete;
  external set complete(String v);

  /// The class name to apply when the `Element` is empty.
  /// Defaults to `StripeElement--empty`.
  external String get empty;
  external set empty(String v);

  /// The class name to apply when the `Element` is focused.
  /// Defaults to `StripeElement--focus`.
  external String get focus;
  external set focus(String v);

  /// The class name to apply when the `Element` is invalid.
  /// Defaults to `StripeElement--invalid`.
  external String get invalid;
  external set invalid(String v);

  /// The class name to apply when the `Element` has its value autofilled by the browser (only on Chrome and Safari).
  /// Defaults to `StripeElement--webkit-autofill`.
  external String get webkitAutoFill;
  external set webkitAutoFill(String v);
  external factory StripeElementClasses(
      {String base,
      String complete,
      String empty,
      String focus,
      String invalid,
      String webkitAutoFill});
}

@anonymous
@JS()
abstract class StripeElementChangeEvent {
  /// The type of element that emitted this event.
  external String /*'auBankAccount'|'card'|'cardNumber'|'cardExpiry'|'cardCvc'|'fpxBank'|'iban'|'idealBank'|'paymentRequestButton'*/ get elementType;
  external set elementType(
      String /*'auBankAccount'|'card'|'cardNumber'|'cardExpiry'|'cardCvc'|'fpxBank'|'iban'|'idealBank'|'paymentRequestButton'*/ v);

  /// `true` if the value is empty.
  external bool get empty;
  external set empty(bool v);

  /// `true` if the value is well-formed and potentially complete.
  /// The `complete` value can be used to progressively disclose the next parts of your form or to enable form submission.
  /// It is not an indicator of whether a customer is done with their input—it only indicates that the Element contains a potentially complete, well-formed value.
  /// In many cases the customer could still add further input.
  /// The `complete` value should not be used to perform an action such as advancing the cursor to a subsequent field or performing a tokenization request.
  external bool get complete;
  external set complete(bool v);

  /// The current validation error, if any.
  external dynamic
      /*dynamic|{
          type: 'validation_error';
          code: string;
          message: string;
        }*/
      get error;
  external set error(
      dynamic
          /*dynamic|{
          type: 'validation_error';
          code: string;
          message: string;
        }*/
          v);
  external factory StripeElementChangeEvent(
      {String /*'auBankAccount'|'card'|'cardNumber'|'cardExpiry'|'cardCvc'|'fpxBank'|'iban'|'idealBank'|'paymentRequestButton'*/ elementType,
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
