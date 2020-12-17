import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'android/line_item.dart';

part 'android_pay_payment_request.g.dart';

@JsonSerializable()
class AndroidPayPaymentRequest {
  @JsonKey(name: 'billing_address_required')
  final bool billingAddressRequired;

  @JsonKey(name: 'currency_code')
  final String currencyCode;

  @JsonKey(name: 'line_items')
  final List<LineItem> lineItems;

  @JsonKey(name: 'shipping_address_required')
  final bool shippingAddressRequired;

  @JsonKey(name: 'shipping_countries')
  final List<String> shippingCountries;

  @JsonKey(name: 'phone_number_required')
  final bool phoneNumberRequired;

  @JsonKey(name: 'email_required')
  final bool emailRequired;

  @JsonKey(name: 'total_price')
  final String totalPrice;

  const AndroidPayPaymentRequest({
    this.billingAddressRequired,
    this.currencyCode,
    this.lineItems,
    this.shippingAddressRequired,
    this.shippingCountries,
    this.phoneNumberRequired,
    this.emailRequired,
    this.totalPrice,
  });

  factory AndroidPayPaymentRequest.fromJson(Map json) =>
      _$AndroidPayPaymentRequestFromJson(json);
  Map toJson() => _$AndroidPayPaymentRequestToJson(this);
}
