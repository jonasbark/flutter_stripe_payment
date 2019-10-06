class Source {
  String object;
  Receiver receiver;
  AchCreditTransfer ach_credit_transfer;
  String amount;
  String client_secret;
  int created;
  String currency;
  String flow;
  String id;
  bool livemode;
  Metadata metadata;
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
      this.id,
      this.livemode,
      this.metadata,
      this.owner,
      this.statement_descriptor,
      this.status,
      this.type,
      this.usage});

  factory Source.fromJson(Map<String, dynamic> json) {
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
      id: json['id'],
      livemode: json['livemode'],
      metadata: json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      statement_descriptor: json['statement_descriptor'],
      status: json['status'],
      type: json['type'],
      usage: json['usage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['object'] = this.object;
    data['client_secret'] = this.client_secret;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['flow'] = this.flow;
    data['id'] = this.id;
    data['livemode'] = this.livemode;
    data['statement_descriptor'] = this.statement_descriptor;
    data['status'] = this.status;
    data['type'] = this.type;
    data['usage'] = this.usage;
    if (this.receiver != null) {
      data['receiver'] = this.receiver.toJson();
    }
    if (this.ach_credit_transfer != null) {
      data['ach_credit_transfer'] = this.ach_credit_transfer.toJson();
    }
    data['amount'] = this.amount;
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    return data;
  }
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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

  factory Receiver.fromJson(Map<String, dynamic> json) {
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
    data['address'] = this.address;
    data['amount_charged'] = this.amount_charged;
    data['amount_received'] = this.amount_received;
    data['amount_returned'] = this.amount_returned;
    data['refund_attributes_method'] = this.refund_attributes_method;
    data['refund_attributes_status'] = this.refund_attributes_status;
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

  factory Owner.fromJson(Map<String, dynamic> json) {
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
    data['address'] = this.address;
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['verified_address'] = this.verified_address;
    data['verified_email'] = this.verified_email;
    data['verified_name'] = this.verified_name;
    data['verified_phone'] = this.verified_phone;
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

  factory AchCreditTransfer.fromJson(Map<String, dynamic> json) {
    return AchCreditTransfer(
      account_number: json['account_number'],
      bank_name: json['bank_name'],
      fingerprint: json['fingerprint'],
      routing_number: json['routing_number'],
      swift_code: json['swift_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_number'] = this.account_number;
    data['bank_name'] = this.bank_name;
    data['fingerprint'] = this.fingerprint;
    data['routing_number'] = this.routing_number;
    data['swift_code'] = this.swift_code;
    return data;
  }
}
