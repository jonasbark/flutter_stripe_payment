import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'credit_card.dart';

part 'source_params.g.dart';

@JsonSerializable()
class SourceParams {
  final int amount;
  final String currency;
  final String returnURL;
  final String type;
  final String name;
  final String statementDescriptor;
  final String country;
  final String email;
  final CreditCard card;

  const SourceParams({
    this.amount,
    this.currency,
    @required this.returnURL,
    @required this.type,
    this.name,
    this.statementDescriptor,
    this.country,
    this.email,
    this.card,
  });

  factory SourceParams.fromJson(Map json) => _$SourceParamsFromJson(json);
  Map toJson() => _$SourceParamsToJson(this);
}
