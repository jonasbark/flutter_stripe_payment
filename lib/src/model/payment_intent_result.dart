import 'package:json_annotation/json_annotation.dart';

part 'payment_intent_result.g.dart';

@JsonSerializable()
class PaymentIntentResult {
  final String status;
  final String paymentIntentId;
  final String paymentMethodId;

  const PaymentIntentResult({
    this.status,
    this.paymentIntentId,
    this.paymentMethodId,
  });

  factory PaymentIntentResult.fromJson(Map json) =>
      _$PaymentIntentResultFromJson(json);
  Map toJson() => _$PaymentIntentResultToJson(this);
}
