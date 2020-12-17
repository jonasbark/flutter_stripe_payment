package de.jonasbark.stripe_payment_example;

import android.os.Bundle;
import de.jonasbark.stripe_payment.StripePaymentPlugin;
import dev.flutter.plugins.integration_test.IntegrationTestPlugin;
import io.flutter.app.FlutterActivity;

public class EmbeddingV1Activity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    StripePaymentPlugin.registerWith(registrarFor("de.jonasbark.stripe_payment.StripePaymentPlugin"));
    IntegrationTestPlugin.registerWith(registrarFor("dev.flutter.plugins.e2e.E2EPlugin"));
  }
}