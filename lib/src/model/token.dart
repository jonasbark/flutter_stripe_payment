import 'package:json_annotation/json_annotation.dart';
import 'package:stripe_payment/src/ios/contact_details.dart';

import 'bank_account.dart';
import 'credit_card.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  final BankAccount bankAccount;
  final CreditCard card;
  final double created;
  final bool livemode;
  final String tokenId;
  final TokenExtra extra;

  Token({
    this.bankAccount,
    this.card,
    this.created,
    this.livemode,
    this.tokenId,
    this.extra,
  });

  factory Token.fromJson(Map json) => _$TokenFromJson(json);
  Map toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class TokenExtra {
  final ContactDetails billingContact;
  final ContactDetails shippingContact;

  TokenExtra(this.billingContact, this.shippingContact);

  factory TokenExtra.fromJson(Map json) => _$TokenExtraFromJson(json);
  Map toJson() => _$TokenExtraToJson(this);
}
