import 'package:json_annotation/json_annotation.dart';

part 'credit_card_brand.g.dart';

@JsonSerializable()
class CreditCardBrand {
  String code;
  int maxCvcLength;
  String displayName;
  List<int> cvcLength;

  CreditCardBrand({
    this.code,
    this.maxCvcLength,
    this.displayName,
    this.cvcLength,
  });

  factory CreditCardBrand.fromJson(Map json) => _$CreditCardBrandFromJson(json);
  Map toJson() => _$CreditCardBrandToJson(this);
}
