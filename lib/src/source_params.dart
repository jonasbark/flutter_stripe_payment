class SourceParams {
  int amount;
  String currency;
  String returnURL;
  String type;

  SourceParams({this.amount, this.currency, this.returnURL, this.type});

  factory SourceParams.fromJson(Map<String, dynamic> json) {
    return SourceParams(
      amount: json['amount'],
      currency: json['currency'],
      returnURL: json['returnURL'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['returnURL'] = this.returnURL;
    data['type'] = this.type;
    return data;
  }
}
