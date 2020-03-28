// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingDetails _$BillingDetailsFromJson(Map json) {
  return BillingDetails(
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map),
    email: json['email'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$BillingDetailsToJson(BillingDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address?.toJson());
  writeNotNull('email', instance.email);
  writeNotNull('name', instance.name);
  writeNotNull('phone', instance.phone);
  return val;
}
