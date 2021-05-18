import 'dart:js';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

class StripePaymentPluginWeb {
  JsObject? _stripeInstance;

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'stripe_payment',
      const StandardMethodCodec(),
      registrar,
    );
    final StripePaymentPluginWeb instance = StripePaymentPluginWeb();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    /// Simple setup check
    if (!context.hasProperty('Stripe')) {
      throw PlatformException(
        code: 'Missing JS dependency',
        details:
          'The stripe JS library was not included in your "web/index.html" file. '
          'Please follow the setup instructions in the README file of the flutter_stripe_payment project.',
      );
    }

    /// Class initialization, allows dynamic Stripe loading (with
    /// different env keys)
    if (call.method == 'setOptions') {
      _stripeInstance = JsObject(
        context['Stripe'],
        [
          // publishableKey is the first unnamed argument
          call.arguments['options']['publishableKey'],
          // options follow
          JsObject.jsify(call.arguments['options'])
        ]
      );
      return;
    }

    /// Any other method call with an uninitialized plugin will throw an exception
    if (_stripeInstance == null) {
      throw PlatformException(
        code: 'Stripe not initialized',
        details:
          'Trying to call a method before proper library initialization.'
          'Please ensure that you call "StripePayment.setOptions" before calling any other method from this library.',
      );
    }

    switch (call.method) {
      case 'redirectToCheckout':
        _stripeInstance!.callMethod(
          'redirectToCheckout',
          [JsObject.jsify(call.arguments),]
        );
        break;
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details:
              "The stripe plugin for web doesn't implement the method '${call.method}'",
        );
    }
  }
}
