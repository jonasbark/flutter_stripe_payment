package de.jonasbark.stripe_payment

import android.app.Activity
import android.content.Context
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReadableMap
import com.gettipsi.stripe.StripeModule
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MethodCallHandlerImpl(
        applicationContext: Context,
        activity: Activity?,
        messenger: BinaryMessenger?,
        activityRegistry: ActivityRegistry
) : MethodChannel.MethodCallHandler {
    private var methodChannel: MethodChannel = MethodChannel(messenger, "stripe_payment")

    private val stripeModule = StripeModule(applicationContext, activity, activityRegistry)

    init {
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setOptions" -> stripeModule.init(
                    ReadableMap(call.argument("options")),
                    ReadableMap(call.argument("errorCodes"))
            )
            "setStripeAccount" -> stripeModule.setStripeAccount(
                    call.argument("stripeAccount")
            )
            "deviceSupportsAndroidPay" -> stripeModule.deviceSupportsAndroidPay(Promise(result));
            "canMakeAndroidPayPayments" -> stripeModule.canMakeAndroidPayPayments(Promise(result));
            "canMakeApplePayPayments" -> result.success(false)
            "potentiallyAvailableNativePayNetworks" -> stripeModule.potentiallyAvailableNativePayNetworks(Promise(result))
            "paymentMethodFromAndroidPay" -> stripeModule.paymentMethodFromAndroidPay(
                    ReadableMap(call.arguments as Map<String, Any>),
                    Promise(result)
            )
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

    fun stopListening() {
        methodChannel.setMethodCallHandler(null)
    }
}