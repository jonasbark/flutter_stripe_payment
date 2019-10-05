import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stripe_payment/src/android_pay_payment_request.dart';
import 'package:stripe_payment/src/card_form_payment_request.dart';
import 'package:stripe_payment/src/source_params.dart';
import 'package:stripe_payment/src/apple_pay_payment_request.dart';

import 'src/token.dart';
export 'src/token.dart';
export 'src/error_codes.dart';

export 'package:stripe_payment/src/android_pay_payment_request.dart';
export 'package:stripe_payment/src/apple_pay_payment_request.dart';
export 'package:stripe_payment/src/card_form_payment_request.dart';
export 'package:stripe_payment/src/source_params.dart';

class StripePayment {
  static const MethodChannel _channel = const MethodChannel('stripe_payment');

  static bool _settingsSet = false;

  static bool get ready => _settingsSet;

  /// set the publishable key that stripe should use
  /// call this once and before you use [addSource]
  static void setOptions(StripeOptions settings) {
    _channel.invokeMethod('setOptions', settings.toJson());
    _settingsSet = true;
  }

  static Future<bool> deviceSupportsNativePay() async {
    if (Platform.isIOS) {
      return _deviceSupportsApplePay();
    } else if (Platform.isAndroid) {
      return _deviceSupportsAndroidPay();
    } else {
      return false;
    }
  }

  static Future<bool> canMakeNativePayPayments(List<String> networks) async {
    if (Platform.isAndroid) {
      return _channel.invokeMethod('canMakeAndroidPayPayments', networks);
    } else if (Platform.isIOS) {
      return _channel.invokeMethod('canMakeApplePayPayments');
    } else
      throw UnimplementedError();
  }

  static Future<bool> _deviceSupportsAndroidPay() => _channel.invokeMethod("deviceSupportsAndroidPay");

  static Future<bool> _deviceSupportsApplePay() => _channel.invokeMethod("deviceSupportsApplePay");

  static Future<Token> paymentRequestWithNativePay(
      {@required AndroidPayPaymentRequest androidPayOptions, @required ApplePayPaymentRequest applePayOptions}) {
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

  static Future<Token> _paymentRequestWithApplePay(ApplePayPaymentRequest options) async {
    final token = await _channel.invokeMethod("paymentRequestWithApplePay", options.json);
    return Token.fromJson(token);
  }

  static Future<void> completeNativePayRequest() async {
    if (Platform.isIOS) {
      return _channel.invokeMethod("completeNativePayRequest");
    } else if (Platform.isAndroid) {
      return null;
    } else
      throw UnimplementedError();
  }

  static Future<void> cancelNativePayRequest() async {
    if (Platform.isIOS) {
      return _channel.invokeMethod("cancelNativePayRequest");
    } else if (Platform.isAndroid) {
      return null;
    } else
      throw UnimplementedError();
  }

  static Future<Token> paymentRequestWithCardForm(CardFormPaymentRequest options) async {
    final token = await _channel.invokeMethod("paymentRequestWithCardForm", options.toJson());
    return Token.fromJson(token);
  }

  static Future<Token> createTokenWithCard(Card options) async {
    final token = await _channel.invokeMethod("createTokenWithCard", options.toJson());
    return Token.fromJson(token);
  }

  static Future<Token> createTokenWithBankAccount(BankAccount options) async {
    final token = await _channel.invokeMethod("createTokenWithBankAccount", options.toJson());
    return Token.fromJson(token);
  }

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
