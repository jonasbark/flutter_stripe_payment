package de.jonasbark.stripe_payment

import android.app.Activity
import android.content.Context
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReadableMap
import com.gettipsi.stripe.StripeModule
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MethodCallHandlerImpl(
        applicationContext: Context,
        activity: Activity?,
        activityRegistry: ActivityRegistry
) : MethodChannel.MethodCallHandler {
    private val stripeModule = StripeModule(applicationContext, activity, activityRegistry)

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setOptions" -> {
                stripeModule.init(
                        ReadableMap(call.argument("options")),
                        ReadableMap(call.argument("errorCodes"))
                )
                result.success(null)
            }
            "setStripeAccount" -> {
                stripeModule.setStripeAccount(call.argument("stripeAccount"))
                result.success(null)
            }
            "deviceSupportsAndroidPay" -> stripeModule.deviceSupportsAndroidPay(Promise(result))
            "canMakeAndroidPayPayments" -> stripeModule.canMakeAndroidPayPayments(Promise(result))
            "canMakeApplePayPayments" -> result.success(false)
            "potentiallyAvailableNativePayNetworks" -> stripeModule.potentiallyAvailableNativePayNetworks(Promise(result))
            "paymentMethodFromAndroidPay" -> stripeModule.paymentMethodFromAndroidPay(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "paymentRequestWithAndroidPay" -> stripeModule.paymentRequestWithAndroidPay(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "paymentRequestWithCardForm" -> stripeModule.paymentRequestWithCardForm(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "createTokenWithCard" -> stripeModule.createTokenWithCard(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "createTokenWithBankAccount" -> stripeModule.createTokenWithBankAccount(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "createSourceWithParams" -> stripeModule.createSourceWithParams(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "createPaymentMethod" -> stripeModule.createPaymentMethod(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "authenticatePaymentIntent" -> stripeModule.authenticatePaymentIntent(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "confirmPaymentIntent" -> stripeModule.confirmPaymentIntent(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "authenticateSetupIntent" -> stripeModule.authenticateSetupIntent(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
            "confirmSetupIntent" -> stripeModule.confirmSetupIntent(
                    ReadableMap(call.arguments()),
                    Promise(result)
            )
        }
    }
}