// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map json) {
  return Address(
    city: json['city'] as String,
    country: json['country'] as String,
    line1: json['line1'] as String,
    line2: json['line2'] as String,
    name: json['name'] as String,
    postalCode: json['postalCode'] as String,
    state: json['state'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('city', instance.city);
  writeNotNull('country', instance.country);
  writeNotNull('line1', instance.line1);
  writeNotNull('line2', instance.line2);
  writeNotNull('name', instance.name);
  writeNotNull('postalCode', instance.postalCode);
  writeNotNull('state', instance.state);
  return val;
}
