import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart' as stripe;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _paymentToken = "";
  var _confirmNativePay = "";

  @override
  initState() {
    super.initState();

    stripe.StripePayment.setOptions(
        stripe.StripeOptions(publishableKey: "pk_test_", merchantId: "Test", androidPayMode: 'test'));
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Add Card with Form"),
              onPressed: () {
                stripe.StripePayment.paymentRequestWithCardForm(stripe.CardFormPaymentRequest()).then((token) {
                  setState(() {
                    _paymentToken = token.toJson().toString();
                  });
                });
              },
            ),
            RaisedButton(
              child: Text("Add Card without Form"),
              onPressed: () {
                stripe.StripePayment.createTokenWithCard(
                        stripe.Card(number: '4000002760003184', expMonth: 12, expYear: 21))
                    .then((token) {
                  setState(() {
                    _paymentToken = token.toJson().toString();
                  });
                }).catchError(print);
              },
            ),
            Text("Current payment token: $_paymentToken"),
            Divider(),
            /*RaisedButton(
              child: Text("Setup payment"),
              onPressed: () {
                StripePayment.setupPayment(_paymentMethodId, _currentSecret).then((String token) {
                  setState(() {
                    _setupPaymentId = token;
                  });
                }).catchError(print);
              },
            ),
            Text("Current setup payment ID: $_setupPaymentId"),
            Divider(),
            RaisedButton(
              child: Text("Confirm payment"),
              onPressed: () {
                StripePayment.confirmPayment(_paymentMethodId, _currentSecret).then((String token) {
                  setState(() {
                    _confirmPaymentId = token;
                  });
                }).catchError(print);
              },
            ),
            Text("Current confirm payment ID: $_confirmPaymentId"),
            Divider(),*/
            LayoutBuilder(
              builder: (context, constraints) => RaisedButton(
                child: Text("Native payment"),
                onPressed: () {
                  stripe.StripePayment.paymentRequestWithNativePay(
                      androidPayOptions: stripe.AndroidPayPaymentRequest(
                        total_price: "1.20",
                        currency_code: "EUR",
                      ),
                      applePayOptions: stripe.ApplePayPaymentRequest(countryCode: 'DE', currencyCode: 'EUR', items: [
                        stripe.ApplePayItem(
                          label: 'Test',
                          amount: 13,
                        )
                      ])).then((token) {
                    setState(() {
                      _confirmNativePay = token.toJson().toString();
                    });
                  }).catchError((e) {
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                  });
                },
              ),
            ),
            Text("Native payment: $_confirmNativePay"),
          ],
        ),
      ),
    );
  }
}
