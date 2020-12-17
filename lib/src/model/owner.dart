import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'owner.g.dart';

@JsonSerializable()
class Owner {
  final Address address;
  final String email;
  final String name;
  final String phone;
  final Address verifiedAddress;
  final String verifiedEmail;
  final String verifiedName;
  final String verifiedPhone;

  const Owner({
    this.address,
    this.email,
    this.name,
    this.phone,
    this.verifiedAddress,
    this.verifiedEmail,
    this.verifiedName,
    this.verifiedPhone,
  });

  factory Owner.fromJson(Map json) => _$OwnerFromJson(json);
  Map toJson() => _$OwnerToJson(this);
}
