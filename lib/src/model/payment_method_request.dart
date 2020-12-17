import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'credit_card.dart';
import 'token.dart';

part 'payment_method_request.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentMethodRequest {
  final Address billingAddress;
  final CreditCard card;
  final Token token;
  final Map<String, String> metadata;
  

  const PaymentMethodRequest({
    this.billingAddress,
    this.card,
    this.token,
    this.metadata,
  }) : assert(card != null || token != null);

  factory PaymentMethodRequest.fromJson(Map json) =>
      _$PaymentMethodRequestFromJson(json);
  Map toJson() => _$PaymentMethodRequestToJson(this);
}
