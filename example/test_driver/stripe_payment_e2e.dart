import 'package:flutter_test/flutter_test.dart';
import 'package:e2e/e2e.dart';
import 'package:stripe_payment/stripe_payment.dart';

void main() {
  E2EWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Creates a test token', (WidgetTester tester) async {
    await StripePayment.setOptions(StripeOptions(publishableKey: 'sk_test'));
  });
}
