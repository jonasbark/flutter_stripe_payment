package de.jonasbark.stripepayment

import androidx.fragment.app.FragmentActivity
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class StripePaymentPlugin(private val activity: androidx.fragment.app.FragmentActivity) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar): Unit {
            val channel = MethodChannel(registrar.messenger(), "stripe_payment")
            channel.setMethodCallHandler(StripePaymentPlugin(registrar.activity() as androidx.fragment.app.FragmentActivity))
        }
    }

    var publishableKey: String? = null

    override fun onMethodCall(call: MethodCall, result: Result): Unit {
        when (call.method) {
            "addSource" -> {
                publishableKey?.let {key ->
                    StripeDialog.newInstance("Add Source", key).apply {

                        show(this@StripePaymentPlugin.activity.supportFragmentManager, "stripe")

                        tokenListener = { token ->
                            result.success(token)
                        }
                    }
                }
                if (publishableKey == null) {
                    Log.e("STRIPE", "You have to set a publishable key first")
                    result.success(false)
                }
            }
            "setPublishableKey" -> publishableKey = call.arguments as String
            else -> result.notImplemented()
        }
    }
}
