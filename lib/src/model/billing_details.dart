import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'billing_details.g.dart';

@JsonSerializable()
class BillingDetails {
  Address address;
  String email;
  String name;
  String phone;

  BillingDetails({
    this.address,
    this.email,
    this.name,
    this.phone,
  });

  factory BillingDetails.fromJson(Map json) => _$BillingDetailsFromJson(json);
  Map toJson() => _$BillingDetailsToJson(this);
}
