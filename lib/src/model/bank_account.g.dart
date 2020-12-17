// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map json) {
  return BankAccount(
    accountHolderName: json['accountHolderName'] as String,
    accountHolderType: _$enumDecodeNullable(
        _$BankAccountAccountHolderTypeEnumMap, json['accountHolderType']),
    accountNumber: json['accountNumber'] as String,
    bankName: json['bankName'] as String,
    countryCode: json['countryCode'] as String,
    currency: json['currency'] as String,
    fingerprint: json['fingerprint'] as String,
    last4: json['last4'] as String,
    routingNumber: json['routingNumber'] as String,
  );
}

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accountHolderName', instance.accountHolderName);
  writeNotNull('accountHolderType',
      _$BankAccountAccountHolderTypeEnumMap[instance.accountHolderType]);
  writeNotNull('accountNumber', instance.accountNumber);
  writeNotNull('bankName', instance.bankName);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('currency', instance.currency);
  writeNotNull('fingerprint', instance.fingerprint);
  writeNotNull('last4', instance.last4);
  writeNotNull('routingNumber', instance.routingNumber);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BankAccountAccountHolderTypeEnumMap = {
  BankAccountAccountHolderType.company: 'company',
  BankAccountAccountHolderType.individual: 'individual',
};
