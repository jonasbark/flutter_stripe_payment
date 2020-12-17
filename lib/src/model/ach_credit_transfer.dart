import 'package:json_annotation/json_annotation.dart';

part 'ach_credit_transfer.g.dart';

@JsonSerializable()
class AchCreditTransfer {
  String accountNumber;
  String bankName;
  String fingerprint;
  String routingNumber;
  String swiftCode;

  AchCreditTransfer({
    this.accountNumber,
    this.bankName,
    this.fingerprint,
    this.routingNumber,
    this.swiftCode,
  });

  factory AchCreditTransfer.fromJson(Map json) => _$AchCreditTransferFromJson(json);
  Map toJson() => _$AchCreditTransferToJson(this);
}
