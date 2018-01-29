package jonasbark.de.stripepaymentexample

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import de.jonasbark.stripepayment.StripeDialog

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)

        StripeDialog.newInstance("Timmey", "pk_test_key").show(supportFragmentManager, "")
    }
}
