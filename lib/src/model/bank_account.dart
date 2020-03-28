class BankAccount {
  String accountHolderName;
  String accountHolderType;
  String accountNumber;
  String bankName;
  String countryCode;
  String currency;
  String fingerprint;
  String last4;
  String routingNumber;

  BankAccount(
      {this.accountHolderName,
      this.accountHolderType,
      this.accountNumber,
      this.bankName,
      this.countryCode,
      this.currency,
      this.fingerprint,
      this.last4,
      this.routingNumber});

  factory BankAccount.fromJson(Map<dynamic, dynamic> json) {
    return BankAccount(
      accountHolderName: json['accountHolderName'],
      accountHolderType: json['accountHolderType'],
      accountNumber: json['accountNumber'],
      bankName: json['bankName'],
      countryCode: json['countryCode'],
      currency: json['currency'],
      fingerprint: json['fingerprint'],
      last4: json['last4'],
      routingNumber: json['routingNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.accountHolderName != null)
      data['accountHolderName'] = this.accountHolderName;
    if (this.accountHolderType != null)
      data['accountHolderType'] = this.accountHolderType;
    if (this.accountNumber != null) data['accountNumber'] = this.accountNumber;
    if (this.bankName != null) data['bankName'] = this.bankName;
    if (this.countryCode != null) data['countryCode'] = this.countryCode;
    if (this.currency != null) data['currency'] = this.currency;
    if (this.fingerprint != null) data['fingerprint'] = this.fingerprint;
    data['last4'] = this.last4;
    if (this.routingNumber != null) data['routingNumber'] = this.routingNumber;
    return data;
  }
}
