import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class Errors {
  static Map<String, Map<String, String>> mapping = {
    "busy": ErrorCode(
      errorCode: 'busy',
      description: 'Previous request is not completed',
    ).toJson(),
    "cancelled": ErrorCode(
      errorCode: 'cancelled',
      description: 'Cancelled by user',
    ).toJson(),
    "purchaseCancelled": ErrorCode(
      errorCode: 'purchaseCancelled',
      description: 'Purchase was cancelled',
    ).toJson(),
    "sourceStatusCanceled": ErrorCode(
      errorCode: 'sourceStatusCanceled',
      description: 'Cancelled by user',
    ).toJson(),
    "sourceStatusPending": ErrorCode(
      errorCode: 'sourceStatusPending',
      description: 'The source has been created and is awaiting customer action',
    ).toJson(),
    "sourceStatusFailed": ErrorCode(
      errorCode: 'sourceStatusFailed',
      description: "The source status is unknown. You shouldn't encounter this value.",
    ).toJson(),
    "sourceStatusUnknown": ErrorCode(
      errorCode: 'sourceStatusUnknown',
      description: 'Source polling unknown error',
    ).toJson(),
    "deviceNotSupportsNativePay": ErrorCode(
            errorCode: 'deviceNotSupportsNativePay',
            description: kIsWeb ? "Native Pay isn't supported in a web browser" :
                Platform.isIOS ? 'This device does not support Apple Pay' : 'This device does not support Google Pay')
        .toJson(),
    "noPaymentRequest": ErrorCode(
      errorCode: 'noPaymentRequest',
      description: 'Missing payment request',
    ).toJson(),
    "noMerchantIdentifier": ErrorCode(
      errorCode: 'noMerchantIdentifier',
      description: 'Missing merchant identifier',
    ).toJson(),
    "noAmount": ErrorCode(
      errorCode: 'noAmount',
      description: 'Amount should be greater than 0',
    ).toJson(),
    "parseResponse": ErrorCode(
      errorCode: 'parseResponse',
      description: 'Failed to parse JSON',
    ).toJson(),
    "activityUnavailable": ErrorCode(
      errorCode: 'activityUnavailable',
      description: 'Cannot continue with no current activity',
    ).toJson(),
    "playServicesUnavailable": ErrorCode(
      errorCode: 'playServicesUnavailable',
      description: 'Play services are not available',
    ).toJson(),
    "redirectCancelled": ErrorCode(
      errorCode: 'redirectCancelled',
      description: 'Redirect cancelled',
    ).toJson(),
    "redirectNoSource": ErrorCode(
      errorCode: 'redirectNoSource',
      description: 'Received redirect uri but there is no source to process',
    ).toJson(),
    "redirectWrongSourceId": ErrorCode(
      errorCode: 'redirectWrongSourceId',
      description: 'Received wrong source id in redirect uri',
    ).toJson(),
    "redirectCancelledByUser": ErrorCode(
      errorCode: 'redirectCancelledByUser',
      description: 'User cancelled source redirect',
    ).toJson(),
    "redirectFailed": ErrorCode(
      errorCode: 'redirectFailed',
      description: 'Source redirect failed',
    ).toJson(),

    // Description provided by stripe api
    "api": ErrorCode(
      errorCode: 'api',
    ).toJson(),
    "apiConnection": ErrorCode(
      errorCode: 'apiConnection',
    ).toJson(),
    "redirectSpecific": ErrorCode(
      errorCode: 'redirectSpecific',
    ).toJson(),
    "card": ErrorCode(
      errorCode: 'card',
    ).toJson(),
    "invalidRequest": ErrorCode(
      errorCode: 'invalidRequest',
    ).toJson(),
    "stripe": ErrorCode(
      errorCode: 'stripe',
    ).toJson(),
    "rateLimit": ErrorCode(
      errorCode: 'rateLimit',
    ).toJson(),
    "authentication": ErrorCode(
      errorCode: 'authentication',
    ).toJson(),
    /**
     * Failures to authenticate will get this error
     * @see: (confirm/authenticate)(Setup/Payment)Intent
     */
    "authenticationFailed": ErrorCode(
      errorCode: 'authenticationFailed',
    ).toJson(),
    "permission": ErrorCode(
      errorCode: 'permission',
    ).toJson(),
  };
}

class ErrorCode {
  final String errorCode;
  final String description;

  ErrorCode({@required this.errorCode, this.description});

  Map<String, String> toJson() => {"errorCode": errorCode, "description": description};
}
