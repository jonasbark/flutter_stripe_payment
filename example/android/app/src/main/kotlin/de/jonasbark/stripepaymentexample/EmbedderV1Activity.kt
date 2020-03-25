package de.jonasbark.stripepaymentexample

import android.os.Bundle
import de.jonasbark.stripepayment.StripePaymentPlugin
import io.flutter.app.FlutterActivity

class EmbedderV1Activity : FlutterActivity() {
    @Override
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        StripePaymentPlugin.registerWith(registrarFor("de.jonasbark.stripepayment.StripePaymentPlugin"));
    }
}

