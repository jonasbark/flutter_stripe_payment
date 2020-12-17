import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'prefilled_information.g.dart';

@JsonSerializable()
class PrefilledInformation {
  final Address billingAddress;

  const PrefilledInformation({
    this.billingAddress,
  });

  factory PrefilledInformation.fromJson(Map json) =>
      _$PrefilledInformationFromJson(json);
  Map toJson() => _$PrefilledInformationToJson(this);
}
