import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stripe_payment/stripe_payment.dart';

void main() {
  const MethodChannel channel = MethodChannel('stripe_payment');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
