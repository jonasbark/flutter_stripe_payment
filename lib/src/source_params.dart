class SourceParams {
  int amount;
  String currency;
  String returnURL;
  String type;
  String name;
  String statement_descriptor;
  String country;
  String email;
  String card;

  SourceParams({this.amount, this.currency, this.returnURL, this.type, this.name, this.statement_descriptor, this.country, this.email, this.card});

  factory SourceParams.fromJson(Map<String, dynamic> json) {
    return SourceParams(
      amount: json['amount'],
      currency: json['currency'],
      returnURL: json['returnURL'],
      type: json['type'],
      name: json['name'],
      statement_descriptor: json['statement_descriptor'],
      country: json['country'],
      email: json['email'],
      card: json['card']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['returnURL'] = this.returnURL;
    data['type'] = this.type;
    data['name'] = this.name;
    data['statement_descriptor'] = this.statement_descriptor;
    data['country'] = this.country;
    data['email'] = this.email;
    data['card'] = this.card;
    return data;
  }
}
