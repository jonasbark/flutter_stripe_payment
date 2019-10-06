class Source {
  String object;
  Receiver receiver;
  AchCreditTransfer ach_credit_transfer;
  num amount;
  String client_secret;
  num created;
  String currency;
  String flow;
  String sourceId;
  bool livemode;
  Map<dynamic, dynamic> metadata;
  Owner owner;
  String statement_descriptor;
  String status;
  String type;
  String usage;

  Source(
      {this.object,
      this.receiver,
      this.ach_credit_transfer,
      this.amount,
      this.client_secret,
      this.created,
      this.currency,
      this.flow,
      this.sourceId,
      this.livemode,
      this.metadata,
      this.owner,
      this.statement_descriptor,
      this.status,
      this.type,
      this.usage});

  factory Source.fromJson(Map<dynamic, dynamic> json) {
    return Source(
      object: json['object'],
      receiver: json['receiver'] != null ? Receiver.fromJson(json['receiver']) : null,
      ach_credit_transfer:
          json['ach_credit_transfer'] != null ? AchCreditTransfer.fromJson(json['ach_credit_transfer']) : null,
      amount: json['amount'],
      client_secret: json['client_secret'],
      created: json['created'],
      currency: json['currency'],
      flow: json['flow'],
      sourceId: json['sourceId'],
      livemode: json['livemode'],
      metadata: json['metadata'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      statement_descriptor: json['statement_descriptor'],
      status: json['status'],
      type: json['type'],
      usage: json['usage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.object != null) data['object'] = this.object;
    if (this.client_secret != null) data['client_secret'] = this.client_secret;
    if (this.created != null) data['created'] = this.created;
    if (this.currency != null) data['currency'] = this.currency;
    if (this.flow != null) data['flow'] = this.flow;
    if (this.sourceId != null) data['sourceId'] = this.sourceId;
    if (this.livemode != null) data['livemode'] = this.livemode;
    if (this.statement_descriptor != null) data['statement_descriptor'] = this.statement_descriptor;
    if (this.status != null) data['status'] = this.status;
    if (this.type != null) data['type'] = this.type;
    if (this.usage != null) data['usage'] = this.usage;
    if (this.receiver != null) {
      data['receiver'] = this.receiver.toJson();
    }
    if (this.ach_credit_transfer != null) {
      data['ach_credit_transfer'] = this.ach_credit_transfer.toJson();
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
  int amount_charged;
  int amount_received;
  int amount_returned;
  String refund_attributes_method;
  String refund_attributes_status;

  Receiver(
      {this.address,
      this.amount_charged,
      this.amount_received,
      this.amount_returned,
      this.refund_attributes_method,
      this.refund_attributes_status});

  factory Receiver.fromJson(Map<dynamic, dynamic> json) {
    return Receiver(
      address: json['address'],
      amount_charged: json['amount_charged'],
      amount_received: json['amount_received'],
      amount_returned: json['amount_returned'],
      refund_attributes_method: json['refund_attributes_method'],
      refund_attributes_status: json['refund_attributes_status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) data['address'] = this.address;
    if (this.amount_charged != null) data['amount_charged'] = this.amount_charged;
    if (this.amount_received != null) data['amount_received'] = this.amount_received;
    if (this.amount_returned != null) data['amount_returned'] = this.amount_returned;
    if (this.refund_attributes_method != null) data['refund_attributes_method'] = this.refund_attributes_method;
    if (this.refund_attributes_status != null) data['refund_attributes_status'] = this.refund_attributes_status;
    return data;
  }
}

class Owner {
  String address;
  String email;
  String name;
  String phone;
  String verified_address;
  String verified_email;
  String verified_name;
  String verified_phone;

  Owner(
      {this.address,
      this.email,
      this.name,
      this.phone,
      this.verified_address,
      this.verified_email,
      this.verified_name,
      this.verified_phone});

  factory Owner.fromJson(Map<dynamic, dynamic> json) {
    return Owner(
      address: json['address'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      verified_address: json['verified_address'],
      verified_email: json['verified_email'],
      verified_name: json['verified_name'],
      verified_phone: json['verified_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) data['address'] = this.address;
    if (this.email != null) data['email'] = this.email;
    if (this.name != null) data['name'] = this.name;
    if (this.phone != null) data['phone'] = this.phone;
    if (this.verified_address != null) data['verified_address'] = this.verified_address;
    if (this.verified_email != null) data['verified_email'] = this.verified_email;
    if (this.verified_name != null) data['verified_name'] = this.verified_name;
    if (this.verified_phone != null) data['verified_phone'] = this.verified_phone;
    return data;
  }
}

class AchCreditTransfer {
  String account_number;
  String bank_name;
  String fingerprint;
  String routing_number;
  String swift_code;

  AchCreditTransfer({this.account_number, this.bank_name, this.fingerprint, this.routing_number, this.swift_code});

  factory AchCreditTransfer.fromJson(Map<dynamic, dynamic> json) {
    return AchCreditTransfer(
      account_number: json['account_number'],
      bank_name: json['bank_name'],
      fingerprint: json['fingerprint'],
      routing_number: json['routing_number'],
      swift_code: json['swift_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<dynamic, dynamic>();
    if (this.account_number != null) data['account_number'] = this.account_number;
    if (this.bank_name != null) data['bank_name'] = this.bank_name;
    if (this.fingerprint != null) data['fingerprint'] = this.fingerprint;
    if (this.routing_number != null) data['routing_number'] = this.routing_number;
    if (this.swift_code != null) data['swift_code'] = this.swift_code;
    return data;
  }
}
