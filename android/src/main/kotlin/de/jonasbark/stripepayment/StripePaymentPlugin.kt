package de.jonasbark.stripepayment

import android.support.v4.app.FragmentActivity
import android.util.Log
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.wallet.IsReadyToPayRequest
import com.google.android.gms.wallet.PaymentsClient
import com.google.android.gms.wallet.Wallet
import com.google.android.gms.wallet.WalletConstants
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar


class StripePaymentPlugin(private val activity: FragmentActivity, registrar: Registrar) : MethodCallHandler {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "stripe_payment")
            channel.setMethodCallHandler(StripePaymentPlugin(registrar.activity() as FragmentActivity, registrar))
        }
    }

    init {
        registrar.addActivityResultListener { requestCode, resultCode, intent ->
            stripeDialog?.onActivityResult(requestCode, resultCode, intent)
            true
        }
    }

    var publishableKey: String? = null
    private var googlePayAvailable: Boolean = false
    private var stripeDialog: StripeDialog? = null

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "addSource" -> {
                publishableKey?.let {key ->
                    stripeDialog = StripeDialog.newInstance("Add Source", key, googlePayAvailable).apply {

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
            "setPublishableKey" -> {
                publishableKey = call.arguments as String
                val paymentsClient = Wallet.getPaymentsClient(activity,
                        Wallet.WalletOptions.Builder().setEnvironment(if (publishableKey?.contains("test") == true) WalletConstants.ENVIRONMENT_TEST else WalletConstants.ENVIRONMENT_PRODUCTION)
                                .build())
                isReadyToPay(paymentsClient)
                result.success(true)

            }
            else -> result.notImplemented()
        }
    }


    private fun isReadyToPay(paymentsClient: PaymentsClient) {
        val request = IsReadyToPayRequest.newBuilder()
                .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_CARD)
                .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_TOKENIZED_CARD)
                .build()
        val task = paymentsClient.isReadyToPay(request)
        task.addOnCompleteListener { t ->
            try {
                googlePayAvailable = t.getResult(ApiException::class.java)
            } catch (exception: ApiException) {

            }
        }
    }
}
