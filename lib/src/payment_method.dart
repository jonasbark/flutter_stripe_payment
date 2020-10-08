import 'package:stripe_payment/src/token.dart';

import 'card_form_payment_request.dart';

class PaymentMethodRequest {
  final BillingAddress billingAddress;
  final CreditCard card;
  final Token token;
  final Map<String, String> metadata;
  final SepaDebit sepaDebit;

  PaymentMethodRequest({this.billingAddress, this.card,this.sepaDebit, this.token, this.metadata}) {
    assert(card != null || token != null || sepaDebit!=null);
  }

  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = card.toJson();
    }
    if (this.sepaDebit != null) {
      data['sepa_debit'] = sepaDebit.toJson();
    }
    if (this.token != null) {
      data['token'] = token.toJson();
    }
    if (this.billingAddress != null) {
      data['billingAddress'] = this.billingAddress.toJson();
    }
    if (this.metadata != null) {
      if (this.metadata != null) data['metadata'] = this.metadata;
    }
    return data;
  }
}

class PaymentMethod {
  BillingDetails billingDetails;
  CreditCard card;
  num created;
  String customerId;
  String id;
  bool livemode;
  String type;
  SepaDebit sepaDebit;
  PaymentMethod({this.billingDetails, this.card, this.created, this.customerId, this.id, this.livemode, this.type,this.sepaDebit});

  factory PaymentMethod.fromJson(Map<dynamic, dynamic> json) {
    return PaymentMethod(
      billingDetails: json['billingDetails'] != null ? BillingDetails.fromJson(json['billingDetails']) : null,
      card: json['card'] != null ? CreditCard.fromJson(json['card']) : null,
      created: json['created'],
      customerId: json['customerId'],
      sepaDebit: json['sepa_debit'] != null ? SepaDebit.fromJson(json['card']) : null,
      id: json['id'],
      livemode: json['livemode'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.created != null) if (this.created != null) data['created'] = this.created;
    if (this.customerId != null) data['customerId'] = this.customerId;
    if (this.id != null) data['id'] = this.id;
    if (this.livemode != null) data['livemode'] = this.livemode;
    if (this.type != null) data['type'] = this.type;
    if (this.billingDetails != null) {
      data['billingDetails'] = this.billingDetails.toJson();
    }
    if (this.card != null) {
      data['card'] = this.card.toJson();
    }
    if (this.sepaDebit != null) {
      data['sepa_debit'] = this.sepaDebit.toJson();
    }
    return data;
  }
}

class BillingDetails {
  BillingAddress address;
  String email;
  String name;
  String phone;

  BillingDetails({this.address, this.email, this.name, this.phone});

  factory BillingDetails.fromJson(Map<dynamic, dynamic> json) {
    return BillingDetails(
      address: json['address'] != null ? BillingAddress.fromJson(json['address']) : null,
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.email != null) data['email'] = this.email;
    if (this.name != null) data['name'] = this.name;
    if (this.phone != null) data['phone'] = this.phone;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}
