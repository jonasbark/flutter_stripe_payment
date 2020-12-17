// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceParams _$SourceParamsFromJson(Map json) {
  return SourceParams(
    amount: json['amount'] as int,
    currency: json['currency'] as String,
    returnURL: json['returnURL'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
    statementDescriptor: json['statementDescriptor'] as String,
    country: json['country'] as String,
    email: json['email'] as String,
    card:
        json['card'] == null ? null : CreditCard.fromJson(json['card'] as Map),
  );
}

Map<String, dynamic> _$SourceParamsToJson(SourceParams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('returnURL', instance.returnURL);
  writeNotNull('type', instance.type);
  writeNotNull('name', instance.name);
  writeNotNull('statementDescriptor', instance.statementDescriptor);
  writeNotNull('country', instance.country);
  writeNotNull('email', instance.email);
  writeNotNull('card', instance.card?.toJson());
  return val;
}
