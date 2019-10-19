# stripe_payment_example

Demonstrates how to use the stripe_payment plugin.

## Getting Started

```dart
RaisedButton(
  child: Text("Create Source"),
  onPressed: () {
    StripePayment.createSourceWithParams(SourceParams(
      type: 'ideal',
      amount: 1099,
      currency: 'eur',
      returnURL: 'example://stripe-redirect',
    )).then((source) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${source.sourceId}')));
      setState(() {
        _source = source;
      });
    }).catchError(setError);
  },
),
Divider(),
RaisedButton(
  child: Text("Create Token with Card Form"),
  onPressed: () {
    StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest()).then((paymentMethod) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
      setState(() {
        _paymentMethod = paymentMethod;
      });
    }).catchError(setError);
  },
),
RaisedButton(
  child: Text("Create Token with Card"),
  onPressed: () {
    StripePayment.createTokenWithCard(
      testCard,
    ).then((token) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${token.tokenId}')));
      setState(() {
        _paymentToken = token;
      });
    }).catchError(setError);
  },
),
Divider(),
RaisedButton(
  child: Text("Create Payment Method with Card"),
  onPressed: () {
    StripePayment.createPaymentMethod(
      PaymentMethodRequest(
        card: testCard,
      ),
    ).then((paymentMethod) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
      setState(() {
        _paymentMethod = paymentMethod;
      });
    }).catchError(setError);
  },
),
RaisedButton(
  child: Text("Create Payment Method with existing token"),
  onPressed: _paymentToken == null
      ? null
      : () {
          StripePayment.createPaymentMethod(
            PaymentMethodRequest(
              card: CreditCard(
                token: _paymentToken.tokenId,
              ),
            ),
          ).then((paymentMethod) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${paymentMethod.id}')));
            setState(() {
              _paymentMethod = paymentMethod;
            });
          }).catchError(setError);
        },
),
Divider(),
RaisedButton(
  child: Text("Confirm Payment Intent"),
  onPressed: _paymentMethod == null || _currentSecret == null
      ? null
      : () {
          StripePayment.confirmPaymentIntent(
            PaymentIntent(
              clientSecret: _currentSecret,
              paymentMethodId: _paymentMethod.id,
            ),
          ).then((paymentIntent) {
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('Received ${paymentIntent.paymentIntentId}')));
            setState(() {
              _paymentIntent = paymentIntent;
            });
          }).catchError(setError);
        },
),
RaisedButton(
  child: Text("Authenticate Payment Intent"),
  onPressed: _currentSecret == null
      ? null
      : () {
          StripePayment.authenticatePaymentIntent(clientSecret: _currentSecret).then((paymentIntent) {
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('Received ${paymentIntent.paymentIntentId}')));
            setState(() {
              _paymentIntent = paymentIntent;
            });
          }).catchError(setError);
        },
),
Divider(),
RaisedButton(
  child: Text("Native payment"),
  onPressed: () {
    StripePayment.paymentRequestWithNativePay(
      androidPayOptions: AndroidPayPaymentRequest(
        total_price: "1.20",
        currency_code: "EUR",
      ),
      applePayOptions: ApplePayPaymentOptions(
        countryCode: 'DE',
        currencyCode: 'EUR',
        items: [
          ApplePayItem(
            label: 'Test',
            amount: '13',
          )
        ],
      ),
    ).then((token) {
      setState(() {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Received ${token.tokenId}')));
        _paymentToken = token;
      });
    }).catchError(setError);
  },
),
RaisedButton(
  child: Text("Complete Native Payment"),
  onPressed: () {
    StripePayment.completeNativePayRequest().then((_) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Completed successfully')));
    }).catchError(setError);
  },
),
```
