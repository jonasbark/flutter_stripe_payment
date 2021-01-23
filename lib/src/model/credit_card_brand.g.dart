// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardBrand _$CreditCardBrandFromJson(Map json) {
  return CreditCardBrand(
    code: json['code'] as String,
    maxCvcLength: json['maxCvcLength'] as int,
    displayName: json['displayName'] as String,
    cvcLength: (json['cvcLength'] as List)?.map((e) => e as int)?.toList(),
  );
}

Map<String, dynamic> _$CreditCardBrandToJson(CreditCardBrand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('maxCvcLength', instance.maxCvcLength);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('cvcLength', instance.cvcLength);
  return val;
}
