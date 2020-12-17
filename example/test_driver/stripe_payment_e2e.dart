import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stripe_payment/stripe_payment.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Creates a test token', (WidgetTester tester) async {
    await StripePayment.setOptions(StripeOptions(publishableKey: 'sk_test'));
  });
}
