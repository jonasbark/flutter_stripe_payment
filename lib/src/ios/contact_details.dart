import 'package:json_annotation/json_annotation.dart';

part 'contact_details.g.dart';

@JsonSerializable()
class ContactDetails {
  final String name;
  final String phoneNumber;
  final String emailAddress;
  final String supplementarySubLocality;
  final String street;
  final String city;
  final String state;
  final String country;
  @JsonKey(name: 'ISOCountryCode')
  final String isoCountryCode;
  final String postalCode;

  const ContactDetails({
    this.name,
    this.phoneNumber,
    this.emailAddress,
    this.supplementarySubLocality,
    this.street,
    this.city,
    this.state,
    this.country,
    this.isoCountryCode,
    this.postalCode,
  });

  factory ContactDetails.fromJson(Map json) => _$ContactDetailsFromJson(json);
  Map toJson() => _$ContactDetailsToJson(this);
}
