// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map json) {
  return Token(
    bankAccount: json['bankAccount'] == null
        ? null
        : BankAccount.fromJson(json['bankAccount'] as Map),
    card:
        json['card'] == null ? null : CreditCard.fromJson(json['card'] as Map),
    created: (json['created'] as num)?.toDouble(),
    livemode: json['livemode'] as bool,
    tokenId: json['tokenId'] as String,
    extra: json['extra'] == null
        ? null
        : TokenExtra.fromJson(json['extra'] as Map),
  );
}

Map<String, dynamic> _$TokenToJson(Token instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bankAccount', instance.bankAccount?.toJson());
  writeNotNull('card', instance.card?.toJson());
  writeNotNull('created', instance.created);
  writeNotNull('livemode', instance.livemode);
  writeNotNull('tokenId', instance.tokenId);
  writeNotNull('extra', instance.extra?.toJson());
  return val;
}

TokenExtra _$TokenExtraFromJson(Map json) {
  return TokenExtra(
    json['billingContact'] == null
        ? null
        : ContactDetails.fromJson(json['billingContact'] as Map),
    json['shippingContact'] == null
        ? null
        : ContactDetails.fromJson(json['shippingContact'] as Map),
  );
}

Map<String, dynamic> _$TokenExtraToJson(TokenExtra instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billingContact', instance.billingContact?.toJson());
  writeNotNull('shippingContact', instance.shippingContact?.toJson());
  return val;
}
