import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stripe_payment/stripe_payment.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _paymentMethodId = "";
  var _setupPaymentId = "";
  var _confirmPaymentId = "";

  final _currentSecret = "";

  @override
  initState() {
    super.initState();

    StripePayment.setSettings(StripeSettings(publishableKey: "pk_test_"));
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
              child: Text("Add Card"),
              onPressed: () {
                StripePayment.addSource().then((String token) {
                  setState(() {
                    _paymentMethodId = token;
                  });
                });
              },
            ),
            Text("Current payment method ID: $_paymentMethodId"),
            Divider(),
            RaisedButton(
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
          ],
        ),
      ),
    );
  }
}
