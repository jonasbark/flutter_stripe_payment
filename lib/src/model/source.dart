import 'ach_credit_transfer.dart';
import 'owner.dart';
import 'receiver.dart';

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
      receiver:
          json['receiver'] != null ? Receiver.fromJson(json['receiver']) : null,
      achCreditTransfer: json['ach_credit_transfer'] != null
          ? AchCreditTransfer.fromJson(json['ach_credit_transfer'])
          : null,
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
    if (this.statementDescriptor != null)
      data['statement_descriptor'] = this.statementDescriptor;
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
