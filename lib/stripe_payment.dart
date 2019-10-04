import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stripe_payment/src/android_pay_payment_request.dart';
import 'package:stripe_payment/src/card_form_payment_request.dart';
import 'package:stripe_payment/src/source_params.dart';
import 'package:stripe_payment/src/apple_pay_payment_request.dart';

import 'src/token.dart';
export 'src/token.dart';

export 'package:stripe_payment/src/android_pay_payment_request.dart';
export 'package:stripe_payment/src/apple_pay_payment_request.dart';
export 'package:stripe_payment/src/card_form_payment_request.dart';
export 'package:stripe_payment/src/source_params.dart';

class StripePayment {
  static const MethodChannel _channel = const MethodChannel('stripe_payment');

  static bool _settingsSet = false;

  static bool get ready => _settingsSet;

  /*
            "setOptions" -> stripeModule.init(ReadableMap(call.arguments as Map<String, Any>), ReadableMap())
            "deviceSupportsAndroidPay" -> stripeModule.deviceSupportsAndroidPay(Promise(result));
            "canMakeAndroidPayPayments" -> stripeModule.canMakeAndroidPayPayments(Promise(result));
            "paymentRequestWithAndroidPay" -> stripeModule.paymentRequestWithAndroidPay(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )

            "deviceSupportsApplePay" -> stripeModule.deviceSupportsApplePay(Promise(result));
            TODO
            "paymentRequestWithApplePay" -> stripeModule.paymentRequestWithApplePay(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "completeApplePayRequest" -> stripeModule.completeApplePayRequest(Promise(result))
            "cancelApplePayRequest" -> stripeModule.cancelApplePayRequest(Promise(result))
            END TODO

            "paymentRequestWithCardForm" -> stripeModule.paymentRequestWithCardForm(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "createTokenWithCard" -> stripeModule.createTokenWithCard(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "createTokenWithBankAccount" -> stripeModule.createTokenWithBankAccount(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "createSourceWithParams" -> stripeModule.createSourceWithParams(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
   */

  /// set the publishable key that stripe should use
  /// call this once and before you use [addSource]
  static void setOptions(StripeOptions settings) {
    _channel.invokeMethod('setOptions', settings.toJson());
    _settingsSet = true;
  }

  static Future<bool> deviceSupportsAndroidPay() => _channel.invokeMethod("deviceSupportsAndroidPay");

  static Future<bool> deviceSupportsApplePay() => _channel.invokeMethod("deviceSupportsApplePay");

  static Future<Token> paymentRequestWithAndroidPay(AndroidPayPaymentRequest options) async {
    final token = await _channel.invokeMethod("paymentRequestWithAndroidPay", options.toJson());
    return Token.fromJson(token);
  }

  static Future<Token> paymentRequestWithApplePay(ApplePayPaymentRequest options) async {
    final token = await _channel.invokeMethod("paymentRequestWithApplePay", options.toJson);
    return Token.fromJson(token);
  }

  static Future<Token> paymentRequestWithCardForm(CardFormPaymentRequest options) async {
    final token = await _channel.invokeMethod("paymentRequestWithCardForm", options.toJson());
    return Token.fromJson(token);
  }

  static Future<Token> createTokenWithCard(Card options) async {
    final token = await _channel.invokeMethod("createTokenWithCard", options.toJson());
    return Token.fromJson(token);
  }

  static Future<Map<String, Object>> createTokenWithBankAccount(BankAccount options) =>
      _channel.invokeMethod("createTokenWithBankAccount", options.toJson());

  static Future<Map<String, Object>> createSourceWithParams(SourceParams options) =>
      _channel.invokeMethod("createSourceWithParams", options.toJson());
}

class StripeOptions {
  final String publishableKey;
  final String merchantId;
  final String androidPayMode;

  StripeOptions({@required this.publishableKey, this.merchantId, this.androidPayMode});

  factory StripeOptions.fromJson(Map<String, dynamic> json) {
    return StripeOptions(
        merchantId: json['merchantId'], publishableKey: json['publishableKey'], androidPayMode: json['androidPayMode']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchantId'] = this.merchantId;
    data['publishableKey'] = this.publishableKey;
    data['androidPayMode'] = this.androidPayMode;
    return data;
  }
}
