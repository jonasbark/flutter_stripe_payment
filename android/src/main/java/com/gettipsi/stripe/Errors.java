package com.gettipsi.stripe;

import android.util.Log;
import androidx.annotation.NonNull;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReadableMap;
import com.gettipsi.stripe.util.ArgCheck;
import com.stripe.android.StripeError;
import com.stripe.android.exception.StripeException;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/** Created by ngoriachev on 30/07/2018. */
public final class Errors {
  private static final String TAG = "Errors";
  private static final Map<String, String> exceptionNameToErrorCode = new HashMap<>();

  public static final String CANCELLED = "cancelled";
  public static final String FAILED = "failed";
  public static final String AUTHENTICATION_FAILED = "authenticationFailed";
  public static final String UNEXPECTED = "unexpected";

  static {
    exceptionNameToErrorCode.put("APIConnectionException", "apiConnection");
    exceptionNameToErrorCode.put("StripeException", "stripe");
    exceptionNameToErrorCode.put("CardException", "card");
    exceptionNameToErrorCode.put("AuthenticationException", "authentication");
    exceptionNameToErrorCode.put("PermissionException", "permission");
    exceptionNameToErrorCode.put("InvalidRequestException", "invalidRequest");
    exceptionNameToErrorCode.put("RateLimitException", "rateLimit");
    exceptionNameToErrorCode.put("APIException", "api");
  }

  public static void raiseFlutterError(Exception e, Promise promise) {
    if (e instanceof StripeException) {
      final StripeException se = (StripeException) e;
      final Map<String, Object> details = new HashMap<>();

      String code = e.getClass().toString();
      if (se.getStripeError() != null) {
        details.put("stripeError", decode(se.getStripeError()));
        code = se.getStripeError().getCode();
      }

      if (se.getRequestId() != null) {
        details.put("requestId", se.getRequestId());
      }
      details.put("statusCode", se.getStatusCode());

      promise.reject(code, e.getMessage(), details);
    }
  }
  private static String toString(Object o, String nullDefault) {
    return (o != null) ? o.toString() : nullDefault;
  }

  private static Map<String, Object> decode(StripeError error) {
    final Map<String, Object> map = new HashMap<>();

    map.put("type", toString(error.getType(), ""));
    map.put("message", toString(error.getMessage(), ""));
    map.put("code", toString(error.getCode(), ""));
    map.put("param", toString(error.getParam(), ""));
    map.put("declineCode", toString(error.getDeclineCode(), ""));
    map.put("charge", toString(error.getCharge(), ""));
    map.put("docUrl", toString(error.getDocUrl(), ""));

    return map;
  }

  public static String toErrorCode(@NonNull Exception exception) {
    ArgCheck.nonNull(exception);
    String simpleName = exception.getClass().getSimpleName();
    Log.d(TAG, "Simple Error Name: " + simpleName);
    String errorCode = exceptionNameToErrorCode.get(simpleName);

    if (errorCode == null) {
      errorCode = simpleName;
    }
    //    ArgCheck.nonNull(errorCode, simpleName);

    return errorCode;
  }

  static String getErrorCode(@NonNull ReadableMap errorCodes, @NonNull String errorKey) {
    return errorCodes.getMap(errorKey).getString("errorCode");
  }

  static String getDescription(@NonNull ReadableMap errorCodes, @NonNull String errorKey) {
    return errorCodes.getMap(errorKey).getString("description");
  }
}
