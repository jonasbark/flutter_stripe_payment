// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_intent_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupIntentResult _$SetupIntentResultFromJson(Map json) {
  return SetupIntentResult(
    status: json['status'] as String,
    setupIntentId: json['setupIntentId'] as String,
    paymentIntentId: json['paymentIntentId'] as String,
  );
}

Map<String, dynamic> _$SetupIntentResultToJson(SetupIntentResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('paymentIntentId', instance.paymentIntentId);
  writeNotNull('setupIntentId', instance.setupIntentId);
  return val;
}
