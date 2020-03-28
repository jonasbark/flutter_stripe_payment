// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntent _$PaymentIntentFromJson(Map json) {
  return PaymentIntent(
    paymentMethod: json['paymentMethod'] == null
        ? null
        : PaymentMethodRequest.fromJson(json['paymentMethod'] as Map),
    paymentMethodId: json['paymentMethodId'] as String,
    returnURL: json['returnURL'] as String,
    clientSecret: json['clientSecret'] as String,
    metadata: (json['metadata'] as Map)?.map(
      (k, e) => MapEntry(k as String, e),
    ),
  );
}

Map<String, dynamic> _$PaymentIntentToJson(PaymentIntent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('paymentMethod', instance.paymentMethod?.toJson());
  writeNotNull('paymentMethodId', instance.paymentMethodId);
  writeNotNull('returnURL', instance.returnURL);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('metadata', instance.metadata);
  return val;
}
