import 'dart:io';

import 'package:flutter/material.dart';

class Errors {
  Map<String, ErrorCode> mapping = {
    "busy": ErrorCode(
      errorCode: 'busy',
      description: 'Previous request is not completed',
    ),
    "cancelled": ErrorCode(
      errorCode: 'cancelled',
      description: 'Cancelled by user',
    ),
    "purchaseCancelled": ErrorCode(
      errorCode: 'purchaseCancelled',
      description: 'Purchase was cancelled',
    ),
    "sourceStatusCanceled": ErrorCode(
      errorCode: 'sourceStatusCanceled',
      description: 'Cancelled by user',
    ),
    "sourceStatusPending": ErrorCode(
      errorCode: 'sourceStatusPending',
      description: 'The source has been created and is awaiting customer action',
    ),
    "sourceStatusFailed": ErrorCode(
      errorCode: 'sourceStatusFailed',
      description: "The source status is unknown. You shouldn't encounter this value.",
    ),
    "sourceStatusUnknown": ErrorCode(
      errorCode: 'sourceStatusUnknown',
      description: 'Source polling unknown error',
    ),
    "deviceNotSupportsNativePay": ErrorCode(
        errorCode: 'deviceNotSupportsNativePay',
        description:
            Platform.isIOS ? 'This device does not support Apple Pay' : 'This device does not support Google Pay'),
    "noPaymentRequest": ErrorCode(
      errorCode: 'noPaymentRequest',
      description: 'Missing payment request',
    ),
    "noMerchantIdentifier": ErrorCode(
      errorCode: 'noMerchantIdentifier',
      description: 'Missing merchant identifier',
    ),
    "noAmount": ErrorCode(
      errorCode: 'noAmount',
      description: 'Amount should be greater than 0',
    ),
    "parseResponse": ErrorCode(
      errorCode: 'parseResponse',
      description: 'Failed to parse JSON',
    ),
    "activityUnavailable": ErrorCode(
      errorCode: 'activityUnavailable',
      description: 'Cannot continue with no current activity',
    ),
    "playServicesUnavailable": ErrorCode(
      errorCode: 'playServicesUnavailable',
      description: 'Play services are not available',
    ),
    "redirectCancelled": ErrorCode(
      errorCode: 'redirectCancelled',
      description: 'Redirect cancelled',
    ),
    "redirectNoSource": ErrorCode(
      errorCode: 'redirectNoSource',
      description: 'Received redirect uri but there is no source to process',
    ),
    "redirectWrongSourceId": ErrorCode(
      errorCode: 'redirectWrongSourceId',
      description: 'Received wrong source id in redirect uri',
    ),
    "redirectCancelledByUser": ErrorCode(
      errorCode: 'redirectCancelledByUser',
      description: 'User cancelled source redirect',
    ),
    "redirectFailed": ErrorCode(
      errorCode: 'redirectFailed',
      description: 'Source redirect failed',
    ),

    // Description provided by stripe api
    "api": ErrorCode(
      errorCode: 'api',
    ),
    "apiConnection": ErrorCode(
      errorCode: 'apiConnection',
    ),
    "redirectSpecific": ErrorCode(
      errorCode: 'redirectSpecific',
    ),
    "card": ErrorCode(
      errorCode: 'card',
    ),
    "invalidRequest": ErrorCode(
      errorCode: 'invalidRequest',
    ),
    "stripe": ErrorCode(
      errorCode: 'stripe',
    ),
    "rateLimit": ErrorCode(
      errorCode: 'rateLimit',
    ),
    "authentication": ErrorCode(
      errorCode: 'authentication',
    ),
    /**
     * Failures to authenticate will get this error
     * @see: (confirm/authenticate)(Setup/Payment)Intent
     */
    "authenticationFailed": ErrorCode(
      errorCode: 'authenticationFailed',
    ),
    "permission": ErrorCode(
      errorCode: 'permission',
    ),
  };
}

class ErrorCode {
  final String errorCode;
  final String description;

  ErrorCode({@required this.errorCode, this.description});
}
