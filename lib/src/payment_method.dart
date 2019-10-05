import 'package:stripe_payment/stripe_payment.dart';

class PaymentMethodRequest {
  final BillingAddress billingAddress;
  final Card card;
  final Token token;
  final Map<String, String> metadata;

  PaymentMethodRequest({this.billingAddress, this.card, this.token, this.metadata}) {
    assert(card != null || token != null);
  }

  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = card.toJson();
    }
    if (this.token != null) {
      data['token'] = token.toJson();
    }
    if (this.billingAddress != null) {
      data['billingAddress'] = this.billingAddress.toJson();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata;
    }
    return data;
  }
}
