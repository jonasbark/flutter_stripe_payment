// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ach_credit_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchCreditTransfer _$AchCreditTransferFromJson(Map json) {
  return AchCreditTransfer(
    accountNumber: json['accountNumber'] as String,
    bankName: json['bankName'] as String,
    fingerprint: json['fingerprint'] as String,
    routingNumber: json['routingNumber'] as String,
    swiftCode: json['swiftCode'] as String,
  );
}

Map<String, dynamic> _$AchCreditTransferToJson(AchCreditTransfer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountNumber', instance.accountNumber);
  writeNotNull('bankName', instance.bankName);
  writeNotNull('fingerprint', instance.fingerprint);
  writeNotNull('routingNumber', instance.routingNumber);
  writeNotNull('swiftCode', instance.swiftCode);
  return val;
}
