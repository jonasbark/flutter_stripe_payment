// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDetails _$ContactDetailsFromJson(Map json) {
  return ContactDetails(
    name: json['name'] as String,
    phoneNumber: json['phoneNumber'] as String,
    emailAddress: json['emailAddress'] as String,
    supplementarySubLocality: json['supplementarySubLocality'] as String,
    street: json['street'] as String,
    city: json['city'] as String,
    state: json['state'] as String,
    country: json['country'] as String,
    isoCountryCode: json['ISOCountryCode'] as String,
    postalCode: json['postalCode'] as String,
  );
}

Map<String, dynamic> _$ContactDetailsToJson(ContactDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('emailAddress', instance.emailAddress);
  writeNotNull('supplementarySubLocality', instance.supplementarySubLocality);
  writeNotNull('street', instance.street);
  writeNotNull('city', instance.city);
  writeNotNull('state', instance.state);
  writeNotNull('country', instance.country);
  writeNotNull('ISOCountryCode', instance.isoCountryCode);
  writeNotNull('postalCode', instance.postalCode);
  return val;
}
