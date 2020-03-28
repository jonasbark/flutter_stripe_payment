import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final String id;
  final Address address;
  final String description;
  final String email;
  final Map<String, dynamic> metadata;
  final String name;
  final String phone;

  const Customer({
    this.id,
    this.address,
    this.description,
    this.email,
    this.metadata,
    this.name,
    this.phone,
  });

  factory Customer.fromJson(Map json) => _$CustomerFromJson(json);
  Map toJson() => _$CustomerToJson(this);
}
