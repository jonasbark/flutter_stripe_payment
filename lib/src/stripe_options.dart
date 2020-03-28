import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stripe_options.g.dart';

@JsonSerializable()
class StripeOptions {
  final String publishableKey;
  final String merchantId;
  final String androidPayMode;

  StripeOptions({
    @required this.publishableKey,
    this.merchantId,
    this.androidPayMode,
  });

  factory StripeOptions.fromJson(Map json) => _$StripeOptionsFromJson(json);
  Map toJson() => _$StripeOptionsToJson(this);
}
