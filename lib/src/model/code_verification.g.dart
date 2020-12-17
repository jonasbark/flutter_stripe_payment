// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeVerification _$CodeVerificationFromJson(Map json) {
  return CodeVerification(
    attemptsRemaining: json['attemptsRemaining'] as int,
    status:
        _$enumDecodeNullable(_$CodeVerificationStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$CodeVerificationToJson(CodeVerification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('attemptsRemaining', instance.attemptsRemaining);
  writeNotNull('status', _$CodeVerificationStatusEnumMap[instance.status]);
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

const _$CodeVerificationStatusEnumMap = {
  CodeVerificationStatus.pending: 0,
  CodeVerificationStatus.succeeded: 1,
  CodeVerificationStatus.failed: 2,
};
