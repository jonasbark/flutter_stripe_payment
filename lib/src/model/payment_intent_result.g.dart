// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntentResult _$PaymentIntentResultFromJson(Map json) {
  return PaymentIntentResult(
    status: json['status'] as String,
    paymentIntentId: json['paymentIntentId'] as String,
    paymentMethodId: json['paymentMethodId'] as String,
  );
}

Map<String, dynamic> _$PaymentIntentResultToJson(PaymentIntentResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('paymentIntentId', instance.paymentIntentId);
  writeNotNull('paymentMethodId', instance.paymentMethodId);
  return val;
}
