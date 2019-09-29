package de.jonasbark.stripepayment

import android.content.Intent
import androidx.fragment.app.FragmentActivity
import com.stripe.android.*
import com.stripe.android.model.ConfirmPaymentIntentParams
import com.stripe.android.model.ConfirmSetupIntentParams
import com.stripe.android.model.StripeIntent
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar

class StripePaymentPlugin(private val activity: FragmentActivity) : MethodCallHandler,
    PluginRegistry.ActivityResultListener {

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "stripe_payment")
            val plugin = StripePaymentPlugin(registrar.activity() as FragmentActivity)
            channel.setMethodCallHandler(plugin)
            registrar.addActivityResultListener(plugin)
        }
    }

    private val stripe: Stripe by lazy {
        Stripe(activity, PaymentConfiguration.getInstance(activity).publishableKey)
    }

    var settingsSet = false
    var currentResult: Result? = null


    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "setSettings" -> {
                PaymentConfiguration.init(activity, call.argument<String>("publishableKey")!!)
                settingsSet = true
                result.success(null)
            }
            "addSource" -> {
                if (!settingsSet) {
                    result.error("You have to set a publishable key first", null, null)
                } else {
                    StripeDialog.newInstance(call.argument<String>("title") ?: "Add Source").apply {

                        show(this@StripePaymentPlugin.activity.supportFragmentManager, "stripe")

                        tokenListener = { token ->
                            result.success(token)
                        }
                    }
                }
            }
            "setupPayment" -> {
                currentResult = result
                confirmSetupIntent(
                    call.argument("paymentMethodId")!!,
                    call.argument("clientSecret")!!
                )
            }
            "confirmPayment" -> {
                currentResult = result
                confirmPayment(call.argument("paymentMethodId")!!, call.argument("clientSecret")!!)
            }
            else -> result.notImplemented()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val paymentHandled = stripe.onPaymentResult(requestCode, data,
            object : ApiResultCallback<PaymentIntentResult> {
                override fun onSuccess(result: PaymentIntentResult) {
                    // If authentication succeeded, the PaymentIntent will have
                    // user actions resolved; otherwise, handle the PaymentIntent
                    // status as appropriate (e.g. the customer may need to choose
                    // a new payment method)

                    val paymentIntent = result.intent
                    when (val status = paymentIntent.status) {
                        StripeIntent.Status.Succeeded -> {
                            currentResult?.success(paymentIntent.id)
                        }
                        else -> {
                            currentResult?.error(status?.name, status?.code, null)
                        }
                    }
                }

                override fun onError(e: Exception) {
                    // handle error
                    currentResult?.error(e.localizedMessage, null, null)
                }
            })

        if (paymentHandled) {
            return true
        }

        return stripe.onSetupResult(requestCode, data,
            object : ApiResultCallback<SetupIntentResult> {
                override fun onSuccess(result: SetupIntentResult) {
                    // If confirmation and authentication succeeded,
                    // the SetupIntent will have user actions resolved;
                    // otherwise, handle the failure as appropriate
                    // (e.g. the customer may need to choose a new payment
                    // method)
                    val setupIntent = result.intent
                    when (val status = setupIntent.status) {
                        StripeIntent.Status.Succeeded -> {
                            currentResult?.success(setupIntent.id)
                        }
                        else -> {
                            currentResult?.error(status?.name, status?.code, null)
                        }
                    }
                }

                override fun onError(e: Exception) {
                    // handle error
                    currentResult?.error(e.localizedMessage, null, null)
                }
            })
    }


    private fun confirmPayment(paymentMethodId: String, clientSecret: String) {
        val params = ConfirmPaymentIntentParams.createWithPaymentMethodId(
            paymentMethodId,
            clientSecret
        )
        stripe.confirmPayment(activity, params)
    }

    private fun confirmSetupIntent(paymentMethodId: String, clientSecret: String) {
        val params = ConfirmSetupIntentParams.create(paymentMethodId, clientSecret)
        stripe.confirmSetupIntent(activity, params)
    }
}
