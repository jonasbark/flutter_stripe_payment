package de.jonasbark.stripepayment

import android.app.Activity
import android.support.v4.app.FragmentActivity
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class StripePaymentPlugin(private val activity: FragmentActivity) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar): Unit {
            val channel = MethodChannel(registrar.messenger(), "stripe_payment")
            channel.setMethodCallHandler(StripePaymentPlugin(registrar.activity() as FragmentActivity))
        }
    }

    var publishableKey: String? = null

    override fun onMethodCall(call: MethodCall, result: Result): Unit {
        if (call.method == "addSource") {
            if (publishableKey != null) {
                StripeDialog.newInstance("Add Source", publishableKey!!).apply {

                    show(this@StripePaymentPlugin.activity.supportFragmentManager, "stripe")

                    tokenListener = { token ->
                        result.success(token)
                    }
                }
            }
            else {
                result.success(false)
            }
        }
        else if (call.method == "setPublishableKey") {
            publishableKey = call.arguments as String
        }
        else {
            result.notImplemented()
        }
    }
}
