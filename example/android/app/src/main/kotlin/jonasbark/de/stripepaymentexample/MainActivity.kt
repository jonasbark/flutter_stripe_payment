package jonasbark.de.stripepaymentexample

import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import de.jonasbark.stripepayment.StripeDialog

class MainActivity : AppCompatActivity() {
    private lateinit var stripeDialog: StripeDialog

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        GeneratedPluginRegistrant.registerWith(this)

        stripeDialog = StripeDialog.newInstance("Timmey", "pk_test_aSaULNS8cJU6Tvo20VAXy6rp", true)
        stripeDialog.show(supportFragmentManager, "")
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        stripeDialog.onActivityResult(requestCode, resultCode, data)
    }
}
