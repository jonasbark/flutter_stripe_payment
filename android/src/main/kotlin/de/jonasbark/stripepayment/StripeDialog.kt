package de.jonasbark.stripepayment

import android.app.DialogFragment
import android.content.DialogInterface
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.stripe.android.ApiResultCallback
import com.stripe.android.Stripe
import com.stripe.android.model.PaymentMethod
import com.stripe.android.model.PaymentMethodCreateParams
import com.stripe.android.view.CardMultilineWidget


class StripeDialog : DialogFragment() {

    companion object {
        @JvmStatic
        fun newInstance(title: String, stripeAccountId: String?): StripeDialog {
            val frag = StripeDialog()
            val args = Bundle()
            args.putString("stripeAccountId", stripeAccountId)
            args.putString("title", title)
            frag.arguments = args
            return frag
        }

    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.activity_stripe, container)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // Get field from view
        // Fetch arguments from bundle and set title
        val title = arguments?.getString("title", "Add Source")
        dialog?.setTitle(title)
        view.findViewById<View>(R.id.buttonSave)?.setOnClickListener {
            getToken()
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState)

        setStyle(STYLE_NO_TITLE, R.style.Theme_AppCompat_Light_Dialog)
    }

    override fun onCancel(dialog: DialogInterface?) {
        super.onCancel(dialog)
        onCancelListener.onCancel(dialog)
    }

    lateinit var onCancelListener: DialogInterface.OnCancelListener
    lateinit var stripeInstance: Stripe
    var tokenListener: ((PaymentMethod) -> (Unit))? = null

    private fun getToken() {
        val mCardInputWidget =
            view?.findViewById<View>(R.id.card_input_widget) as CardMultilineWidget

        if (mCardInputWidget.validateAllFields()) {

            mCardInputWidget.card?.let { card ->

                view?.findViewById<View>(R.id.progress)?.visibility = View.VISIBLE
                view?.findViewById<View>(R.id.buttonSave)?.visibility = View.GONE

                val paymentMethodParamsCard = card.toPaymentMethodParamsCard()
                val paymentMethodCreateParams = PaymentMethodCreateParams.create(
                    paymentMethodParamsCard,
                    PaymentMethod.BillingDetails.Builder().build()
                )

                stripeInstance.createPaymentMethod(
                    paymentMethodCreateParams,
                    null,
                    arguments?.getString("stripeAccountId", null),
                    object : ApiResultCallback<PaymentMethod> {
                        override fun onSuccess(result: PaymentMethod) {
                            view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                            view?.findViewById<View>(R.id.buttonSave)?.visibility = View.GONE

                            tokenListener?.invoke(result)
                            dismiss()
                        }

                        override fun onError(error: Exception) {
                            view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                            view?.findViewById<View>(R.id.buttonSave)?.visibility = View.VISIBLE
                            view?.let {
                                Toast.makeText(it.context, error.localizedMessage, Toast.LENGTH_LONG)
                                    .show()
                            }
                        }

                    })

            }
        } else {
            view?.let {
                Toast.makeText(it.context, "The card info you entered is not correct", Toast.LENGTH_LONG)
                    .show()
            }
        }

    }
}
