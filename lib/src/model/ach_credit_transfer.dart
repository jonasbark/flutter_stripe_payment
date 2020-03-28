class AchCreditTransfer {
  String accountNumber;
  String bankName;
  String fingerprint;
  String routingNumber;
  String swiftCode;

  AchCreditTransfer(
      {this.accountNumber,
      this.bankName,
      this.fingerprint,
      this.routingNumber,
      this.swiftCode});

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
