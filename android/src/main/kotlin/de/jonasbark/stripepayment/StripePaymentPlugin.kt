package de.jonasbark.stripepayment

import android.app.Activity
import android.content.Intent
import androidx.fragment.app.FragmentActivity
import com.google.android.gms.common.api.ApiException
import com.google.android.gms.wallet.*
import com.stripe.android.*
import com.stripe.android.model.*
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar
import org.json.JSONObject

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

        private const val LOAD_PAYMENT_DATA_REQUEST_CODE: Int = 13873
    }


    private val stripe: Stripe by lazy {
        Stripe(activity, PaymentConfiguration.getInstance(activity).publishableKey)
    }

    private val paymentsClient: PaymentsClient by lazy {
        Wallet.getPaymentsClient(
            activity,
            Wallet.WalletOptions.Builder()
                .setEnvironment(walletEnvironment)
                .build()
        )
    }
    var merchantIdentifier: String? = null
    var walletEnvironment: Int = WalletConstants.ENVIRONMENT_TEST

    var settingsSet = false
    var currentResult: Result? = null


    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "setSettings" -> {
                PaymentConfiguration.init(activity, call.argument<String>("publishableKey")!!)
                merchantIdentifier = call.argument("merchantIdentifier")
                walletEnvironment =
                    if (call.argument<Boolean>("androidProductionEnvironment") == true) WalletConstants.ENVIRONMENT_PRODUCTION else WalletConstants.ENVIRONMENT_TEST

                settingsSet = true
                result.success(null)
            }
            "addSource" -> {
                if (!settingsSet) {
                    result.error("You have to set a publishable key first", null, null)
                    return
                }
                StripeDialog.newInstance(call.argument<String>("title") ?: "Add Source").apply {

                    show(this@StripePaymentPlugin.activity.supportFragmentManager, "stripe")

                    tokenListener = { token ->
                        result.success(token)
                    }
                }
            }
            "setupPayment" -> {
                if (!settingsSet) {
                    result.error("You have to set a publishable key first", null, null)
                    return
                }
                currentResult = result
                confirmSetupIntent(
                    call.argument("paymentMethodId")!!,
                    call.argument("clientSecret")!!
                )
            }
            "confirmPayment" -> {
                if (!settingsSet) {
                    result.error("You have to set a publishable key first", null, null)
                    return
                }
                currentResult = result
                confirmPayment(call.argument("paymentMethodId")!!, call.argument("clientSecret")!!)
            }
            "receiptNativePay" -> {
                if (!settingsSet) {
                    result.error("You have to set a publishable key first", null, null)
                    return
                }
                currentResult = result
                val receiptArgs: Map<String, Any> = call.arguments()
                val currency: String = call.argument("currency")!!

                var total = 0.0
                receiptArgs.forEach { entry ->
                    if (entry.value is Double) {
                        total += (entry.value as Double)
                    }
                }

                googlePay(total, currency)

            }
            "completeNativePay" -> {
                result.success(null)
            }
            "nativePay" -> {
                if (!settingsSet) {
                    result.error("You have to set a publishable key first", null, null)
                    return
                }
                currentResult = result
                val paymentArgs = call.arguments as Map<*, *>
                val subtotal = paymentArgs["subtotal"] as? Double
                val tip = paymentArgs["tip"] as? Double
                val tax = paymentArgs["tax"] as? Double
                val currency = paymentArgs["currency"] as? String

                if (subtotal == null || tip == null || tax == null || merchantIdentifier == null || currency == null) {
                    result.error("Incorrect payment parameters", "4", null)
                    return
                }

                val total = subtotal + tax + tip

                googlePay(total, currency)

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

        val setupHandled = stripe.onSetupResult(requestCode, data,
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
        if (setupHandled) {
            return true
        }
        if (requestCode == LOAD_PAYMENT_DATA_REQUEST_CODE && data != null) {
            when (resultCode) {
                Activity.RESULT_OK ->
                    PaymentData.getFromIntent(data)?.let {
                        val paymentMethodCreateParams =
                            PaymentMethodCreateParams.createFromGooglePay(JSONObject(it.toJson()))
                        stripe.createPaymentMethod(
                            paymentMethodCreateParams,
                            object : ApiResultCallback<PaymentMethod> {
                                override fun onSuccess(result: PaymentMethod) {
                                    currentResult?.success(result.id)
                                }

                                override fun onError(e: Exception) {
                                    currentResult?.error(e.message, null, null)
                                }
                            }
                        )
                    }

                Activity.RESULT_CANCELED -> {
                    currentResult?.error(
                        "canceled",
                        requestCode.toString(),
                        data
                    )
                }

                AutoResolveHelper.RESULT_ERROR -> {
                    AutoResolveHelper.getStatusFromIntent(data)?.let {
                        currentResult?.error("Error", it.statusMessage, null)
                    }
                }
            }
            return true
        }
        return false;
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


    private fun googlePay(total: Double, currency: String) {
        val request = IsReadyToPayRequest.newBuilder()
            .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_CARD)
            .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_TOKENIZED_CARD)
            .build()
        paymentsClient.isReadyToPay(request).addOnCompleteListener { task ->
            try {
                val result = task.getResult(ApiException::class.java)!!
                if (result) {
                    val paymentRequest = createPaymentDataRequest(
                        PaymentConfiguration.getInstance(activity).publishableKey,
                        total,
                        merchantIdentifier!!,
                        currency
                    )

                    val paymentTask = paymentsClient.loadPaymentData(paymentRequest)
                    if (paymentTask == null) {
                        currentResult?.error("Unable to create Google_pay payment data", null, null)
                    } else {
                        AutoResolveHelper.resolveTask(
                            paymentTask,
                            this.activity,
                            LOAD_PAYMENT_DATA_REQUEST_CODE
                        )
                    }
                } else {
                    print("Google Pay is not ready, try calling setMerchantIdentifier first.")
                }
            } catch (exception: ApiException) {
                currentResult?.error(
                    "exception inside ready w/ Google pay: " + exception.statusCode,
                    null,
                    null
                )
            }
        }
    }
}
