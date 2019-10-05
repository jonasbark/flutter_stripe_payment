import 'package:flutter/foundation.dart';

enum RequiredBillingAddressFields { all, name, email, phone, postal_address }

enum RequiredShippingAddressFields { all, name, email, phone, postal_address }

enum ShippingType { shipping, delivery, store_pickup, service_pickup }

class ApplePayPaymentRequest {
  List<RequiredBillingAddressFields> requiredBillingAddressFields;
  List<RequiredShippingAddressFields> requiredShippingAddressFields;
  List<ShippingMethod> shippingMethod;
  String currencyCode;
  String countryCode;
  ShippingType shippingType;
  List<ApplePayItem> items;

  ApplePayPaymentRequest(
      {this.requiredBillingAddressFields,
      this.requiredShippingAddressFields,
      this.shippingMethod,
      this.currencyCode,
      this.countryCode,
      this.shippingType,
      this.items});

  Map<dynamic, dynamic> get json {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requiredBillingAddressFields != null) {
      data['requiredBillingAddressFields'] = this.requiredBillingAddressFields.map((b) => describeEnum(b)).toList();
    }
    if (this.requiredShippingAddressFields != null) {
      data['requiredShippingAddressFields'] = this.requiredShippingAddressFields.map((s) => describeEnum(s)).toList();
    }
    data['currencyCode'] = currencyCode;
    data['shippingType'] = shippingType;
    if (this.items != null) {
      data['line_items'] = this.items.map((i) => i.json).toList();
    }
    return data;
  }
}

class ShippingMethod {
  String amount;
  String detail;
  String id;
  String label;

  ShippingMethod({this.amount, this.detail, this.id, this.label});

  factory ShippingMethod.fromJson(Map<String, dynamic> json) {
    return ShippingMethod(
      amount: json['amount'],
      detail: json['detail'],
      id: json['id'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['detail'] = this.detail;
    data['id'] = this.id;
    data['label'] = this.label;
    return data;
  }
}

class ApplePayItem {
  String label;
  num amount;
  String type;
  ApplePayItem({this.label, this.amount, this.type});

  Map<String, dynamic> get json {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.label;
    data['amount'] = this.amount;
    data['type'] = this.type;
    return data;
  }
}
