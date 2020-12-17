// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map json) {
  return PaymentMethod(
    billingDetails: json['billingDetails'] == null
        ? null
        : BillingDetails.fromJson(json['billingDetails'] as Map),
    card:
        json['card'] == null ? null : CreditCard.fromJson(json['card'] as Map),
    created: json['created'] as num,
    customerId: json['customerId'] as String,
    id: json['id'] as String,
    livemode: json['livemode'] as bool,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billingDetails', instance.billingDetails?.toJson());
  writeNotNull('card', instance.card?.toJson());
  writeNotNull('created', instance.created);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('id', instance.id);
  writeNotNull('livemode', instance.livemode);
  writeNotNull('type', instance.type);
  return val;
}
