// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$CreditCardFromJson(Map json) {
  return CreditCard(
    addressCity: json['addressCity'] as String,
    addressCountry: json['addressCountry'] as String,
    addressLine1: json['addressLine1'] as String,
    addressLine2: json['addressLine2'] as String,
    addressState: json['addressState'] as String,
    addressZip: json['addressZip'] as String,
    brand: json['brand'] == null
        ? null
        : CreditCardBrand.fromJson(json['brand'] as Map),
    cardId: json['cardId'] as String,
    country: json['country'] as String,
    expMonth: json['expMonth'] as int,
    expYear: json['expYear'] as int,
    number: json['number'] as String,
    token: json['token'] as String,
    cvc: json['cvc'] as String,
    funding: json['funding'] as String,
    last4: json['last4'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addressCity', instance.addressCity);
  writeNotNull('addressCountry', instance.addressCountry);
  writeNotNull('addressLine1', instance.addressLine1);
  writeNotNull('addressLine2', instance.addressLine2);
  writeNotNull('addressState', instance.addressState);
  writeNotNull('addressZip', instance.addressZip);
  writeNotNull('brand', instance.brand?.toJson());
  writeNotNull('cardId', instance.cardId);
  writeNotNull('country', instance.country);
  writeNotNull('expMonth', instance.expMonth);
  writeNotNull('expYear', instance.expYear);
  writeNotNull('funding', instance.funding);
  writeNotNull('last4', instance.last4);
  writeNotNull('name', instance.name);
  writeNotNull('number', instance.number);
  writeNotNull('cvc', instance.cvc);
  writeNotNull('token', instance.token);
  return val;
}
