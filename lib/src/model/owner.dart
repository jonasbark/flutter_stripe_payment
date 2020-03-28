import 'address.dart';

class Owner {
  Address address;
  String email;
  String name;
  String phone;
  Address verifiedAddress;
  String verifiedEmail;
  String verifiedName;
  String verifiedPhone;

  Owner(
      {this.address,
      this.email,
      this.name,
      this.phone,
      this.verifiedAddress,
      this.verifiedEmail,
      this.verifiedName,
      this.verifiedPhone});

  factory Owner.fromJson(Map<dynamic, dynamic> json) {
    return Owner(
      address: json['address'] != null
          ? Address.fromJson(json['address'])
          : null,
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      verifiedAddress: json['verified_address'] != null
          ? Address.fromJson(json['verified_address'])
          : null,
      verifiedEmail: json['verified_email'],
      verifiedName: json['verified_name'],
      verifiedPhone: json['verified_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) data['address'] = this.address;
    if (this.email != null) data['email'] = this.email;
    if (this.name != null) data['name'] = this.name;
    if (this.phone != null) data['phone'] = this.phone;
    if (this.verifiedAddress != null)
      data['verified_address'] = this.verifiedAddress;
    if (this.verifiedEmail != null) data['verified_email'] = this.verifiedEmail;
    if (this.verifiedName != null) data['verified_name'] = this.verifiedName;
    if (this.verifiedPhone != null) data['verified_phone'] = this.verifiedPhone;
    return data;
  }
}
