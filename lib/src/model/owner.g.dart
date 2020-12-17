// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map json) {
  return Owner(
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map),
    email: json['email'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
    verifiedAddress: json['verifiedAddress'] == null
        ? null
        : Address.fromJson(json['verifiedAddress'] as Map),
    verifiedEmail: json['verifiedEmail'] as String,
    verifiedName: json['verifiedName'] as String,
    verifiedPhone: json['verifiedPhone'] as String,
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) {
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
  writeNotNull('verifiedAddress', instance.verifiedAddress?.toJson());
  writeNotNull('verifiedEmail', instance.verifiedEmail);
  writeNotNull('verifiedName', instance.verifiedName);
  writeNotNull('verifiedPhone', instance.verifiedPhone);
  return val;
}
