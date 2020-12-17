// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map json) {
  return Customer(
    id: json['id'] as String,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map),
    description: json['description'] as String,
    email: json['email'] as String,
    metadata: (json['metadata'] as Map)?.map(
      (k, e) => MapEntry(k as String, e),
    ),
    name: json['name'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('address', instance.address?.toJson());
  writeNotNull('description', instance.description);
  writeNotNull('email', instance.email);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('name', instance.name);
  writeNotNull('phone', instance.phone);
  return val;
}
