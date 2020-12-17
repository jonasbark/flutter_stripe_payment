import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String city;
  final String country;
  final String line1;
  final String line2;
  final String name;
  final String postalCode;
  final String state;

  const Address({
    this.city,
    this.country,
    this.line1,
    this.line2,
    this.name,
    this.postalCode,
    this.state,
  });

  factory Address.fromJson(Map json) => _$AddressFromJson(json);
  Map toJson() => _$AddressToJson(this);
}
