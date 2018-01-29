package jonasbark.de.stripepaymentexample

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import de.jonasbark.stripepayment.StripeDialog

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity(): AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)

        StripeDialog.newInstance("Timmey").show(supportFragmentManager, "")
    }
}
