class CardFormPaymentRequest {
  PrefilledInformation prefilledInformation;
  String requiredBillingAddressFields;

  CardFormPaymentRequest({this.prefilledInformation, this.requiredBillingAddressFields});

  factory CardFormPaymentRequest.fromJson(Map<dynamic, dynamic> json) {
    return CardFormPaymentRequest(
      prefilledInformation:
          json['prefilledInformation'] != null ? PrefilledInformation.fromJson(json['prefilledInformation']) : null,
      requiredBillingAddressFields: json['requiredBillingAddressFields'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requiredBillingAddressFields'] = this.requiredBillingAddressFields;
    if (this.prefilledInformation != null) {
      data['prefilledInformation'] = this.prefilledInformation.toJson();
    }
    return data;
  }
}

class PrefilledInformation {
  BillingAddress billingAddress;

  PrefilledInformation({this.billingAddress});

  factory PrefilledInformation.fromJson(Map<dynamic, dynamic> json) {
    return PrefilledInformation(
      billingAddress: json['billingAddress'] != null ? BillingAddress.fromJson(json['billingAddress']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.billingAddress != null) {
      data['billingAddress'] = this.billingAddress.toJson();
    }
    return data;
  }
}

class BillingAddress {
  String city;
  String country;
  String line1;
  String line2;
  String name;
  String postalCode;
  String state;

  BillingAddress({this.city, this.country, this.line1, this.line2, this.name, this.postalCode, this.state});

  factory BillingAddress.fromJson(Map<dynamic, dynamic> json) {
    return BillingAddress(
      city: json['city'],
      country: json['country'],
      line1: json['line1'],
      line2: json['line2'],
      name: json['name'],
      postalCode: json['postalCode'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['name'] = this.name;
    data['postalCode'] = this.postalCode;
    data['state'] = this.state;
    return data;
  }
}
