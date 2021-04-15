import 'package:flutter/material.dart';
import 'package:stripe_payment/src/payment_method.dart';

class PaymentIntent {
  PaymentMethodRequest? paymentMethod;
  String? paymentMethodId;
  String? returnURL;
  String? clientSecret;

  PaymentIntent({
    this.paymentMethod,
    this.paymentMethodId,
    this.returnURL,
    required this.clientSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentMethod != null) {
      data['paymentMethod'] = this.paymentMethod!.toJson();
    }
    if (this.paymentMethodId != null) data['paymentMethodId'] = this.paymentMethodId;
    if (this.returnURL != null) data['returnURL'] = this.returnURL;
    if (this.clientSecret != null) data['clientSecret'] = this.clientSecret;
    return data;
  }
}

class PaymentIntentResult {
  String? status;
  String? paymentIntentId;
  String? paymentMethodId;

  PaymentIntentResult({this.status, this.paymentIntentId, this.paymentMethodId});

  factory PaymentIntentResult.fromJson(Map<dynamic, dynamic> json) {
    return PaymentIntentResult(
      status: json['status'],
      paymentIntentId: json['paymentIntentId'],
      paymentMethodId: json['paymentMethodId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentIntentId != null) data['paymentIntentId'] = this.paymentIntentId;
    if (this.status != null) data['status'] = this.status;
    if (this.paymentMethodId != null) data['paymentMethodId'] = this.paymentMethodId;
    return data;
  }
}

class SetupIntentResult {
  String? status;
  String? paymentIntentId;
  String? setupIntentId;

  SetupIntentResult({
    this.status,
    this.setupIntentId,
    this.paymentIntentId,
  });

  factory SetupIntentResult.fromJson(Map<dynamic, dynamic> json) {
    return SetupIntentResult(
      status: json['status'],
      setupIntentId: json['setupIntentId'],
      paymentIntentId: json['paymentIntentId'],
    );
  }
}
