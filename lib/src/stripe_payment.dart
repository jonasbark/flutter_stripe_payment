import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:stripe_payment/src/stripe_options.dart';

import 'android_pay_payment_request.dart';
import 'apple_pay_payment_request.dart';
import 'error_codes.dart';
import 'model/bank_account.dart';
import 'model/card_form_payment_request.dart';
import 'model/credit_card.dart';
import 'model/payment_intent.dart';
import 'model/payment_intent_result.dart';
import 'model/payment_method.dart';
import 'model/payment_method_request.dart';
import 'model/setup_intent_result.dart';
import 'model/source.dart';
import 'model/source_params.dart';
import 'model/token.dart';

class StripePayment {
  static const MethodChannel _channel = const MethodChannel('stripe_payment');

  /// https://tipsi.github.io/tipsi-stripe/docs/usage.html
  static Future<void> setOptions(StripeOptions settings) async {
    await _channel.invokeMethod<void>('setOptions', {
      "options": settings.toJson(),
      "errorCodes": Errors.mapping,
    });
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/usage.html
  static void setStripeAccount(String stripeAccount) async {
    await _channel.invokeMethod('setStripeAccount', {
      "stripeAccount": stripeAccount,
    });
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/usage.html
  static Future<bool> deviceSupportsNativePay() async {
    if (kIsWeb) {
      return false;
    } else {
      if (Platform.isIOS) {
        return _deviceSupportsApplePay();
      } else if (Platform.isAndroid) {
        return _deviceSupportsAndroidPay();
      } else {
        return false;
      }
    }
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/canmakeapplepaypaymentsoptions.html
  /// https://tipsi.github.io/tipsi-stripe/docs/canmakeandroidpaypayments.html
  static Future<bool> canMakeNativePayPayments(List<String> networks) async {
    if (kIsWeb) {
      throw UnimplementedError();
    } else {
      if (Platform.isAndroid) {
        return _channel.invokeMethod<bool>('canMakeAndroidPayPayments');
      } else if (Platform.isIOS) {
        return _channel.invokeMethod<bool>('canMakeApplePayPayments', {
          'networks': networks,
        });
      } else
        throw UnimplementedError();
    }
  }

  static Future<List<String>> potentiallyAvailableNativePayNetworks() async {
    return await _channel.invokeListMethod<String>(
      "potentiallyAvailableNativePayNetworks",
    );
  }

  static Future<bool> _deviceSupportsAndroidPay() {
    return _channel.invokeMethod<bool>("deviceSupportsAndroidPay");
  }

  static Future<bool> _deviceSupportsApplePay() {
    return _channel.invokeMethod<bool>("deviceSupportsApplePay");
  }

  static Future<PaymentMethod> paymentMethodFromNativePay({
    @required AndroidPayPaymentRequest androidPayOptions,
    @required ApplePayPaymentOptions applePayOptions,
  }) {
    if (kIsWeb) {
      throw UnimplementedError();
    } else {
      if (Platform.isAndroid) {
        return _paymentMethodFromAndroidPay(androidPayOptions);
      } else if (Platform.isIOS) {
        return _paymentMethodFromApplePay(applePayOptions);
      } else
        throw UnimplementedError();
    }
  }

  static Future<PaymentMethod> _paymentMethodFromAndroidPay(
      AndroidPayPaymentRequest options) async {
    final pm = await _channel.invokeMapMethod<dynamic, dynamic>(
      "paymentMethodFromAndroidPay",
      options.toJson(),
    );
    return PaymentMethod.fromJson(pm);
  }

  static Future<PaymentMethod> _paymentMethodFromApplePay(
      ApplePayPaymentOptions options) async {
    final pm = await _channel
        .invokeMapMethod<dynamic, dynamic>("paymentMethodFromApplePay", {
      "options": options.json,
      "items": options.items.map((item) => item.json).toList()
    });
    print('received: $pm');
    return PaymentMethod.fromJson(pm);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/paymentRequestWithNativePay.html
  static Future<Token> paymentRequestWithNativePay({
    @required AndroidPayPaymentRequest androidPayOptions,
    @required ApplePayPaymentOptions applePayOptions,
  }) {
    if (kIsWeb) {
      throw UnimplementedError();
    } else {
      if (Platform.isAndroid) {
        return _paymentRequestWithAndroidPay(androidPayOptions);
      } else if (Platform.isIOS) {
        return _paymentRequestWithApplePay(applePayOptions);
      } else
        throw UnimplementedError();
    }
  }

  static Future<Token> _paymentRequestWithAndroidPay(
      AndroidPayPaymentRequest options) async {
    final token = await _channel.invokeMapMethod<dynamic, dynamic>(
      "paymentRequestWithAndroidPay",
      options.toJson(),
    );
    return Token.fromJson(token);
  }

  static Future<Token> _paymentRequestWithApplePay(
      ApplePayPaymentOptions options) async {
    final token = await _channel
        .invokeMapMethod<dynamic, dynamic>("paymentRequestWithApplePay", {
      "options": options.json,
      "items": options.items.map((item) => item.json).toList()
    });
    return Token.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/completeNativePayRequest.html
  static Future<void> completeNativePayRequest() async {
    if (kIsWeb) {
      throw UnimplementedError();
    } else {
      if (Platform.isIOS) {
        return await _channel.invokeMethod("completeApplePayRequest");
      } else if (Platform.isAndroid) {
        return null;
      } else
        throw UnimplementedError();
    }
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/cancelNativePayRequest.html
  static Future<void> cancelNativePayRequest() async {
    if (kIsWeb) {
      throw UnimplementedError();
    } else {
      if (Platform.isIOS) {
        return await _channel.invokeMethod("cancelApplePayRequest");
      } else if (Platform.isAndroid) {
        return null;
      } else
        throw UnimplementedError();
    }
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/paymentRequestWithCardForm.html
  static Future<PaymentMethod> paymentRequestWithCardForm(
      CardFormPaymentRequest options) async {
    final token = await _channel.invokeMapMethod<dynamic, dynamic>(
      "paymentRequestWithCardForm",
      options.toJson(),
    );
    return PaymentMethod.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createTokenWithCard.html
  static Future<Token> createTokenWithCard(CreditCard card) async {
    final token = await _channel.invokeMapMethod<dynamic, dynamic>(
      "createTokenWithCard",
      card.toJson(),
    );
    return Token.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createTokenWithBankAccount.html
  static Future<Token> createTokenWithBankAccount(BankAccount options) async {
    final token = await _channel.invokeMapMethod<dynamic, dynamic>(
      "createTokenWithBankAccount",
      options.toJson(),
    );
    return Token.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createsourcewithparamsparams.html
  static Future<Source> createSourceWithParams(SourceParams options) async {
    final source = await _channel.invokeMapMethod<dynamic, dynamic>(
      "createSourceWithParams",
      options.toJson(),
    );
    return Source.fromJson(source);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createPaymentMethod.html
  static Future<PaymentMethod> createPaymentMethod(
      PaymentMethodRequest request) async {
    final paymentMethod = await _channel.invokeMapMethod<String, dynamic>(
      "createPaymentMethod",
      request.toJson(),
    );
    return PaymentMethod.fromJson(paymentMethod);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/authenticatePaymentIntent.html
  static Future<PaymentIntentResult> authenticatePaymentIntent(
      {@required String clientSecret}) async {
    assert(clientSecret != null);
    final result = await _channel.invokeMapMethod<dynamic, dynamic>(
      'authenticatePaymentIntent',
      {"clientSecret": clientSecret},
    );
    return PaymentIntentResult.fromJson(result);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/confirmPaymentIntent.html
  static Future<PaymentIntentResult> confirmPaymentIntent(
      PaymentIntent intent) async {
    assert(intent.clientSecret != null);
    // assert(intent.paymentMethodId != null);
    final result = await _channel.invokeMapMethod<dynamic, dynamic>(
      'confirmPaymentIntent',
      intent.toJson(),
    );
    return PaymentIntentResult.fromJson(result);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/authenticateSetupIntent.html
  static Future<SetupIntentResult> authenticateSetupIntent(
      {@required String clientSecret}) async {
    assert(clientSecret != null);
    final result = await _channel.invokeMapMethod<dynamic, dynamic>(
      'authenticateSetupIntent',
      {"clientSecret": clientSecret},
    );
    return SetupIntentResult.fromJson(result);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/confirmSetupIntent.html
  static Future<SetupIntentResult> confirmSetupIntent(
      PaymentIntent intent) async {
    assert(intent.clientSecret != null);
    final result = await _channel.invokeMapMethod<dynamic, dynamic>(
      'confirmSetupIntent',
      intent.toJson(),
    );
    return SetupIntentResult.fromJson(result);
  }
}
