@JS()
library api.Cards;

import "package:js/js.dart";
import "shared.dart" show Metadata;

// Module @stripe/stripe-js
/// The Card object.
@anonymous
@JS()
abstract class Card {
  /// Unique identifier for the object.
  external String get id;
  external set id(String v);

  /// String representing the object's type. Objects of the same type share the same value.
  external String /*'card'*/ get object;
  external set object(String /*'card'*/ v);

  /// City/District/Suburb/Town/Village.
  external String /*String|Null*/ get address_city;
  external set address_city(String /*String|Null*/ v);

  /// Billing address country, if provided when creating card.
  external String /*String|Null*/ get address_country;
  external set address_country(String /*String|Null*/ v);

  /// Address line 1 (Street address/PO Box/Company name).
  external String /*String|Null*/ get address_line1;
  external set address_line1(String /*String|Null*/ v);

  /// If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
  external String /*String|Null*/ get address_line1_check;
  external set address_line1_check(String /*String|Null*/ v);

  /// Address line 2 (Apartment/Suite/Unit/Building).
  external String /*String|Null*/ get address_line2;
  external set address_line2(String /*String|Null*/ v);

  /// State/County/Province/Region.
  external String /*String|Null*/ get address_state;
  external set address_state(String /*String|Null*/ v);

  /// ZIP or postal code.
  external String /*String|Null*/ get address_zip;
  external set address_zip(String /*String|Null*/ v);

  /// If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
  external String /*String|Null*/ get address_zip_check;
  external set address_zip_check(String /*String|Null*/ v);

  /// Card brand. Can be `American Express`, `Diners Club`, `Discover`, `JCB`, `MasterCard`, `UnionPay`, `Visa`, or `Unknown`.
  external String get brand;
  external set brand(String v);

  /// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);

  /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  external String /*String|Null*/ get currency;
  external set currency(String /*String|Null*/ v);

  /// The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead.
  external String /*String|Null*/ get customer;
  external set customer(String /*String|Null*/ v);

  /// If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
  external String /*String|Null*/ get cvc_check;
  external set cvc_check(String /*String|Null*/ v);

  /// (For tokenized numbers only.) The last four digits of the device account number.
  external String /*String|Null*/ get dynamic_last4;
  external set dynamic_last4(String /*String|Null*/ v);

  /// Two-digit number representing the card's expiration month.
  external num get exp_month;
  external set exp_month(num v);

  /// Four-digit number representing the card's expiration year.
  external num get exp_year;
  external set exp_year(num v);

  /// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who've signed up with you are using the same card number, for example.
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);

  /// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
  external String get funding;
  external set funding(String v);

  /// The last four digits of the card.
  external String get last4;
  external set last4(String v);

  /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  external Metadata get metadata;
  external set metadata(Metadata v);

  /// Cardholder name.
  external String /*String|Null*/ get name;
  external set name(String /*String|Null*/ v);

  /// If the card number is tokenized, this is the method that was used. Can be `apple_pay` or `google_pay`.
  external String /*String|Null*/ get tokenization_method;
  external set tokenization_method(String /*String|Null*/ v);
  external factory Card(
      {String id,
      String /*'card'*/ object,
      String /*String|Null*/ address_city,
      String /*String|Null*/ address_country,
      String /*String|Null*/ address_line1,
      String /*String|Null*/ address_line1_check,
      String /*String|Null*/ address_line2,
      String /*String|Null*/ address_state,
      String /*String|Null*/ address_zip,
      String /*String|Null*/ address_zip_check,
      String brand,
      String /*String|Null*/ country,
      String /*String|Null*/ currency,
      String /*String|Null*/ customer,
      String /*String|Null*/ cvc_check,
      String /*String|Null*/ dynamic_last4,
      num exp_month,
      num exp_year,
      String /*String|Null*/ fingerprint,
      String funding,
      String last4,
      Metadata metadata,
      String /*String|Null*/ name,
      String /*String|Null*/ tokenization_method});
}

// Module Card
/*type AvailablePayoutMethod = 'instant' | 'standard';*/

// End module Card

// End module @stripe/stripe-js
