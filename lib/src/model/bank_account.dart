import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';

enum BankAccountAccountHolderType {
  @JsonValue(0)
  company,

  @JsonValue(1)
  individual,
}

@JsonSerializable()
class BankAccount {
  final String accountHolderName;
  final BankAccountAccountHolderType accountHolderType;
  final String accountNumber;
  final String bankName;
  final String countryCode;
  final String currency;
  final String fingerprint;
  final String last4;
  final String routingNumber;

  const BankAccount({
    this.accountHolderName,
    this.accountHolderType,
    this.accountNumber,
    this.bankName,
    this.countryCode,
    this.currency,
    this.fingerprint,
    this.last4,
    this.routingNumber,
  });

  factory BankAccount.fromJson(Map json) => _$BankAccountFromJson(json);
  Map toJson() => _$BankAccountToJson(this);
}
