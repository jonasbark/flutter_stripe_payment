import 'package:flutter/material.dart';
import 'package:stripe_payment/src/payment_method.dart';

class PaymentIntent {
  PaymentMethodRequest paymentMethod;
  String paymentMethodId;
  String returnURL;
  String clientSecret;

  PaymentIntent({
    this.paymentMethod,
    this.paymentMethodId,
    this.returnURL,
    @required this.clientSecret,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.paymentMethod != null) {
      data['paymentMethod'] = this.paymentMethod.toJson();
    }
    data['paymentMethodId'] = this.paymentMethodId;
    data['returnURL'] = this.returnURL;
    data['clientSecret'] = this.clientSecret;
    return data;
  }
}

class PaymentIntentResult {
  String status;
  String paymentIntentId;

  PaymentIntentResult({
    this.status,
    this.paymentIntentId,
  });

  factory PaymentIntentResult.fromJson(Map<String, dynamic> json) {
    return PaymentIntentResult(
      status: json['status'],
      paymentIntentId: json['paymentIntentId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentMethodId'] = this.paymentIntentId;
    data['status'] = this.status;
    return data;
  }
}

class SetupIntentResult {
  String status;
  String paymentIntentId;
  String setupIntentId;

  SetupIntentResult({
    this.status,
    this.setupIntentId,
    this.paymentIntentId,
  });

  factory SetupIntentResult.fromJson(Map<String, dynamic> json) {
    return SetupIntentResult(
      status: json['status'],
      setupIntentId: json['setupIntentId'],
      paymentIntentId: json['paymentIntentId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentMethodId'] = this.paymentIntentId;
    data['setupIntentId'] = setupIntentId;
    data['status'] = this.status;
    return data;
  }
}
