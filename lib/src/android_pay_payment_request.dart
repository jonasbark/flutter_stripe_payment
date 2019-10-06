import 'package:flutter/material.dart';

class AndroidPayPaymentRequest {
  bool billing_address_required;
  String currency_code;
  List<LineItem> line_items;
  bool shipping_address_required;
  List<String> shipping_countries;
  String total_price;

  AndroidPayPaymentRequest(
      {this.billing_address_required,
      @required this.currency_code,
      this.line_items,
      this.shipping_address_required,
      this.shipping_countries,
      @required this.total_price});

  factory AndroidPayPaymentRequest.fromJson(Map<dynamic, dynamic> json) {
    return AndroidPayPaymentRequest(
      billing_address_required: json['billing_address_required'],
      currency_code: json['currency_code'],
      line_items:
          json['line_items'] != null ? (json['line_items'] as List).map((i) => LineItem.fromJson(i)).toList() : null,
      shipping_address_required: json['shipping_address_required'],
      shipping_countries: json['shipping_countries'] != null ? new List<String>.from(json['shipping_countries']) : null,
      total_price: json['total_price'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billing_address_required != null) data['billing_address_required'] = this.billing_address_required;
    if (this.currency_code != null) data['currency_code'] = this.currency_code;
    if (this.shipping_address_required != null) data['shipping_address_required'] = this.shipping_address_required;
    if (this.total_price != null) data['total_price'] = this.total_price;
    if (this.line_items != null) {
      data['line_items'] = this.line_items.map((v) => v.toJson()).toList();
    }
    if (this.shipping_countries != null) {
      if (this.shipping_countries != null) data['shipping_countries'] = this.shipping_countries;
    }
    return data;
  }
}

class LineItem {
  String currency_code;
  String description;
  String quantity;
  String total_price;
  String unit_price;

  LineItem({this.currency_code, this.description, this.quantity, this.total_price, this.unit_price});

  factory LineItem.fromJson(Map<dynamic, dynamic> json) {
    return LineItem(
      currency_code: json['currency_code'],
      description: json['description'],
      quantity: json['quantity'],
      total_price: json['total_price'],
      unit_price: json['unit_price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currency_code != null) data['currency_code'] = this.currency_code;
    if (this.description != null) data['description'] = this.description;
    if (this.quantity != null) data['quantity'] = this.quantity;
    if (this.total_price != null) data['total_price'] = this.total_price;
    if (this.unit_price != null) data['unit_price'] = this.unit_price;
    return data;
  }
}
