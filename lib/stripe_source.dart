import 'dart:async';

import 'package:flutter/services.dart';

class StripeSource {

  static const MethodChannel _channel = const MethodChannel('stripe_payment');

  static Future<String> get addSource => _channel.invokeMethod('addSource');

  static bool _publishableKeySet = false;

  static void setPublishableKey(String apiKey) {
    _channel.invokeMethod('setPublishableKey', apiKey);
    _publishableKeySet = true;
  }
}
