@JS()
library api.PaymentMethods;

import "package:js/js.dart";
import "shared.dart" show Metadata, Address, MetadataParam;

// Module @stripe/stripe-js
/// The PaymentMethod object.
@anonymous
@JS()
abstract class PaymentMethod {
  /// Unique identifier for the object.
  external String get id;
  external set id(String v);

  /// String representing the object's type. Objects of the same type share the same value.
  external String /*'payment_method'*/ get object;
  external set object(String /*'payment_method'*/ v);
  external BillingDetails get billing_details;
  external set billing_details(BillingDetails v);
  external Card get card;
  external set card(Card v);
  external CardPresent get card_present;
  external set card_present(CardPresent v);

  /// Time at which the object was created. Measured in seconds since the Unix epoch.
  external num get created;
  external set created(num v);

  /// The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.
  external String /*String|Null*/ get customer;
  external set customer(String /*String|Null*/ v);
  external Fpx get fpx;
  external set fpx(Fpx v);
  external Ideal get ideal;
  external set ideal(Ideal v);

  /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  external bool get livemode;
  external set livemode(bool v);

  /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  external Metadata get metadata;
  external set metadata(Metadata v);
  external SepaDebit get sepa_debit;
  external set sepa_debit(SepaDebit v);

  /// The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
  external String get type;
  external set type(String v);
  external factory PaymentMethod(
      {String id,
      String /*'payment_method'*/ object,
      BillingDetails billing_details,
      Card card,
      CardPresent card_present,
      num created,
      String /*String|Null*/ customer,
      Fpx fpx,
      Ideal ideal,
      bool livemode,
      Metadata metadata,
      SepaDebit sepa_debit,
      String type});
}

// Module PaymentMethod
@anonymous
@JS()
abstract class AuBecsDebit {
  /// Bank State Branch
  external String /*String|Null*/ get bsb_number;
  external set bsb_number(String /*String|Null*/ v);

  /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);

  /// Last four characters of the account number.
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external factory AuBecsDebit(
      {String /*String|Null*/ bsb_number,
      String /*String|Null*/ fingerprint,
      String /*String|Null*/ last4});
}

@anonymous
@JS()
abstract class BillingDetails {
  /// Billing address.
  external Address /*Address|Null*/ get address;
  external set address(Address /*Address|Null*/ v);

  /// Email address.
  external String /*String|Null*/ get email;
  external set email(String /*String|Null*/ v);

  /// Full name.
  external String /*String|Null*/ get name;
  external set name(String /*String|Null*/ v);

  /// Billing phone number (including extension).
  external String /*String|Null*/ get phone;
  external set phone(String /*String|Null*/ v);
  external factory BillingDetails(
      {Address /*Address|Null*/ address,
      String /*String|Null*/ email,
      String /*String|Null*/ name,
      String /*String|Null*/ phone});
}

@anonymous
@JS()
abstract class Card {
  /// Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
  external String get brand;
  external set brand(String v);

  /// Checks on Card address and CVC if provided.
  external Checks /*Checks|Null*/ get checks;
  external set checks(Checks /*Checks|Null*/ v);

  /// Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);

  /// Two-digit number representing the card's expiration month.
  external num get exp_month;
  external set exp_month(num v);

  /// Four-digit number representing the card's expiration year.
  external num get exp_year;
  external set exp_year(num v);

  /// Uniquely identifies this particular card number. You can use this attribute to check whether two customers who've signed up with you are using the same card number.
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);

  /// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
  external String get funding;
  external set funding(String v);

  /// The last four digits of the card.
  external String get last4;
  external set last4(String v);

  /// Contains details on how this Card maybe be used for 3D Secure authentication.
  external ThreeDSecureUsage /*ThreeDSecureUsage|Null*/ get three_d_secure_usage;
  external set three_d_secure_usage(
      ThreeDSecureUsage /*ThreeDSecureUsage|Null*/ v);

  /// If this Card is part of a card wallet, this contains the details of the card wallet.
  external dynamic /*Null|JSMap of <String,dynamic>*/ get wallet;
  external set wallet(dynamic /*Null|JSMap of <String,dynamic>*/ v);
  external factory Card(
      {String brand,
      Checks /*Checks|Null*/ checks,
      String /*String|Null*/ country,
      num exp_month,
      num exp_year,
      String /*String|Null*/ fingerprint,
      String funding,
      String last4,
      ThreeDSecureUsage /*ThreeDSecureUsage|Null*/ three_d_secure_usage,
      dynamic /*Null|JSMap of <String,dynamic>*/ wallet});
}

// Module Card
@anonymous
@JS()
abstract class Checks {
  /// If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
  external String /*String|Null*/ get address_line1_check;
  external set address_line1_check(String /*String|Null*/ v);

  /// If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
  external String /*String|Null*/ get address_postal_code_check;
  external set address_postal_code_check(String /*String|Null*/ v);

  /// If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
  external String /*String|Null*/ get cvc_check;
  external set cvc_check(String /*String|Null*/ v);
  external factory Checks(
      {String /*String|Null*/ address_line1_check,
      String /*String|Null*/ address_postal_code_check,
      String /*String|Null*/ cvc_check});
}

@anonymous
@JS()
abstract class ThreeDSecureUsage {
  /// Whether 3D Secure is supported on this card.
  external bool get supported;
  external set supported(bool v);
  external factory ThreeDSecureUsage({bool supported});
}

// End module Card
@anonymous
@JS()
abstract class CardPresent {}

@anonymous
@JS()
abstract class Fpx {
  /// The customer's bank.
  external String get bank;
  external set bank(String v);
  external factory Fpx({String bank});
}

@anonymous
@JS()
abstract class Ideal {
  /// The customer's bank, if provided.
  external String /*String|Null*/ get bank;
  external set bank(String /*String|Null*/ v);

  /// The Bank Identifier Code of the customer's bank, if the bank was provided.
  external String /*String|Null*/ get bic;
  external set bic(String /*String|Null*/ v);
  external factory Ideal(
      {String /*String|Null*/ bank, String /*String|Null*/ bic});
}

@anonymous
@JS()
abstract class SepaDebit {
  /// Bank code of bank associated with the bank account.
  external String /*String|Null*/ get bank_code;
  external set bank_code(String /*String|Null*/ v);

  /// Branch code of bank associated with the bank account.
  external String /*String|Null*/ get branch_code;
  external set branch_code(String /*String|Null*/ v);

  /// Two-letter ISO code representing the country the bank account is located in.
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);

  /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);

  /// Last four characters of the IBAN.
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external factory SepaDebit(
      {String /*String|Null*/ bank_code,
      String /*String|Null*/ branch_code,
      String /*String|Null*/ country,
      String /*String|Null*/ fingerprint,
      String /*String|Null*/ last4});
}

// End module PaymentMethod
@anonymous
@JS()
abstract class PaymentMethodCreateParams {
  /// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
  external PaymentMethodCreateParams_BillingDetails get billing_details;
  external set billing_details(PaymentMethodCreateParams_BillingDetails v);

  /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  external MetadataParam get metadata;
  external set metadata(MetadataParam v);

  /// The PaymentMethod to share.
  external String get payment_method;
  external set payment_method(String v);

  /// The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type. Required unless `payment_method` is specified (see the [Cloning PaymentMethods](https://stripe.com/docs/payments/payment-methods/connect#cloning-payment-methods) guide)
  external String get type;
  external set type(String v);
  external factory PaymentMethodCreateParams(
      {PaymentMethodCreateParams_BillingDetails billing_details,
      MetadataParam metadata,
      String payment_method,
      String type});
}

// Module PaymentMethodCreateParams
@anonymous
@JS()
abstract class PaymentMethodCreateParams_BillingDetails {
  /// Billing address.
  external Address get address;
  external set address(Address v);

  /// Email address.
  external String get email;
  external set email(String v);

  /// Full name.
  external String get name;
  external set name(String v);

  /// Billing phone number (including extension).
  external String get phone;
  external set phone(String v);
  external factory PaymentMethodCreateParams_BillingDetails(
      {Address address, String email, String name, String phone});
}

// Module BillingDetails
@anonymous
@JS()
abstract class Address {
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
  external factory Address(
      {String city,
      String country,
      String line1,
      String line2,
      String postal_code,
      String state});
}

// End module BillingDetails

// End module PaymentMethodCreateParams

// End module @stripe/stripe-js
