package de.jonasbark.stripepayment

import androidx.fragment.app.FragmentActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class StripePaymentPlugin(private val activity: FragmentActivity) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "stripe_payment")
            channel.setMethodCallHandler(StripePaymentPlugin(registrar.activity() as FragmentActivity))
        }
    }

    var publishableKey: String? = null

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "addSource" -> {
                publishableKey?.let { key ->
                    StripeDialog.newInstance("Add Source", key).apply {

                        show(this@StripePaymentPlugin.activity.supportFragmentManager, "stripe")

                        tokenListener = { token ->
                            result.success(token)
                        }
                    }
                }
                if (publishableKey == null) {
                    result.error("You have to set a publishable key first", null, null)
                }
            }
            "setPublishableKey" -> {
                publishableKey = call.arguments as String
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }
}
