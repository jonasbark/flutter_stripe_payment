@JS()
library stripe_js.elements.payment_request_button;

import "package:js/js.dart";
import "base.dart" show StripeElementClasses;
import "../payment-request.dart" show PaymentRequest;

/// <reference path='./base.d.ts' />

// Module @stripe/stripe-js
/*type StripePaymentRequestButtonElement = StripeElementBase & {
    /**
     * Triggered when the payment request button is clicked.
     */
    on(
      eventType: 'click',
      handler: (event: StripePaymentRequestButtonElementClickEvent) => any
    ): StripePaymentRequestButtonElement;

    /**
     * Triggered when the element is fully rendered and can accept `element.focus` calls.
     */
    on(
      eventType: 'ready',
      handler: () => any
    ): StripePaymentRequestButtonElement;

    /**
     * Triggered when the element gains focus.
     */
    on(
      eventType: 'focus',
      handler: () => any
    ): StripePaymentRequestButtonElement;

    /**
     * Triggered when the element loses focus.
     */
    on(
      eventType: 'blur',
      handler: () => any
    ): StripePaymentRequestButtonElement;

    /**
     * Updates the options the `PaymentRequestButtonElement` was initialized with.
     * Updates are merged into the existing configuration.
     *
     * The styles of an `PaymentRequestButtonElement` can be dynamically changed using `element.update`.
     * This method can be used to simulate CSS media queries that automatically adjust the size of elements when viewed on different devices.
     */
    update(
      options: Partial<
        Omit<StripePaymentRequestButtonElementOptions, 'paymentRequest'>
      >
    ): void;
  };
*/
@anonymous
@JS()
abstract class StripePaymentRequestButtonElementOptions {
  external StripeElementClasses get classes;
  external set classes(StripeElementClasses v);

  /// An object used to customize the appearance of the Payment Request Button.
  external dynamic
      /*{
      paymentRequestButton: {
        type?: 'default' | 'book' | 'buy' | 'donate';

        theme?: 'dark' | 'light' | 'light-outline';

        /**
         * The height of the Payment Request Button.
         */
        height?: string;
      };
    }*/
      get style;
  external set style(
      dynamic
          /*{
      paymentRequestButton: {
        type?: 'default' | 'book' | 'buy' | 'donate';

        theme?: 'dark' | 'light' | 'light-outline';

        /**
         * The height of the Payment Request Button.
         */
        height?: string;
      };
    }*/
          v);

  /// A `PaymentRequest` object used to configure the element.
  external PaymentRequest get paymentRequest;
  external set paymentRequest(PaymentRequest v);
  external factory StripePaymentRequestButtonElementOptions(
      {StripeElementClasses classes,
      dynamic
          /*{
      paymentRequestButton: {
        type?: 'default' | 'book' | 'buy' | 'donate';

        theme?: 'dark' | 'light' | 'light-outline';

        /**
         * The height of the Payment Request Button.
         */
        height?: string;
      };
    }*/
          style,
      PaymentRequest paymentRequest});
}

@anonymous
@JS()
abstract class StripePaymentRequestButtonElementClickEvent {
  external void Function() get preventDefault;
  external set preventDefault(void Function() v);
  external factory StripePaymentRequestButtonElementClickEvent(
      {void Function() preventDefault});
}

// End module @stripe/stripe-js
