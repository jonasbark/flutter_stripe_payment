// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodRequest _$PaymentMethodRequestFromJson(Map json) {
  return PaymentMethodRequest(
    billingAddress: json['billingAddress'] == null
        ? null
        : Address.fromJson(json['billingAddress'] as Map),
    card:
        json['card'] == null ? null : CreditCard.fromJson(json['card'] as Map),
    token: json['token'] == null ? null : Token.fromJson(json['token'] as Map),
    metadata: (json['metadata'] as Map)?.map(
      (k, e) => MapEntry(k as String, e as String),
    ),
  );
}

Map<String, dynamic> _$PaymentMethodRequestToJson(
    PaymentMethodRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billingAddress', instance.billingAddress?.toJson());
  writeNotNull('card', instance.card?.toJson());
  writeNotNull('token', instance.token?.toJson());
  writeNotNull('metadata', instance.metadata);
  return val;
}
