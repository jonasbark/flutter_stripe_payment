// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_pay_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidPayPaymentRequest _$AndroidPayPaymentRequestFromJson(Map json) {
  return AndroidPayPaymentRequest(
    billingAddressRequired: json['billing_address_required'] as bool,
    currencyCode: json['currency_code'] as String,
    lineItems: (json['line_items'] as List)
        ?.map((e) => e == null
            ? null
            : LineItem.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    shippingAddressRequired: json['shipping_address_required'] as bool,
    shippingCountries:
        (json['shipping_countries'] as List)?.map((e) => e as String)?.toList(),
    phoneNumberRequired: json['phone_number_required'] as bool,
    emailRequired: json['email_required'] as bool,
    totalPrice: json['total_price'] as String,
  );
}

Map<String, dynamic> _$AndroidPayPaymentRequestToJson(
    AndroidPayPaymentRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('billing_address_required', instance.billingAddressRequired);
  writeNotNull('currency_code', instance.currencyCode);
  writeNotNull(
      'line_items', instance.lineItems?.map((e) => e?.toJson())?.toList());
  writeNotNull('shipping_address_required', instance.shippingAddressRequired);
  writeNotNull('shipping_countries', instance.shippingCountries);
  writeNotNull('phone_number_required', instance.phoneNumberRequired);
  writeNotNull('email_required', instance.emailRequired);
  writeNotNull('total_price', instance.totalPrice);
  return val;
}
