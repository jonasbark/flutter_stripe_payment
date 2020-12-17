import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apple_pay_payment_request.g.dart';

enum RequiredBillingAddressFields { all, name, email, phone, postal_address }

enum RequiredShippingAddressFields { all, name, email, phone, postal_address }

enum ShippingType { shipping, delivery, store_pickup, service_pickup }

@JsonSerializable(createFactory: false)
class ApplePayPaymentOptions {
  final List<RequiredBillingAddressFields> requiredBillingAddressFields;
  final List<RequiredShippingAddressFields> requiredShippingAddressFields;
  final List<ShippingMethod> shippingMethod;
  final String currencyCode;
  final String countryCode;
  final ShippingType shippingType;
  final List<ApplePayItem> items;

  const ApplePayPaymentOptions({
    this.requiredBillingAddressFields,
    this.requiredShippingAddressFields,
    this.shippingMethod,
    this.currencyCode,
    this.countryCode,
    this.shippingType,
    this.items,
  });

  Map toJson() => _$ApplePayPaymentOptionsToJson(this);
}

@JsonSerializable()
class ShippingMethod {
  final String amount;
  final String detail;
  final String id;
  final String label;

  const ShippingMethod({
    this.amount,
    this.detail,
    this.id,
    this.label,
  });

  factory ShippingMethod.fromJson(Map json) => _$ShippingMethodFromJson(json);
  Map toJson() => _$ShippingMethodToJson(this);
}

@JsonSerializable(createFactory: false)
class ApplePayItem {
  final String label;
  final String amount;
  final String type;

  const ApplePayItem({
    this.label,
    this.amount,
    this.type,
  });

  Map toJson() => _$ApplePayItemToJson(this);
}
