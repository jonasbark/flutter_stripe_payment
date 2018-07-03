package de.jonasbark.stripepayment

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.support.design.widget.Snackbar
import android.support.v4.app.DialogFragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.google.android.gms.wallet.AutoResolveHelper
import com.google.android.gms.wallet.PaymentMethodTokenizationParameters
import com.google.android.gms.wallet.WalletConstants
import com.stripe.android.SourceCallback
import com.stripe.android.Stripe
import com.stripe.android.model.Source
import com.stripe.android.model.SourceParams
import com.stripe.android.view.CardMultilineWidget
import java.lang.Exception
import java.util.Arrays.asList
import com.google.android.gms.wallet.CardRequirements
import com.google.android.gms.wallet.PaymentData
import com.google.android.gms.wallet.TransactionInfo
import com.google.android.gms.wallet.PaymentDataRequest
import java.util.Arrays
import com.google.android.gms.wallet.Wallet
import com.google.android.gms.wallet.PaymentsClient
import com.stripe.android.model.Token


class StripeDialog : DialogFragment() {

    companion object {

        private const val LOAD_PAYMENT_DATA_REQUEST_CODE = 23

        fun newInstance(title: String, publishableKey: String, isGooglePayAvailable: Boolean): StripeDialog {
            val frag = StripeDialog()
            val args = Bundle()
            args.putString("title", title)
            args.putString("publishableKey", publishableKey)
            args.putBoolean("isGooglePayAvailable", isGooglePayAvailable)
            frag.arguments = args
            return frag
        }

    }

    private var paymentsClient: PaymentsClient? = null
    var tokenListener: ((String) -> (Unit))? = null


    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.activity_stripe, container)
    }


    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // Get field from view
        // Fetch arguments from bundle and set title
        val title = arguments?.getString("title", "Add Source")
        dialog.setTitle(title)

        val isGooglePayAvailable = arguments?.getBoolean("isGooglePayAvailable", false) ?: false

        view.findViewById<View>(R.id.buttonGooglePay)?.apply {
            visibility = if (isGooglePayAvailable) View.VISIBLE else View.GONE
            if (isGooglePayAvailable) {
                setOnClickListener {
                    getGooglePayToken()
                }
                val publishableKey = arguments?.getString("publishableKey", null) ?: ""
                paymentsClient = Wallet.getPaymentsClient(activity!!,
                        Wallet.WalletOptions.Builder().setEnvironment(if (publishableKey.contains("test") == true) WalletConstants.ENVIRONMENT_TEST else WalletConstants.ENVIRONMENT_PRODUCTION)
                                .build())
            }
        }

        view.findViewById<View>(R.id.buttonSave)?.setOnClickListener {
            getToken()
        }

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState)

        setStyle(DialogFragment.STYLE_NO_TITLE, R.style.Theme_AppCompat_Light_Dialog)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        when (requestCode) {
            LOAD_PAYMENT_DATA_REQUEST_CODE -> when (resultCode) {
                Activity.RESULT_OK -> {
                    if (data != null) {
                        val paymentData = PaymentData.getFromIntent(data)
                        if (paymentData != null) {
                            // You can get some data on the user's card, such as the brand and last 4 digits
                            val info = paymentData.cardInfo
                            // You can also pull the user address from the PaymentData object.
                            val address = paymentData.shippingAddress
                            // This is the raw JSON string version of your Stripe token.
                            val rawToken = paymentData.paymentMethodToken?.token

                            // Now that you have a Stripe token object, charge that by using the id
                            val stripeToken = Token.fromString(rawToken)
                            if (stripeToken != null) {
                                // This chargeToken function is a call to your own server, which should then connect
                                // to Stripe's API to finish the charge.
                                tokenListener?.invoke(stripeToken.id)
                            }
                        }
                    }
                }
                Activity.RESULT_CANCELED -> {

                }
                AutoResolveHelper.RESULT_ERROR -> {
                    val status = AutoResolveHelper.getStatusFromIntent(data)
                }
            }
        }
    }

    private fun getToken() {
        val mCardInputWidget = view?.findViewById<View>(R.id.card_input_widget) as CardMultilineWidget

        if (mCardInputWidget.validateAllFields()) {

            mCardInputWidget.card?.let { card ->

                view?.findViewById<View>(R.id.progress)?.visibility = View.VISIBLE
                view?.findViewById<View>(R.id.buttonSave)?.visibility = View.GONE

                val publishableKey = arguments?.getString("publishableKey", null) ?: ""

                val stripe = Stripe(activity!!, publishableKey)
                stripe.createSource(SourceParams.createCardParams(card), object : SourceCallback {
                    override fun onSuccess(source: Source?) {
                        view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                        view?.findViewById<View>(R.id.buttonSave)?.visibility = View.GONE

                        if (source != null) {
                            tokenListener?.invoke(source.id)
                            dismiss()
                        }
                    }

                    override fun onError(error: Exception?) {
                        view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                        view?.findViewById<View>(R.id.buttonSave)?.visibility = View.VISIBLE
                        view?.let {
                            Snackbar.make(it, error!!.localizedMessage, Snackbar.LENGTH_LONG).show()
                        }
                    }

                })
            }
        }
        else {
            view?.let {
                Snackbar.make(it, "The card info you entered is not correct", Snackbar.LENGTH_LONG).show()
            }
        }
    }


    private fun getGooglePayToken() {
        val tokenizedParameters = PaymentMethodTokenizationParameters.newBuilder()
                .setPaymentMethodTokenizationType(WalletConstants.PAYMENT_METHOD_TOKENIZATION_TYPE_PAYMENT_GATEWAY)
                .addParameter("gateway", "stripe")
                .addParameter("stripe:publishableKey", "pk_test_aSaULNS8cJU6Tvo20VAXy6rp")
                .addParameter("stripe:version", "5.1.0")
                .build()

        val request = PaymentDataRequest.newBuilder()
                .setTransactionInfo(
                        TransactionInfo.newBuilder()
                                .setTotalPriceStatus(WalletConstants.TOTAL_PRICE_STATUS_FINAL)
                                .setTotalPrice("10.00")
                                .setCurrencyCode("USD")
                                .build())
                .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_CARD)
                .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_TOKENIZED_CARD)
                .setCardRequirements(
                        CardRequirements.newBuilder()
                                .addAllowedCardNetworks(Arrays.asList(
                                        WalletConstants.CARD_NETWORK_AMEX,
                                        WalletConstants.CARD_NETWORK_DISCOVER,
                                        WalletConstants.CARD_NETWORK_VISA,
                                        WalletConstants.CARD_NETWORK_MASTERCARD))
                                .build())

        request.setPaymentMethodTokenizationParameters(tokenizedParameters)
        val builtRequest = request.build()
        if (request != null && paymentsClient != null) {
            AutoResolveHelper.resolveTask(
                    paymentsClient!!.loadPaymentData(builtRequest),
                    activity!!,
                    LOAD_PAYMENT_DATA_REQUEST_CODE)
        }
    }
}
