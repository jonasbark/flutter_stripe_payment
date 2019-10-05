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
