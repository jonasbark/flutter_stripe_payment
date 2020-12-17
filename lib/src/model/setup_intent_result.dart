import 'package:json_annotation/json_annotation.dart';

part 'setup_intent_result.g.dart';

@JsonSerializable()
class SetupIntentResult {
  final String status;
  final String paymentIntentId;
  final String setupIntentId;

  const SetupIntentResult({
    this.status,
    this.setupIntentId,
    this.paymentIntentId,
  });

  factory SetupIntentResult.fromJson(Map json) =>
      _$SetupIntentResultFromJson(json);
  Map toJson() => _$SetupIntentResultToJson(this);
}
