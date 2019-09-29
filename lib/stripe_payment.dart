import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class StripePayment {
  static const MethodChannel _channel = const MethodChannel('stripe_payment');

  static bool _settingsSet = false;

  static bool get ready => _settingsSet;

  /// set the publishable key that stripe should use
  /// call this once and before you use [addSource]
  static void setSettings(StripeSettings settings) {
    _channel.invokeMethod('setSettings', settings.toJson());
    _settingsSet = true;
  }

  /// opens the stripe dialog to add a new card
  /// if the source has been successfully added the card token will be returned
  static Future<String> addSource() async {
    final String token = await _channel.invokeMethod('addSource');
    return token;
  }

  static Future<String> confirmPayment(String paymentMethodId, String clientSecret) async {
    return await _channel.invokeMethod("confirmPayment", {
      "paymentMethodId": paymentMethodId,
      "clientSecret": clientSecret,
    });
  }

  static Future<String> setupPayment(String paymentMethodId, String clientSecret) async {
    return await _channel.invokeMethod("setupPayment", {
      "paymentMethodId": paymentMethodId,
      "clientSecret": clientSecret,
    });
  }
}

class StripeSettings {
  final String publishableKey;
  final String applePayMerchantIdentifier;

  StripeSettings({@required this.publishableKey, this.applePayMerchantIdentifier});

  factory StripeSettings.fromJson(Map<String, dynamic> json) {
    return StripeSettings(
      applePayMerchantIdentifier: json['applePayMerchantIdentifier'],
      publishableKey: json['publishableKey'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applePayMerchantIdentifier'] = this.applePayMerchantIdentifier;
    data['publishableKey'] = this.publishableKey;
    return data;
  }
}
