// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apple_pay_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ApplePayPaymentOptionsToJson(
    ApplePayPaymentOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'requiredBillingAddressFields',
      instance.requiredBillingAddressFields
          ?.map((e) => _$RequiredBillingAddressFieldsEnumMap[e])
          ?.toList());
  writeNotNull(
      'requiredShippingAddressFields',
      instance.requiredShippingAddressFields
          ?.map((e) => _$RequiredShippingAddressFieldsEnumMap[e])
          ?.toList());
  writeNotNull('shippingMethod',
      instance.shippingMethod?.map((e) => e?.toJson())?.toList());
  writeNotNull('currencyCode', instance.currencyCode);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('shippingType', _$ShippingTypeEnumMap[instance.shippingType]);
  writeNotNull('items', instance.items?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$RequiredBillingAddressFieldsEnumMap = {
  RequiredBillingAddressFields.all: 'all',
  RequiredBillingAddressFields.name: 'name',
  RequiredBillingAddressFields.email: 'email',
  RequiredBillingAddressFields.phone: 'phone',
  RequiredBillingAddressFields.postal_address: 'postal_address',
};

const _$RequiredShippingAddressFieldsEnumMap = {
  RequiredShippingAddressFields.all: 'all',
  RequiredShippingAddressFields.name: 'name',
  RequiredShippingAddressFields.email: 'email',
  RequiredShippingAddressFields.phone: 'phone',
  RequiredShippingAddressFields.postal_address: 'postal_address',
};

const _$ShippingTypeEnumMap = {
  ShippingType.shipping: 'shipping',
  ShippingType.delivery: 'delivery',
  ShippingType.store_pickup: 'store_pickup',
  ShippingType.service_pickup: 'service_pickup',
};

ShippingMethod _$ShippingMethodFromJson(Map json) {
  return ShippingMethod(
    amount: json['amount'] as String,
    detail: json['detail'] as String,
    id: json['id'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$ShippingMethodToJson(ShippingMethod instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('detail', instance.detail);
  writeNotNull('id', instance.id);
  writeNotNull('label', instance.label);
  return val;
}

Map<String, dynamic> _$ApplePayItemToJson(ApplePayItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('label', instance.label);
  writeNotNull('amount', instance.amount);
  writeNotNull('type', instance.type);
  return val;
}
