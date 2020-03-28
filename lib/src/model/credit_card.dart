import 'package:json_annotation/json_annotation.dart';

part 'credit_card.g.dart';

@JsonSerializable()
class CreditCard {
  String addressCity;
  String addressCountry;
  String addressLine1;
  String addressLine2;
  String addressState;
  String addressZip;
  String brand;
  String cardId;
  String country;
  int expMonth;
  int expYear;
  String funding;
  String last4;
  String name;
  String number;
  String cvc;
  String token;

  CreditCard({
    this.addressCity,
    this.addressCountry,
    this.addressLine1,
    this.addressLine2,
    this.addressState,
    this.addressZip,
    this.brand,
    this.cardId,
    this.country,
    this.expMonth,
    this.expYear,
    this.number,
    this.token,
    this.cvc,
    this.funding,
    this.last4,
    this.name,
  });

  factory CreditCard.fromJson(Map json) => _$CreditCardFromJson(json);
  Map toJson() => _$CreditCardToJson(this);
}
