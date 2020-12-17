// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_form_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardFormPaymentRequest _$CardFormPaymentRequestFromJson(Map json) {
  return CardFormPaymentRequest(
    prefilledInformation: json['prefilledInformation'] == null
        ? null
        : PrefilledInformation.fromJson(json['prefilledInformation'] as Map),
    requiredBillingAddressFields:
        json['requiredBillingAddressFields'] as String,
  );
}

Map<String, dynamic> _$CardFormPaymentRequestToJson(
    CardFormPaymentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prefilledInformation', instance.prefilledInformation?.toJson());
  writeNotNull(
      'requiredBillingAddressFields', instance.requiredBillingAddressFields);
  return val;
}
