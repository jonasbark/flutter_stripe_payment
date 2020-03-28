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
    if (this.amountReceived != null)
      data['amount_received'] = this.amountReceived;
    if (this.amountReturned != null)
      data['amount_returned'] = this.amountReturned;
    if (this.refundAttributesMethod != null)
      data['refund_attributes_method'] = this.refundAttributesMethod;
    if (this.refundAttributesStatus != null)
      data['refund_attributes_status'] = this.refundAttributesStatus;
    return data;
  }
}
