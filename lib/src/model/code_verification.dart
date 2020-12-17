import 'package:json_annotation/json_annotation.dart';

part 'code_verification.g.dart';

enum CodeVerificationStatus {
  pending,
  succeeded,
  failed,
}

@JsonSerializable()
class CodeVerification {
  final int attemptsRemaining;
  final CodeVerificationStatus status;

  const CodeVerification({
    this.attemptsRemaining,
    this.status,
  });

  factory CodeVerification.fromJson(Map json) =>
      _$CodeVerificationFromJson(json);
  Map toJson() => _$CodeVerificationToJson(this);
}
