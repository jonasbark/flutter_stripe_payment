// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeOptions _$StripeOptionsFromJson(Map json) {
  return StripeOptions(
    publishableKey: json['publishableKey'] as String,
    merchantId: json['merchantId'] as String,
    androidPayMode: json['androidPayMode'] as String,
  );
}

Map<String, dynamic> _$StripeOptionsToJson(StripeOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('publishableKey', instance.publishableKey);
  writeNotNull('merchantId', instance.merchantId);
  writeNotNull('androidPayMode', instance.androidPayMode);
  return val;
}
