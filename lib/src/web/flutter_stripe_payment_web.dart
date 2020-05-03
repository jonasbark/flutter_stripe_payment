import 'dart:async';
import 'dart:js';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:stripe_payment/src/payment_intent.dart';
import 'package:stripe_payment/src/web/js/stripe-js/payment-intents.dart';

import '../token.dart' as plugin_token;
import 'js/stripe-js.dart';
import 'js/stripe-js/payment-request.dart';


class StripePaymentPlugin {
  Stripe _stripe;
  PaymentRequestTokenEvent _tokenEvent;
  static get platformVersion => "0.1.2";

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
        'stripe_payment',
        const StandardMethodCodec(),
        registrar.messenger);
    final StripePaymentPlugin instance = StripePaymentPlugin();
    channel.setMethodCallHandler((call) => instance.handleMethodCall(call));
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    if(call.method == "setOptions") {
      _stripe = initializeStripe(call.arguments['options']['publishableKey']);
      return;
    } else if(_stripe == null) {
      throw PlatformException(
          code: 'Uninitialized',
          details: "You must call StripePayment.setOptions first");
    }

    switch (call.method) {
      case "deviceSupportsNativePay":
        return true;
        
      case "canMakeNativePayPayments":
        final pr = _stripe.paymentRequest(PaymentRequestOptions(
          country: (call.arguments['country_code'] as String).toUpperCase(),
          currency: (call.arguments['currency_code'] as String).toLowerCase(),
          total: PaymentRequestItem(
            label: 'Total',
            amount: 1
          ),
          requestPayerEmail: true,
          requestPayerName: true,
          requestPayerPhone: true
        ));
        final canMakePayment = await pr.canMakePayment();
        if(canMakePayment == null) return null;
        return {'applePay': canMakePayment.applePay};

      case "paymentRequestWithNativePay":
        // TODO: This won't work on a currency with smallest units anything else but cents
        num total = num.tryParse(call.arguments['total_price']) * 100;

        final pr = _stripe.paymentRequest(
          PaymentRequestOptions(
            country: (call.arguments['country_code'] as String).toUpperCase(),
            currency: (call.arguments['currency_code'] as String).toLowerCase(),
            total: PaymentRequestItem(
                label: 'Total',
                amount: total
            ),
            requestPayerEmail: true,
            requestPayerName: true,
            requestPayerPhone: true
        ));
        if((await pr.canMakePayment()) != null) {

          Completer completer = Completer<PaymentRequestTokenEvent>();

          pr.on('token', allowInterop((tokenEvent) {
            completer.complete(tokenEvent);
          }));
          pr.show();

          PaymentRequestTokenEvent event = await completer.future;

          _tokenEvent = event;

          return _tokenFromEvent(event).toJson();
        }
        throw PlatformException(code: 'unavailable', message: 'Native pay is not configured or available');

      case "cancelNativePayRequest":
        if(_tokenEvent != null) {
          _tokenEvent.complete('fail');
          _tokenEvent = null;
        }
        return;

      case "completeNativePayRequest":
        if(_tokenEvent != null) {
          _tokenEvent.complete('success');
          _tokenEvent = null;
        }
        return;

      case "confirmPaymentIntent":
        final result = await _stripe.confirmCardPayment(call.arguments['clientSecret'], ConfirmCardPaymentData(
          payment_method: call.arguments['paymentMethodId'] ?? call.arguments['paymentMethod']
        ));
        return PaymentIntentResult(paymentIntentId: result.paymentIntent?.id).toJson();

      default:
        throw PlatformException(
            code: 'Unimplemented',
            details: "The stripe_payment plugin for web doesn't implement "
                "the method '${call.method}'");
    }
  }

  plugin_token.Token _tokenFromEvent(PaymentRequestTokenEvent event) => plugin_token.Token(
      tokenId: event.token.id,
      bankAccount: event.token.bank_account == null ? null : plugin_token.BankAccount(
          accountHolderName: event.token.bank_account.account_holder_name,
          accountHolderType: event.token.bank_account.account_holder_type,
          bankName: event.token.bank_account.bank_name,
          countryCode: event.token.bank_account.country,
          currency: event.token.bank_account.currency,
          fingerprint: event.token.bank_account.fingerprint,
          last4: event.token.bank_account.last4,
          routingNumber: event.token.bank_account.routing_number
      ),
      card: event.token.card == null ? null : plugin_token.CreditCard(
          addressCity: event.token.card.address_city,
          addressCountry: event.token.card.address_country,
          addressLine1: event.token.card.address_line1,
          addressLine2: event.token.card.address_line2,
          addressState: event.token.card.address_state,
          addressZip: event.token.card.address_zip,
          brand: event.token.card.brand,
          cardId: event.token.card.id,
          country: event.token.card.country,
          expMonth: event.token.card.exp_month,
          expYear: event.token.card.exp_year,
          funding: event.token.card.funding,
          last4: event.token.card.last4,
          name: event.token.card.name
      ),
      created: event.token.created,
      livemode: event.token.livemode
  );
}
