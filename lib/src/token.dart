import 'package:flutter/material.dart';

class Token {
  BankAccount bankAccount;
  Card card;
  double created;
  bool livemode;
  String tokenId;

  Token({this.bankAccount, this.card, this.created, this.livemode, this.tokenId});

  factory Token.fromJson(Map<dynamic, dynamic> json) {
    return Token(
      bankAccount: json['bankAccount'] != null ? BankAccount.fromJson(json['bankAccount']) : null,
      card: json['card'] != null ? Card.fromJson(json['card']) : null,
      created: json['created'] is int ? (json['created'] as int).toDouble() : json['created'],
      livemode: json['livemode'],
      tokenId: json['tokenId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created'] = this.created;
    data['livemode'] = this.livemode;
    data['tokenId'] = this.tokenId;
    if (this.bankAccount != null) {
      data['bankAccount'] = this.bankAccount.toJson();
    }
    if (this.card != null) {
      data['card'] = this.card.toJson();
    }
    return data;
  }
}

class BankAccount {
  String accountHolderName;
  String accountHolderType;
  String accountNumber;
  String bankName;
  String countryCode;
  String currency;
  String fingerprint;
  String last4;
  String routingNumber;

  BankAccount(
      {this.accountHolderName,
      this.accountHolderType,
      this.accountNumber,
      this.bankName,
      this.countryCode,
      this.currency,
      this.fingerprint,
      this.last4,
      this.routingNumber});

  factory BankAccount.fromJson(Map<dynamic, dynamic> json) {
    return BankAccount(
      accountHolderName: json['accountHolderName'],
      accountHolderType: json['accountHolderType'],
      accountNumber: json['accountNumber'],
      bankName: json['bankName'],
      countryCode: json['countryCode'],
      currency: json['currency'],
      fingerprint: json['fingerprint'],
      last4: json['last4'],
      routingNumber: json['routingNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountHolderName'] = this.accountHolderName;
    data['accountHolderType'] = this.accountHolderType;
    data['accountNumber'] = this.accountNumber;
    data['bankName'] = this.bankName;
    data['countryCode'] = this.countryCode;
    data['currency'] = this.currency;
    data['fingerprint'] = this.fingerprint;
    data['last4'] = this.last4;
    data['routingNumber'] = this.routingNumber;
    return data;
  }
}

class Card {
  String addressCity;
  String addressCountry;
  String addressLine1;
  String addressLine2;
  String addressState;
  String addressZip;
  String brand;
  String cardId;
  String country;
  int expMonth;
  int expYear;
  String funding;
  String last4;
  String name;
  String number;
  String cvc;

  Card(
      {this.addressCity,
      this.addressCountry,
      this.addressLine1,
      this.addressLine2,
      this.addressState,
      this.addressZip,
      this.brand,
      this.cardId,
      this.country,
      @required this.expMonth,
      @required this.expYear,
      @required this.number,
      this.cvc,
      this.funding,
      this.last4,
      this.name});

  factory Card.fromJson(Map<dynamic, dynamic> json) {
    return Card(
      addressCity: json['addressCity'],
      addressCountry: json['addressCountry'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      addressState: json['addressState'],
      addressZip: json['addressZip'],
      brand: json['brand'],
      cardId: json['cardId'],
      country: json['country'],
      expMonth: json['expMonth'],
      expYear: json['expYear'],
      funding: json['funding'],
      last4: json['last4'],
      name: json['name'],
      cvc: json['cvc'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressCity'] = this.addressCity;
    data['addressCountry'] = this.addressCountry;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['addressState'] = this.addressState;
    data['addressZip'] = this.addressZip;
    data['brand'] = this.brand;
    data['cardId'] = this.cardId;
    data['country'] = this.country;
    data['expMonth'] = this.expMonth;
    data['expYear'] = this.expYear;
    data['funding'] = this.funding;
    data['last4'] = this.last4;
    data['name'] = this.name;
    data['number'] = this.number;
    data['cvc'] = this.cvc;
    return data;
  }
}
