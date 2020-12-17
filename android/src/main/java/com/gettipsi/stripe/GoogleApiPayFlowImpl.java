package com.gettipsi.stripe;

import static com.gettipsi.stripe.Errors.toErrorCode;
import static com.gettipsi.stripe.util.Converters.convertPaymentMethodToWritableMap;
import static com.gettipsi.stripe.util.Converters.convertTokenToWritableMap;
import static com.gettipsi.stripe.util.Converters.getAllowedShippingCountryCodes;
import static com.gettipsi.stripe.util.Converters.getBillingAddress;
import static com.gettipsi.stripe.util.Converters.putExtraToTokenMap;
import static com.gettipsi.stripe.util.PayParams.BILLING_ADDRESS_REQUIRED;
import static com.gettipsi.stripe.util.PayParams.CURRENCY_CODE;
import static com.gettipsi.stripe.util.PayParams.EMAIL_REQUIRED;
import static com.gettipsi.stripe.util.PayParams.PHONE_NUMBER_REQUIRED;
import static com.gettipsi.stripe.util.PayParams.SHIPPING_ADDRESS_REQUIRED;
import static com.gettipsi.stripe.util.PayParams.TOTAL_PRICE;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;
import androidx.annotation.NonNull;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReadableMap;
import com.gettipsi.stripe.util.ArgCheck;
import com.gettipsi.stripe.util.Converters;
import com.gettipsi.stripe.util.Fun0;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.identity.intents.model.UserAddress;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.wallet.AutoResolveHelper;
import com.google.android.gms.wallet.CardInfo;
import com.google.android.gms.wallet.CardRequirements;
import com.google.android.gms.wallet.IsReadyToPayRequest;
import com.google.android.gms.wallet.PaymentData;
import com.google.android.gms.wallet.PaymentDataRequest;
import com.google.android.gms.wallet.PaymentMethodToken;
import com.google.android.gms.wallet.PaymentMethodTokenizationParameters;
import com.google.android.gms.wallet.PaymentsClient;
import com.google.android.gms.wallet.ShippingAddressRequirements;
import com.google.android.gms.wallet.TransactionInfo;
import com.google.android.gms.wallet.Wallet;
import com.google.android.gms.wallet.WalletConstants;
import com.stripe.android.ApiResultCallback;
import com.stripe.android.Stripe;
import com.stripe.android.model.Address;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.Token;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

/** Created by ngoriachev on 13/03/2018. see https://developers.google.com/pay/api/tutorial */
public final class GoogleApiPayFlowImpl extends PayFlow {

  private static final String TAG = GoogleApiPayFlowImpl.class.getSimpleName();
  private static final int LOAD_PAYMENT_DATA_REQUEST_CODE = 65534;

  private PaymentsClient mPaymentsClient;
  private final Fun0<Stripe> mStripe;
  private Promise payPromise;
  private boolean paymentRequestCreatesPaymentMethod = false;

  public GoogleApiPayFlowImpl(@NonNull Fun0<Activity> activityProvider, Fun0<Stripe> stripeProvider) {
    super(activityProvider);

    this.mStripe = stripeProvider;
  }

  private PaymentsClient createPaymentsClient(@NonNull Activity activity) {
    return Wallet.getPaymentsClient(
        activity, new Wallet.WalletOptions.Builder().setEnvironment(getEnvironment()).build());
  }

  private void isReadyToPay(
      @NonNull Activity activity,
      boolean isExistingPaymentMethodRequired,
      @NonNull final Promise promise) {
    ArgCheck.nonNull(activity);
    ArgCheck.nonNull(promise);

    IsReadyToPayRequest request =
        IsReadyToPayRequest.newBuilder()
            .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_CARD)
            .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_TOKENIZED_CARD)
            .setExistingPaymentMethodRequired(isExistingPaymentMethodRequired)
            .build();
    mPaymentsClient = createPaymentsClient(activity);
    Task<Boolean> task = mPaymentsClient.isReadyToPay(request);
    task.addOnCompleteListener(
        task1 -> {
          try {
            Boolean result = task1.getResult(ApiException.class);
            promise.resolve(result);
          } catch (ApiException exception) {
            promise.reject(toErrorCode(exception), exception.getMessage());
          }
        });
  }

  private PaymentMethodTokenizationParameters createPaymentMethodTokenizationParameters() {
    return PaymentMethodTokenizationParameters.newBuilder()
        .setPaymentMethodTokenizationType(
            WalletConstants.PAYMENT_METHOD_TOKENIZATION_TYPE_PAYMENT_GATEWAY)
        .addParameter("gateway", "stripe")
        .addParameter("stripe:publishableKey", getPublishableKey())
        .addParameter("stripe:version", Stripe.VERSION_NAME)
        .build();
  }

  private PaymentDataRequest createPaymentDataRequest(ReadableMap payParams) {
    final String estimatedTotalPrice = payParams.getString(TOTAL_PRICE);
    final String currencyCode = payParams.getString(CURRENCY_CODE);
    final boolean billingAddressRequired =
        Converters.getValue(payParams, BILLING_ADDRESS_REQUIRED, false);
    final boolean shippingAddressRequired =
        Converters.getValue(payParams, SHIPPING_ADDRESS_REQUIRED, false);
    final boolean phoneNumberRequired =
        Converters.getValue(payParams, PHONE_NUMBER_REQUIRED, false);
    final boolean emailRequired = Converters.getValue(payParams, EMAIL_REQUIRED, false);
    final Collection<String> allowedCountryCodes = getAllowedShippingCountryCodes(payParams);

    return createPaymentDataRequest(
        estimatedTotalPrice,
        currencyCode,
        billingAddressRequired,
        shippingAddressRequired,
        phoneNumberRequired,
        emailRequired,
        allowedCountryCodes);
  }

  private PaymentDataRequest createPaymentDataRequest(
      @NonNull final String totalPrice,
      @NonNull final String currencyCode,
      final boolean billingAddressRequired,
      final boolean shippingAddressRequired,
      final boolean phoneNumberRequired,
      final boolean emailRequired,
      @NonNull final Collection<String> countryCodes) {

    ArgCheck.isDouble(totalPrice);
    ArgCheck.notEmptyString(currencyCode);

    Log.d(TAG, "email required: " + emailRequired);

    PaymentDataRequest.Builder builder = PaymentDataRequest.newBuilder();
    builder.setTransactionInfo(
        TransactionInfo.newBuilder()
            .setTotalPriceStatus(WalletConstants.TOTAL_PRICE_STATUS_ESTIMATED)
            .setTotalPrice(totalPrice)
            .setCurrencyCode(currencyCode)
            .build());

    builder
        .setCardRequirements(
            CardRequirements.newBuilder()
                .addAllowedCardNetworks(
                    Arrays.asList(
                        WalletConstants.CARD_NETWORK_AMEX,
                        WalletConstants.CARD_NETWORK_DISCOVER,
                        WalletConstants.CARD_NETWORK_JCB,
                        WalletConstants.CARD_NETWORK_MASTERCARD,
                        WalletConstants.CARD_NETWORK_VISA,
                        WalletConstants.CARD_NETWORK_INTERAC,
                        WalletConstants.CARD_NETWORK_OTHER))
                .setBillingAddressRequired(billingAddressRequired)
                .build())
        .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_CARD)
        .addAllowedPaymentMethod(WalletConstants.PAYMENT_METHOD_TOKENIZED_CARD)
        .setEmailRequired(emailRequired)
        .setShippingAddressRequired(shippingAddressRequired)
        .setPhoneNumberRequired(phoneNumberRequired);

    if (countryCodes.size() > 0) {
      builder.setShippingAddressRequirements(
          ShippingAddressRequirements.newBuilder().addAllowedCountryCodes(countryCodes).build());
    }

    builder.setPaymentMethodTokenizationParameters(createPaymentMethodTokenizationParameters());
    return builder.build();
  }

  private void startPaymentRequest(
      @NonNull Activity activity, @NonNull PaymentDataRequest request) {
    ArgCheck.nonNull(activity);
    ArgCheck.nonNull(request);

    mPaymentsClient = createPaymentsClient(activity);

    AutoResolveHelper.resolveTask(
        mPaymentsClient.loadPaymentData(request), activity, LOAD_PAYMENT_DATA_REQUEST_CODE);
  }

  @Override
  public void paymentMethodFromAndroidPay(
      @NonNull ReadableMap payParams, @NonNull Promise promise) {
    ArgCheck.nonNull(payParams);
    ArgCheck.nonNull(promise);

    Activity activity = activityProvider.call();
    if (activity == null) {
      promise.reject(
          getErrorCode("activityUnavailable"), getErrorDescription("activityUnavailable"));
      return;
    }

    paymentRequestCreatesPaymentMethod = true;

    this.payPromise = promise;
    startPaymentRequest(activity, createPaymentDataRequest(payParams));
  }

  @Override
  public void paymentRequestWithAndroidPay(
      @NonNull ReadableMap payParams, @NonNull Promise promise) {
    ArgCheck.nonNull(payParams);
    ArgCheck.nonNull(promise);

    Activity activity = activityProvider.call();
    if (activity == null) {
      promise.reject(
          getErrorCode("activityUnavailable"), getErrorDescription("activityUnavailable"));
      return;
    }

    paymentRequestCreatesPaymentMethod = false;

    this.payPromise = promise;
    startPaymentRequest(activity, createPaymentDataRequest(payParams));
  }

  @Override
  public void deviceSupportsAndroidPay(
      boolean isExistingPaymentMethodRequired, @NonNull Promise promise) {
    Activity activity = activityProvider.call();
    if (activity == null) {
      promise.reject(
          getErrorCode("activityUnavailable"), getErrorDescription("activityUnavailable"));
      return;
    }

    if (!isPlayServicesAvailable(activity)) {
      promise.reject(
          getErrorCode("playServicesUnavailable"), getErrorDescription("playServicesUnavailable"));
      return;
    }

    isReadyToPay(activity, isExistingPaymentMethodRequired, promise);
  }

  public void potentiallyAvailableNativePayNetworks(@NonNull Promise promise) {
    List<String> networks = new ArrayList<>();
    networks.add("visa");
    networks.add("jcb");
    networks.add("master");
    promise.resolve(networks);
  }

  public boolean onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
    if (payPromise == null) {
      return false;
    }

    switch (requestCode) {
      case LOAD_PAYMENT_DATA_REQUEST_CODE:
        switch (resultCode) {
          case Activity.RESULT_OK:
            PaymentData paymentData = PaymentData.getFromIntent(data);
            ArgCheck.nonNull(paymentData);

            if (paymentRequestCreatesPaymentMethod) {
              try {
                final CardInfo info = paymentData.getCardInfo();
                // You can also pull the user address from the PaymentData object.
                final UserAddress address = paymentData.getShippingAddress();
                final PaymentMethodToken paymentMethodToken = paymentData.getPaymentMethodToken();
                // This is the raw string version of your Stripe token.
                final String rawToken =
                    paymentMethodToken != null ? paymentMethodToken.getToken() : null;

                final Token stripeToken = Token.fromJson(new JSONObject(rawToken));
                if (stripeToken != null) {
                  // Create a PaymentMethod object using the token id
                  final PaymentMethod.BillingDetails billingDetails;
                  if (address != null) {
                    billingDetails =
                        new PaymentMethod.BillingDetails.Builder()
                            .setAddress(
                                new Address.Builder()
                                    .setLine1(address.getAddress1())
                                    .setLine2(address.getAddress2())
                                    .setCity(address.getLocality())
                                    .setState(address.getAdministrativeArea())
                                    .setPostalCode(address.getPostalCode())
                                    .setCountry(address.getCountryCode())
                                    .build())
                            // TODO: Should fix this. And revert to the below implementation.
                            // .setEmail(address.getEmailAddress())
                            .setEmail(paymentData.getEmail())
                            .setName(address.getName())
                            .setPhone(address.getPhoneNumber())
                            .build();
                  } else {
                    billingDetails =
                        new PaymentMethod.BillingDetails.Builder()
                            .setEmail(paymentData.getEmail())
                            .build();
                  }
                  final PaymentMethodCreateParams params =
                      PaymentMethodCreateParams.create(
                          PaymentMethodCreateParams.Card.create(stripeToken.getId()),
                          billingDetails);

                  mStripe.call().createPaymentMethod(
                      params,
                      new ApiResultCallback<PaymentMethod>() {
                        @Override
                        public void onSuccess(PaymentMethod paymentMethod) {
                          Log.d(TAG, "paymentMethod: " + paymentMethod.toString());
                          payPromise.resolve(convertPaymentMethodToWritableMap(paymentMethod));
                          payPromise = null;
                        }

                        @Override
                        public void onError(@NotNull Exception e) {
                          payPromise.reject(
                              getErrorCode("parseResponse"), getErrorDescription("parseResponse"));
                          payPromise = null;
                        }
                      });
                  return true;
                } else {
                  payPromise.reject(
                      getErrorCode("parseResponse"), getErrorDescription("parseResponse"));
                }

              } catch (Exception e) {
                Log.e(TAG, "Error creating payment method", e);
                payPromise.reject(
                    getErrorCode("parseResponse"), getErrorDescription("parseResponse"));
              }
            } else {
              String tokenJson = paymentData.getPaymentMethodToken().getToken();
              Token token = null;
              try {
                token = Token.fromJson(new JSONObject(tokenJson));
              } catch (JSONException e) {
                payPromise.resolve(
                    putExtraToTokenMap(
                        convertTokenToWritableMap(token),
                        getBillingAddress(paymentData),
                        paymentData.getShippingAddress(),
                        paymentData.getEmail()));
                break;
              }
              Log.d(TAG, "token: " + tokenJson);
              if (token == null) {
                payPromise.reject(
                    getErrorCode("parseResponse"), getErrorDescription("parseResponse"));
              } else {
                payPromise.resolve(
                    putExtraToTokenMap(
                        convertTokenToWritableMap(token),
                        getBillingAddress(paymentData),
                        paymentData.getShippingAddress(),
                        paymentData.getEmail()));
              }
            }
            break;
          case Activity.RESULT_CANCELED:
            payPromise.reject(
                getErrorCode("purchaseCancelled"), getErrorDescription("purchaseCancelled"));
            break;
          case AutoResolveHelper.RESULT_ERROR:
            Status status = AutoResolveHelper.getStatusFromIntent(data);
            // Log the status for debugging.
            // Generally, there is no need to show an error to
            // the user as the Google Pay API will do that.
            payPromise.reject(getErrorCode("stripe"), status.getStatusMessage());
            break;

          default:
            // Do nothing.
        }
        payPromise = null;
        return true;
    }

    return false;
  }
}
