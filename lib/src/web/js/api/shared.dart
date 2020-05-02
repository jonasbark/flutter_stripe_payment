@JS()
library api.shared;

import "package:js/js.dart";

// Module @stripe/stripe-js
/// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
@anonymous
@JS()
abstract class Metadata {
  /* Index signature is not yet supported by JavaScript interop. */
}

/// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
/// While you can send values as numbers, they will be returned as strings.
@anonymous
@JS()
abstract class MetadataParam {
  /* Index signature is not yet supported by JavaScript interop. */
}

/// The Address object.
@anonymous
@JS()
abstract class Address {
  /// City/District/Suburb/Town/Village.
  external String /*String|Null*/ get city;
  external set city(String /*String|Null*/ v);

  /// 2-letter country code.
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);

  /// Address line 1 (Street address/PO Box/Company name).
  external String /*String|Null*/ get line1;
  external set line1(String /*String|Null*/ v);

  /// Address line 2 (Apartment/Suite/Unit/Building).
  external String /*String|Null*/ get line2;
  external set line2(String /*String|Null*/ v);

  /// ZIP or postal code.
  external String /*String|Null*/ get postal_code;
  external set postal_code(String /*String|Null*/ v);

  /// State/County/Province/Region.
  external String /*String|Null*/ get state;
  external set state(String /*String|Null*/ v);
  external factory Address(
      {String /*String|Null*/ city,
      String /*String|Null*/ country,
      String /*String|Null*/ line1,
      String /*String|Null*/ line2,
      String /*String|Null*/ postal_code,
      String /*String|Null*/ state});
}

@anonymous
@JS()
abstract class AccountAddressParam {
  /// City, district, suburb, town, or village.
  external String get city;
  external set city(String v);

  /// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  external String get country;
  external set country(String v);

  /// Address line 1 (e.g., street, PO Box, or company name).
  external String get line1;
  external set line1(String v);

  /// Address line 2 (e.g., apartment, suite, unit, or building).
  external String get line2;
  external set line2(String v);

  /// ZIP or postal code.
  external String get postal_code;
  external set postal_code(String v);

  /// State, county, province, or region.
  external String get state;
  external set state(String v);
  external factory AccountAddressParam(
      {String city,
      String country,
      String line1,
      String line2,
      String postal_code,
      String state});
}

@anonymous
@JS()
abstract class AddressParam implements AccountAddressParam {
  /// Address line 1 (e.g., street, PO Box, or company name).
  external String get line1;
  external set line1(String v);
  external factory AddressParam(
      {String line1,
      String city,
      String country,
      String line2,
      String postal_code,
      String state});
}

@anonymous
@JS()
abstract class JapanAddressParam {
  /// City or ward.
  external String get city;
  external set city(String v);

  /// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
  external String get country;
  external set country(String v);

  /// Block or building number.
  external String get line1;
  external set line1(String v);

  /// Building details.
  external String get line2;
  external set line2(String v);

  /// Postal code.
  external String get postal_code;
  external set postal_code(String v);

  /// Prefecture.
  external String get state;
  external set state(String v);

  /// Town or cho-me.
  external String get town;
  external set town(String v);
  external factory JapanAddressParam(
      {String city,
      String country,
      String line1,
      String line2,
      String postal_code,
      String state,
      String town});
}

// End module @stripe/stripe-js
