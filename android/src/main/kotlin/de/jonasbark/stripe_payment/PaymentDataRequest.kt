package de.jonasbark.stripe_payment

import com.google.android.gms.wallet.PaymentDataRequest
import com.stripe.android.GooglePayConfig
import org.json.JSONArray
import org.json.JSONObject

/**
 * Created by FFuF, Jonas Bark on 2019-10-01.
 */
internal fun createPaymentDataRequest(
    publishableKey: String,
    total: Double,
    name: String,
    currency: String
): PaymentDataRequest {

    val cardPaymentMethod = JSONObject()
        .put("type", "CARD")
        .put(
            "parameters",
            JSONObject()
                .put(
                    "allowedAuthMethods", JSONArray()
                        .put("PAN_ONLY")
                        .put("CRYPTOGRAM_3DS")
                )
                .put(
                    "allowedCardNetworks",
                    JSONArray()
                        .put("AMEX")
                        .put("DISCOVER")
                        .put("JCB")
                        .put("MASTERCARD")
                        .put("VISA")
                )

                // require billing address
                .put("billingAddressRequired", true)
                .put(
                    "billingAddressParameters",
                    JSONObject()
                        // require full billing address
                        .put("format", "FULL")

                        // require phone number
                        .put("phoneNumberRequired", true)
                )
        )
        .put(
            "tokenizationSpecification",
            GooglePayConfig(publishableKey).tokenizationSpecification
        )

    // create PaymentDataRequest
    val paymentDataRequest = JSONObject()
        .put("apiVersion", 2)
        .put("apiVersionMinor", 0)
        .put(
            "allowedPaymentMethods",
            JSONArray().put(cardPaymentMethod)
        )
        .put(
            "transactionInfo", JSONObject()
                .put("totalPrice", total.toString())
                .put("totalPriceStatus", "FINAL")
                .put("currencyCode", currency)
        )
        .put(
            "merchantInfo", JSONObject()
                .put("merchantName", name)
        )

        // don't require email address
        .put("emailRequired", false)
        .toString()

    return PaymentDataRequest.fromJson(paymentDataRequest)
}