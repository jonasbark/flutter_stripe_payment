import 'package:flutter/material.dart';

class AndroidPayPaymentRequest {
  bool? billingAddressRequired;
  String? currencyCode;
  List<LineItem>? lineItems;
  bool? shippingAddressRequired;
  List<String>? shippingCountries;
  String? totalPrice;

  AndroidPayPaymentRequest(
      {this.billingAddressRequired,
      required this.currencyCode,
      this.lineItems,
      this.shippingAddressRequired,
      this.shippingCountries,
      required this.totalPrice});

  factory AndroidPayPaymentRequest.fromJson(Map<dynamic, dynamic> json) {
    return AndroidPayPaymentRequest(
      billingAddressRequired: json['billing_address_required'],
      currencyCode: json['currency_code'],
      lineItems:
          json['line_items'] != null ? (json['line_items'] as List).map((i) => LineItem.fromJson(i)).toList() : null,
      shippingAddressRequired: json['shipping_address_required'],
      shippingCountries: json['shipping_countries'] != null ? new List<String>.from(json['shipping_countries']) : null,
      totalPrice: json['total_price'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billingAddressRequired != null) data['billing_address_required'] = this.billingAddressRequired;
    if (this.currencyCode != null) data['currency_code'] = this.currencyCode;
    if (this.shippingAddressRequired != null) data['shipping_address_required'] = this.shippingAddressRequired;
    if (this.totalPrice != null) data['total_price'] = this.totalPrice;
    if (this.lineItems != null) {
      data['line_items'] = this.lineItems!.map((v) => v.toJson()).toList();
    }
    if (this.shippingCountries != null) {
      if (this.shippingCountries != null) data['shipping_countries'] = this.shippingCountries;
    }
    return data;
  }
}

class LineItem {
  String? currencyCode;
  String? description;
  String? quantity;
  String? totalPrice;
  String? unitPrice;

  LineItem({this.currencyCode, this.description, this.quantity, this.totalPrice, this.unitPrice});

  factory LineItem.fromJson(Map<dynamic, dynamic> json) {
    return LineItem(
      currencyCode: json['currency_code'],
      description: json['description'],
      quantity: json['quantity'],
      totalPrice: json['total_price'],
      unitPrice: json['unit_price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currencyCode != null) data['currency_code'] = this.currencyCode;
    if (this.description != null) data['description'] = this.description;
    if (this.quantity != null) data['quantity'] = this.quantity;
    if (this.totalPrice != null) data['total_price'] = this.totalPrice;
    if (this.unitPrice != null) data['unit_price'] = this.unitPrice;
    return data;
  }
}
