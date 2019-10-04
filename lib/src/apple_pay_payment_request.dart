enum RequiredBillingAddressFields { all, name, email, phone, postal_address }

enum RequiredShippingAddressFields { all, name, email, phone, postal_address }

class ApplePayPaymentRequest {

  List<ApplePayItem> items;
  List<ApplePayOptions> options;
  RequiredBillingAddressFields billing_address_required;
  RequiredShippingAddressFields shipping_address_required;

  ApplePayPaymentRequest({this.items, this.options, this.billing_address_required, this.shipping_address_required});

  Map<dynamic, dynamic> get toJson {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billing_address_required'] = this.billing_address_required;
    data['shipping_address_required'] = this.shipping_address_required;
    if (this.items != null) { data['line_items'] = this.items.map((i) => i.toJson).toList(); }
    data['options'] = this.options.map((o) => o.toJson).toList();
    return data;
  }

}

class ApplePayOptions {

  String id;
  String name;
  String details;
  double amount;
  ApplePayOptions({this.id, this.name, this.details, this.amount});

  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['amount'] = this.amount;
    return data;
  }

}

class ApplePayItem {

  String name;
  double amount;
  bool is_pending;
  ApplePayItem({this.name, this.amount, this.is_pending});

  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['is_pending'] = this.is_pending;
    return data;
  }

}
