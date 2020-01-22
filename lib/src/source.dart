import 'package:stripe_payment/src/card_form_payment_request.dart';

class Source {
  String object;
  Receiver receiver;
  AchCreditTransfer achCreditTransfer;
  num amount;
  String clientSecret;
  num created;
  String currency;
  String flow;
  String sourceId;
  bool livemode;
  Map<dynamic, dynamic> metadata;
  Owner owner;
  String statementDescriptor;
  String status;
  String type;
  String usage;

  Source(
      {this.object,
      this.receiver,
      this.achCreditTransfer,
      this.amount,
      this.clientSecret,
      this.created,
      this.currency,
      this.flow,
      this.sourceId,
      this.livemode,
      this.metadata,
      this.owner,
      this.statementDescriptor,
      this.status,
      this.type,
      this.usage});

  factory Source.fromJson(Map<dynamic, dynamic> json) {
    return Source(
      object: json['object'],
      receiver: json['receiver'] != null ? Receiver.fromJson(json['receiver']) : null,
      achCreditTransfer:
          json['ach_credit_transfer'] != null ? AchCreditTransfer.fromJson(json['ach_credit_transfer']) : null,
      amount: json['amount'],
      clientSecret: json['client_secret'],
      created: json['created'],
      currency: json['currency'],
      flow: json['flow'],
      sourceId: json['sourceId'],
      livemode: json['livemode'],
      metadata: json['metadata'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      statementDescriptor: json['statement_descriptor'],
      status: json['status'],
      type: json['type'],
      usage: json['usage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.object != null) data['object'] = this.object;
    if (this.clientSecret != null) data['client_secret'] = this.clientSecret;
    if (this.created != null) data['created'] = this.created;
    if (this.currency != null) data['currency'] = this.currency;
    if (this.flow != null) data['flow'] = this.flow;
    if (this.sourceId != null) data['sourceId'] = this.sourceId;
    if (this.livemode != null) data['livemode'] = this.livemode;
    if (this.statementDescriptor != null) data['statement_descriptor'] = this.statementDescriptor;
    if (this.status != null) data['status'] = this.status;
    if (this.type != null) data['type'] = this.type;
    if (this.usage != null) data['usage'] = this.usage;
    if (this.receiver != null) {
      data['receiver'] = this.receiver.toJson();
    }
    if (this.achCreditTransfer != null) {
      data['ach_credit_transfer'] = this.achCreditTransfer.toJson();
    }
    if (this.amount != null) data['amount'] = this.amount;
    if (this.metadata != null) {
      if (this.metadata != null) data['metadata'] = this.metadata;
    }
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}

class Receiver {
  String address;
  int amountCharged;
  int amountReceived;
  int amountReturned;
  String refundAttributesMethod;
  String refundAttributesStatus;

  Receiver(
      {this.address,
      this.amountCharged,
      this.amountReceived,
      this.amountReturned,
      this.refundAttributesMethod,
      this.refundAttributesStatus});

  factory Receiver.fromJson(Map<dynamic, dynamic> json) {
    return Receiver(
      address: json['address'],
      amountCharged: json['amount_charged'],
      amountReceived: json['amount_received'],
      amountReturned: json['amount_returned'],
      refundAttributesMethod: json['refund_attributes_method'],
      refundAttributesStatus: json['refund_attributes_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) data['address'] = this.address;
    if (this.amountCharged != null) data['amount_charged'] = this.amountCharged;
    if (this.amountReceived != null) data['amount_received'] = this.amountReceived;
    if (this.amountReturned != null) data['amount_returned'] = this.amountReturned;
    if (this.refundAttributesMethod != null) data['refund_attributes_method'] = this.refundAttributesMethod;
    if (this.refundAttributesStatus != null) data['refund_attributes_status'] = this.refundAttributesStatus;
    return data;
  }
}

class Owner {
  BillingAddress address;
  String email;
  String name;
  String phone;
  BillingAddress verifiedAddress;
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
      address: json['address'] != null ? BillingAddress.fromJson(json['address']) : null,
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      verifiedAddress: json['verified_address'] != null ? BillingAddress.fromJson(json['verified_address']) : null,
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
    if (this.verifiedAddress != null) data['verified_address'] = this.verifiedAddress;
    if (this.verifiedEmail != null) data['verified_email'] = this.verifiedEmail;
    if (this.verifiedName != null) data['verified_name'] = this.verifiedName;
    if (this.verifiedPhone != null) data['verified_phone'] = this.verifiedPhone;
    return data;
  }
}

class AchCreditTransfer {
  String accountNumber;
  String bankName;
  String fingerprint;
  String routingNumber;
  String swiftCode;

  AchCreditTransfer({this.accountNumber, this.bankName, this.fingerprint, this.routingNumber, this.swiftCode});

  factory AchCreditTransfer.fromJson(Map<dynamic, dynamic> json) {
    return AchCreditTransfer(
      accountNumber: json['account_number'],
      bankName: json['bank_name'],
      fingerprint: json['fingerprint'],
      routingNumber: json['routing_number'],
      swiftCode: json['swift_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<dynamic, dynamic>();
    if (this.accountNumber != null) data['account_number'] = this.accountNumber;
    if (this.bankName != null) data['bank_name'] = this.bankName;
    if (this.fingerprint != null) data['fingerprint'] = this.fingerprint;
    if (this.routingNumber != null) data['routing_number'] = this.routingNumber;
    if (this.swiftCode != null) data['swift_code'] = this.swiftCode;
    return data;
  }
}
