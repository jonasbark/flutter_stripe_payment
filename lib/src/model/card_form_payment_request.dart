import 'prefilled_information.dart';

class CardFormPaymentRequest {
  PrefilledInformation prefilledInformation;
  String requiredBillingAddressFields;

  CardFormPaymentRequest(
      {this.prefilledInformation, this.requiredBillingAddressFields});

  factory CardFormPaymentRequest.fromJson(Map<dynamic, dynamic> json) {
    return CardFormPaymentRequest(
      prefilledInformation: json['prefilledInformation'] != null
          ? PrefilledInformation.fromJson(json['prefilledInformation'])
          : null,
      requiredBillingAddressFields: json['requiredBillingAddressFields'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.requiredBillingAddressFields !=
        null) if (this.requiredBillingAddressFields != null)
      data['requiredBillingAddressFields'] = this.requiredBillingAddressFields;
    if (this.prefilledInformation != null) {
      data['prefilledInformation'] = this.prefilledInformation.toJson();
    }
    return data;
  }
}
