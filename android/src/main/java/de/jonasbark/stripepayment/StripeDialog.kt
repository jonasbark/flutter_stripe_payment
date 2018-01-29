package de.jonasbark.stripepayment

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.support.design.widget.Snackbar
import android.support.v4.app.DialogFragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import com.stripe.android.SourceCallback
import com.stripe.android.Stripe
import com.stripe.android.TokenCallback
import com.stripe.android.model.Source
import com.stripe.android.model.SourceParams
import com.stripe.android.model.Token
import com.stripe.android.view.CardMultilineWidget
import java.lang.Exception
import android.app.DialogFragment.STYLE_NO_TITLE




class StripeDialog : DialogFragment() {

    companion object {
        fun newInstance(title: String, publishableKey: String): StripeDialog {
            val frag = StripeDialog()
            val args = Bundle()
            args.putString("title", title)
            args.putString("publishableKey", publishableKey)
            frag.arguments = args
            return frag
        }

    }

    override fun onCreateView(inflater: LayoutInflater?, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        return inflater!!.inflate(R.layout.activity_stripe, container)
    }

    override fun onViewCreated(view: View?, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // Get field from view
        // Fetch arguments from bundle and set title
        val title = arguments.getString("title", "Add Source")
        dialog.setTitle(title)
        // Show soft keyboard automatically and request focus to field
//        mEditText.requestFocus()
//        dialog.window!!.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_VISIBLE)

        view?.findViewById<View>(R.id.buttonSave)?.setOnClickListener {
            getToken()
        }

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        // TODO Auto-generated method stub
        super.onCreate(savedInstanceState)

        setStyle(DialogFragment.STYLE_NO_TITLE, R.style.Theme_AppCompat_Light_Dialog)
    }

    var tokenListener: ((String) -> (Unit))? = null

    private fun getToken() {
        val mCardInputWidget = view?.findViewById<View>(R.id.card_input_widget) as CardMultilineWidget

        if (mCardInputWidget.validateAllFields()) {

            view?.findViewById<View>(R.id.progress)?.visibility = View.VISIBLE
            view?.findViewById<View>(R.id.buttonSave)?.visibility = View.GONE

            val publishableKey = arguments.getString("publishableKey", null)

            val stripe = Stripe(activity, publishableKey)
            stripe.createSource(SourceParams.createCardParams(mCardInputWidget.card!!), object: SourceCallback {
                override fun onSuccess(source: Source?) {
                    view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                    view?.findViewById<View>(R.id.buttonSave)?.visibility = View.GONE

                    tokenListener?.invoke(source!!.id)
                    dismiss()
                }

                override fun onError(error: Exception?) {
                    view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                    view?.findViewById<View>(R.id.buttonSave)?.visibility = View.VISIBLE
                    Snackbar.make(view!!, error!!.localizedMessage, Snackbar.LENGTH_LONG).show()
                }

            })
            /*stripe.createToken(mCardInputWidget.card!!, object: TokenCallback{
                override fun onSuccess(token: Token?) {
                    view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                    view?.findViewById<View>(R.id.buttonSave)?.visibility = View.GONE

                    tokenListener?.invoke(token!!.id)
                    dismiss()
                }

                override fun onError(error: Exception?) {
                    view?.findViewById<View>(R.id.progress)?.visibility = View.GONE
                    view?.findViewById<View>(R.id.buttonSave)?.visibility = View.VISIBLE
                    Snackbar.make(view!!, error!!.localizedMessage, Snackbar.LENGTH_LONG).show()
                }
            })*/
        }
        else {
            Snackbar.make(view!!, "The card info you entered is not correct", Snackbar.LENGTH_LONG).show()
        }

    }
}
