import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'android_pay_payment_request.dart';
import 'apple_pay_payment_request.dart';
import 'card_form_payment_request.dart';
import 'error_codes.dart';
import 'payment_intent.dart';
import 'payment_method.dart';
import 'source.dart';
import 'source_params.dart';
import 'token.dart';

class StripePayment {
  static const MethodChannel _channel = const MethodChannel('stripe_payment');

  /// https://tipsi.github.io/tipsi-stripe/docs/usage.html
  static void setOptions(StripeOptions settings) async {
    _channel.invokeMethod('setOptions', {"options": settings.toJson(), "errorCodes": Errors.mapping});
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/usage.html
  static void setStripeAccount(String stripeAccount) {
    _channel.invokeMethod('setStripeAccount', {"stripeAccount": stripeAccount});
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/usage.html
  static Future<bool> deviceSupportsNativePay() async {
    if (Platform.isIOS) {
      return _deviceSupportsApplePay();
    } else if (Platform.isAndroid) {
      return _deviceSupportsAndroidPay();
    } else {
      return false;
    }
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/canMakeNativePayPayments.html
  static Future<bool> canMakeNativePayPayments(List<String> networks) async {
    if (Platform.isAndroid) {
      return _channel.invokeMethod('canMakeAndroidPayPayments');
    } else if (Platform.isIOS) {
      return _channel.invokeMethod('canMakeApplePayPayments', networks);
    } else
      throw UnimplementedError();
  }

  static Future<bool> _deviceSupportsAndroidPay() => _channel.invokeMethod("deviceSupportsAndroidPay");

  static Future<bool> _deviceSupportsApplePay() => _channel.invokeMethod("deviceSupportsApplePay");

  /// https://tipsi.github.io/tipsi-stripe/docs/paymentRequestWithNativePay.html
  static Future<Token> paymentRequestWithNativePay(
      {@required AndroidPayPaymentRequest androidPayOptions, @required ApplePayPaymentOptions applePayOptions}) {
    if (Platform.isAndroid) {
      return _paymentRequestWithAndroidPay(androidPayOptions);
    } else if (Platform.isIOS) {
      return _paymentRequestWithApplePay(applePayOptions);
    } else
      throw UnimplementedError();
  }

  static Future<Token> _paymentRequestWithAndroidPay(AndroidPayPaymentRequest options) async {
    final token = await _channel.invokeMethod("paymentRequestWithAndroidPay", options.toJson());
    return Token.fromJson(token);
  }

  static Future<Token> _paymentRequestWithApplePay(ApplePayPaymentOptions options) async {
    final token = await _channel.invokeMethod("paymentRequestWithApplePay",
        {"options": options.json, "items": options.items.map((item) => item.json).toList()});
    return Token.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/completeNativePayRequest.html
  static Future<void> completeNativePayRequest() async {
    if (Platform.isIOS) {
      return _channel.invokeMethod("completeApplePayRequest");
    } else if (Platform.isAndroid) {
      return null;
    } else
      throw UnimplementedError();
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/cancelNativePayRequest.html
  static Future<void> cancelNativePayRequest() async {
    if (Platform.isIOS) {
      return _channel.invokeMethod("cancelApplePayRequest");
    } else if (Platform.isAndroid) {
      return null;
    } else
      throw UnimplementedError();
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/paymentRequestWithCardForm.html
  static Future<PaymentMethod> paymentRequestWithCardForm(CardFormPaymentRequest options) async {
    final token = await _channel.invokeMethod("paymentRequestWithCardForm", options.toJson());
    return PaymentMethod.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createTokenWithCard.html
  static Future<Token> createTokenWithCard(CreditCard card) async {
    final token = await _channel.invokeMethod("createTokenWithCard", card.toJson());
    return Token.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createTokenWithBankAccount.html
  static Future<Token> createTokenWithBankAccount(BankAccount options) async {
    final token = await _channel.invokeMethod("createTokenWithBankAccount", options.toJson());
    return Token.fromJson(token);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createsourcewithparamsparams.html
  static Future<Source> createSourceWithParams(SourceParams options) async {
    final source = await _channel.invokeMethod("createSourceWithParams", options.toJson());
    return Source.fromJson(source);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/createPaymentMethod.html
  static Future<PaymentMethod> createPaymentMethod(PaymentMethodRequest request) async {
    final paymentMethod = await _channel.invokeMethod("createPaymentMethod", request.toJson());
    return PaymentMethod.fromJson(paymentMethod);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/authenticatePaymentIntent.html
  static Future<PaymentIntentResult> authenticatePaymentIntent({@required String clientSecret}) async {
    assert(clientSecret != null);
    final result = await _channel.invokeMethod('authenticatePaymentIntent', {"clientSecret": clientSecret});
    return PaymentIntentResult.fromJson(result);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/confirmPaymentIntent.html
  static Future<PaymentIntentResult> confirmPaymentIntent(PaymentIntent intent) async {
    assert(intent.clientSecret != null);
    assert(intent.paymentMethodId != null);
    final result = await _channel.invokeMethod('confirmPaymentIntent', intent.toJson());
    return PaymentIntentResult.fromJson(result);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/authenticateSetupIntent.html
  static Future<SetupIntentResult> authenticateSetupIntent({@required String clientSecret}) async {
    assert(clientSecret != null);
    final result = await _channel.invokeMethod('authenticateSetupIntent', {"clientSecret": clientSecret});
    return SetupIntentResult.fromJson(result);
  }

  /// https://tipsi.github.io/tipsi-stripe/docs/confirmSetupIntent.html
  static Future<SetupIntentResult> confirmSetupIntent(PaymentIntent intent) async {
    assert(intent.clientSecret != null);
    assert(intent.paymentMethodId != null);
    final result = await _channel.invokeMethod('confirmSetupIntent', intent.toJson());
    return SetupIntentResult.fromJson(result);
  }
}

class StripeOptions {
  final String publishableKey;
  final String merchantId;
  final String androidPayMode;
  final String stripeAccount;

  StripeOptions({@required this.publishableKey, this.merchantId, this.androidPayMode, this.stripeAccount});

  factory StripeOptions.fromJson(Map<String, dynamic> json) {
    return StripeOptions(
        merchantId: json['merchantId'], publishableKey: json['publishableKey'], androidPayMode: json['androidPayMode'], stripeAccount: json['stripeAccount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.merchantId != null) data['merchantId'] = this.merchantId;
    if (this.publishableKey != null) data['publishableKey'] = this.publishableKey;
    if (this.androidPayMode != null) data['androidPayMode'] = this.androidPayMode;
    if (this.stripeAccount != null) data['stripeAccount'] = this.stripeAccount;
    return data;
  }
}
