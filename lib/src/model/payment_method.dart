import 'package:json_annotation/json_annotation.dart';

import 'billing_details.dart';
import 'credit_card.dart';

part 'payment_method.g.dart';

@JsonSerializable(anyMap: true)
class PaymentMethod {
  BillingDetails billingDetails;
  CreditCard card;
  num created;
  String customerId;
  String id;
  bool livemode;
  String type;

  PaymentMethod({
    this.billingDetails,
    this.card,
    this.created,
    this.customerId,
    this.id,
    this.livemode,
    this.type,
  });

  factory PaymentMethod.fromJson(Map json) => _$PaymentMethodFromJson(json);
  Map toJson() => _$PaymentMethodToJson(this);
}
