// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prefilled_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrefilledInformation _$PrefilledInformationFromJson(Map json) {
  return PrefilledInformation(
    billingAddress: json['billingAddress'] == null
        ? null
        : Address.fromJson(json['billingAddress'] as Map),
  );
}

Map<String, dynamic> _$PrefilledInformationToJson(
    PrefilledInformation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billingAddress', instance.billingAddress?.toJson());
  return val;
}
