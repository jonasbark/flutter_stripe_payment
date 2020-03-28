import 'address.dart';

class PrefilledInformation {
  Address billingAddress;

  PrefilledInformation({this.billingAddress});

  factory PrefilledInformation.fromJson(Map<dynamic, dynamic> json) {
    return PrefilledInformation(
      billingAddress: json['billingAddress'] != null
          ? Address.fromJson(json['billingAddress'])
          : null,
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
