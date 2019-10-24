package de.jonasbark.stripepayment

import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReadableMap
import com.gettipsi.stripe.StripeModule
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class StripePaymentPlugin(private val stripeModule: StripeModule) : MethodCallHandler {

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "setOptions" -> stripeModule.init(
                ReadableMap(call.argument("options")),
                ReadableMap(call.argument("errorCodes")),
                Promise(result)
            )
            "deviceSupportsAndroidPay" -> stripeModule.deviceSupportsAndroidPay(Promise(result));
            "canMakeAndroidPayPayments" -> stripeModule.canMakeAndroidPayPayments(Promise(result));
            "paymentRequestWithAndroidPay" -> stripeModule.paymentRequestWithAndroidPay(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "paymentRequestWithCardForm" -> stripeModule.paymentRequestWithCardForm(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "createTokenWithCard" -> stripeModule.createTokenWithCard(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "createTokenWithBankAccount" -> stripeModule.createTokenWithBankAccount(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "createSourceWithParams" -> stripeModule.createSourceWithParams(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "createPaymentMethod" -> stripeModule.createPaymentMethod(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "authenticatePaymentIntent" -> stripeModule.authenticatePaymentIntent(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "confirmPaymentIntent" -> stripeModule.confirmPaymentIntent(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "authenticateSetupIntent" -> stripeModule.authenticateSetupIntent(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
            "confirmSetupIntent" -> stripeModule.confirmSetupIntent(
                ReadableMap(call.arguments as Map<String, Any>),
                Promise(result)
            )
        }
    }

    companion object {

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "stripe_payment")
            val stripeModule = StripeModule(registrar, registrar.activity())
            val plugin = StripePaymentPlugin(stripeModule)
            channel.setMethodCallHandler(plugin)
        }
    }
}
