import 'package:stripe_payment/src/token.dart';

class SourceParams {
  int? amount;
  String? currency;
  String? returnURL;
  String? type;
  String? name;
  String? statementDescriptor;
  String? country;
  String? email;
  CreditCard? card;

  SourceParams(
      {this.amount,
      this.currency,
      this.returnURL,
      this.type,
      this.name,
      this.statementDescriptor,
      this.country,
      this.email,
      this.card});

  factory SourceParams.fromJson(Map<String, dynamic> json) {
    return SourceParams(
        amount: json['amount'],
        currency: json['currency'],
        returnURL: json['returnURL'],
        type: json['type'],
        name: json['name'],
        statementDescriptor: json['statement_descriptor'],
        country: json['country'],
        email: json['email'],
        card: json['card']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) data['amount'] = this.amount;
    if (this.currency != null) data['currency'] = this.currency;
    if (this.returnURL != null) data['returnURL'] = this.returnURL;
    if (this.type != null) data['type'] = this.type;
    if (this.name != null) data['name'] = this.name;
    if (this.statementDescriptor != null) data['statement_descriptor'] = this.statementDescriptor;
    if (this.country != null) data['country'] = this.country;
    if (this.email != null) data['email'] = this.email;
    if (this.card != null) data['card'] = this.card!.toJson();
    return data;
  }
}
