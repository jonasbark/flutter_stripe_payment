@JS()
library api.Tokens;

import "package:js/js.dart";
import "BankAccounts.dart" show BankAccount;
import "Cards.dart" show Card;
import "shared.dart" show JapanAddressParam, MetadataParam;

// Module @stripe/stripe-js
/// The Token object.
@anonymous
@JS()
abstract class Token {
  /// Unique identifier for the object.
  external String get id;
  external set id(String v);

  /// String representing the object's type. Objects of the same type share the same value.
  external String /*'token'*/ get object;
  external set object(String /*'token'*/ v);
  external BankAccount get bank_account;
  external set bank_account(BankAccount v);
  external Card get card;
  external set card(Card v);

  /// IP address of the client that generated the token.
  external String /*String|Null*/ get client_ip;
  external set client_ip(String /*String|Null*/ v);

  /// Time at which the object was created. Measured in seconds since the Unix epoch.
  external num get created;
  external set created(num v);

  /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  external bool get livemode;
  external set livemode(bool v);

  /// Type of the token: `account`, `bank_account`, `card`, or `pii`.
  external String get type;
  external set type(String v);

  /// Whether this token has already been used (tokens can be used only once).
  external bool get used;
  external set used(bool v);
  external factory Token(
      {String id,
      String /*'token'*/ object,
      BankAccount bank_account,
      Card card,
      String /*String|Null*/ client_ip,
      num created,
      bool livemode,
      String type,
      bool used});
}

// Module TokenCreateParams
@anonymous
@JS()
abstract class Account {
  /// The business type.
  external String /*'company'|'government_entity'|'individual'|'non_profit'*/ get business_type;
  external set business_type(
      String /*'company'|'government_entity'|'individual'|'non_profit'*/ v);

  /// Information about the company or business.
  external Company get company;
  external set company(Company v);

  /// Information about the person represented by the account.
  external Individual get individual;
  external set individual(Individual v);

  /// Whether the user described by the data in the token has been shown [the Stripe Connected Account Agreement](https://stripe.com/docs/connect/account-tokens#stripe-connected-account-agreement). When creating an account token to create a new Connect account, this value must be `true`.
  external bool get tos_shown_and_accepted;
  external set tos_shown_and_accepted(bool v);
  external factory Account(
      {String /*'company'|'government_entity'|'individual'|'non_profit'*/ business_type,
      Company company,
      Individual individual,
      bool tos_shown_and_accepted});
}

// Module Account
/*type BusinessType =
        | 'company'
        | 'government_entity'
        | 'individual'
        | 'non_profit';
*/
@anonymous
@JS()
abstract class Company {
  /// The company's primary address.
  external Address get address;
  external set address(Address v);

  /// The Kana variation of the company's primary address (Japan only).
  external JapanAddressParam get address_kana;
  external set address_kana(JapanAddressParam v);

  /// The Kanji variation of the company's primary address (Japan only).
  external JapanAddressParam get address_kanji;
  external set address_kanji(JapanAddressParam v);

  /// Whether the company's directors have been provided. Set this Boolean to `true` after creating all the company's directors with [the Persons API](https://stripe.com/docs/api/persons) for accounts with a `relationship.director` requirement. This value is not automatically set to `true` after creating directors, so it needs to be updated to indicate all directors have been provided.
  external bool get directors_provided;
  external set directors_provided(bool v);

  /// Whether the company's executives have been provided. Set this Boolean to `true` after creating all the company's executives with [the Persons API](https://stripe.com/docs/api/persons) for accounts with a `relationship.executive` requirement.
  external bool get executives_provided;
  external set executives_provided(bool v);

  /// The company's legal name.
  external String get name;
  external set name(String v);

  /// The Kana variation of the company's legal name (Japan only).
  external String get name_kana;
  external set name_kana(String v);

  /// The Kanji variation of the company's legal name (Japan only).
  external String get name_kanji;
  external set name_kanji(String v);

  /// Whether the company's owners have been provided. Set this Boolean to `true` after creating all the company's owners with [the Persons API](https://stripe.com/docs/api/persons) for accounts with a `relationship.owner` requirement.
  external bool get owners_provided;
  external set owners_provided(bool v);

  /// The company's phone number (used for verification).
  external String get phone;
  external set phone(String v);

  /// The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/docs/connect/identity-verification#business-structure) for more details.
  external String /*'government_instrumentality'|'governmental_unit'|'incorporated_non_profit'|'limited_liability_partnership'|'multi_member_llc'|'private_company'|'private_corporation'|'private_partnership'|'public_company'|'public_corporation'|'public_partnership'|'sole_proprietorship'|'tax_exempt_government_instrumentality'|'unincorporated_association'|'unincorporated_non_profit'|Null*/ get structure;
  external set structure(
      String /*'government_instrumentality'|'governmental_unit'|'incorporated_non_profit'|'limited_liability_partnership'|'multi_member_llc'|'private_company'|'private_corporation'|'private_partnership'|'public_company'|'public_corporation'|'public_partnership'|'sole_proprietorship'|'tax_exempt_government_instrumentality'|'unincorporated_association'|'unincorporated_non_profit'|Null*/ v);

  /// The business ID number of the company, as appropriate for the company's country. (Examples are an Employer ID Number in the U.S., a Business Number in Canada, or a Company Number in the UK.)
  external String get tax_id;
  external set tax_id(String v);

  /// The jurisdiction in which the `tax_id` is registered (Germany-based companies only).
  external String get tax_id_registrar;
  external set tax_id_registrar(String v);

  /// The VAT number of the company.
  external String get vat_id;
  external set vat_id(String v);

  /// Information on the verification state of the company.
  external Verification get verification;
  external set verification(Verification v);
  external factory Company(
      {Address address,
      JapanAddressParam address_kana,
      JapanAddressParam address_kanji,
      bool directors_provided,
      bool executives_provided,
      String name,
      String name_kana,
      String name_kanji,
      bool owners_provided,
      String phone,
      String /*'government_instrumentality'|'governmental_unit'|'incorporated_non_profit'|'limited_liability_partnership'|'multi_member_llc'|'private_company'|'private_corporation'|'private_partnership'|'public_company'|'public_corporation'|'public_partnership'|'sole_proprietorship'|'tax_exempt_government_instrumentality'|'unincorporated_association'|'unincorporated_non_profit'|Null*/ structure,
      String tax_id,
      String tax_id_registrar,
      String vat_id,
      Verification verification});
}

// Module Company
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

/*type Structure =
          | 'government_instrumentality'
          | 'governmental_unit'
          | 'incorporated_non_profit'
          | 'limited_liability_partnership'
          | 'multi_member_llc'
          | 'private_company'
          | 'private_corporation'
          | 'private_partnership'
          | 'public_company'
          | 'public_corporation'
          | 'public_partnership'
          | 'sole_proprietorship'
          | 'tax_exempt_government_instrumentality'
          | 'unincorporated_association'
          | 'unincorporated_non_profit';
*/
@anonymous
@JS()
abstract class Verification {
  /// A document verifying the business.
  external Document get document;
  external set document(Document v);
  external factory Verification({Document document});
}

// Module Verification
@anonymous
@JS()
abstract class Document {
  /// The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get back;
  external set back(String v);

  /// The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get front;
  external set front(String v);
  external factory Document({String back, String front});
}

// End module Verification

// End module Company
@anonymous
@JS()
abstract class Individual {
  /// The individual's primary address.
  external Individual_Address get address;
  external set address(Individual_Address v);

  /// The Kana variation of the the individual's primary address (Japan only).
  external JapanAddressParam get address_kana;
  external set address_kana(JapanAddressParam v);

  /// The Kanji variation of the the individual's primary address (Japan only).
  external JapanAddressParam get address_kanji;
  external set address_kanji(JapanAddressParam v);

  /// The individual's date of birth.
  external Dob /*Dob|Null*/ get dob;
  external set dob(Dob /*Dob|Null*/ v);

  /// The individual's email address.
  external String get email;
  external set email(String v);

  /// The individual's first name.
  external String get first_name;
  external set first_name(String v);

  /// The Kana variation of the the individual's first name (Japan only).
  external String get first_name_kana;
  external set first_name_kana(String v);

  /// The Kanji variation of the individual's first name (Japan only).
  external String get first_name_kanji;
  external set first_name_kanji(String v);

  /// The individual's gender (International regulations require either "male" or "female").
  external String get gender;
  external set gender(String v);

  /// The government-issued ID number of the individual, as appropriate for the representative's country. (Examples are a Social Security Number in the U.S., or a Social Insurance Number in Canada). Instead of the number itself, you can also provide a [PII token created with Stripe.js](https://stripe.com/docs/stripe.js#collecting-pii-data).
  external String get id_number;
  external set id_number(String v);

  /// The individual's last name.
  external String get last_name;
  external set last_name(String v);

  /// The Kana varation of the individual's last name (Japan only).
  external String get last_name_kana;
  external set last_name_kana(String v);

  /// The Kanji varation of the individual's last name (Japan only).
  external String get last_name_kanji;
  external set last_name_kanji(String v);

  /// The individual's maiden name.
  external String get maiden_name;
  external set maiden_name(String v);

  /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  external MetadataParam /*MetadataParam|Null*/ get metadata;
  external set metadata(MetadataParam /*MetadataParam|Null*/ v);

  /// The individual's phone number.
  external String get phone;
  external set phone(String v);

  /// The last four digits of the individual's Social Security Number (U.S. only).
  external String get ssn_last_4;
  external set ssn_last_4(String v);

  /// The individual's verification document information.
  external Individual_Verification get verification;
  external set verification(Individual_Verification v);
  external factory Individual(
      {Individual_Address address,
      JapanAddressParam address_kana,
      JapanAddressParam address_kanji,
      Dob /*Dob|Null*/ dob,
      String email,
      String first_name,
      String first_name_kana,
      String first_name_kanji,
      String gender,
      String id_number,
      String last_name,
      String last_name_kana,
      String last_name_kanji,
      String maiden_name,
      MetadataParam /*MetadataParam|Null*/ metadata,
      String phone,
      String ssn_last_4,
      Individual_Verification verification});
}

// Module Individual
@anonymous
@JS()
abstract class Individual_Address {
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
  external factory Individual_Address(
      {String city,
      String country,
      String line1,
      String line2,
      String postal_code,
      String state});
}

@anonymous
@JS()
abstract class Dob {
  /// The day of birth, between 1 and 31.
  external num get day;
  external set day(num v);

  /// The month of birth, between 1 and 12.
  external num get month;
  external set month(num v);

  /// The four-digit year of birth.
  external num get year;
  external set year(num v);
  external factory Dob({num day, num month, num year});
}

@anonymous
@JS()
abstract class Individual_Verification {
  /// A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
  external AdditionalDocument get additional_document;
  external set additional_document(AdditionalDocument v);

  /// An identifying document, either a passport or local ID card.
  external Verification_Document get document;
  external set document(Verification_Document v);
  external factory Individual_Verification(
      {AdditionalDocument additional_document, Verification_Document document});
}

// Module Verification
@anonymous
@JS()
abstract class AdditionalDocument {
  /// The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get back;
  external set back(String v);

  /// The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get front;
  external set front(String v);
  external factory AdditionalDocument({String back, String front});
}

@anonymous
@JS()
abstract class Verification_Document {
  /// The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get back;
  external set back(String v);

  /// The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get front;
  external set front(String v);
  external factory Verification_Document({String back, String front});
}

// End module Verification

// End module Individual

// End module Account
@anonymous
@JS()
abstract class Person {
  /// The person's address.
  external Person_Address get address;
  external set address(Person_Address v);

  /// The Kana variation of the person's address (Japan only).
  external JapanAddressParam get address_kana;
  external set address_kana(JapanAddressParam v);

  /// The Kanji variation of the person's address (Japan only).
  external JapanAddressParam get address_kanji;
  external set address_kanji(JapanAddressParam v);

  /// The person's date of birth.
  external Person_Dob /*Person_Dob|Null*/ get dob;
  external set dob(Person_Dob /*Person_Dob|Null*/ v);

  /// The person's email address.
  external String get email;
  external set email(String v);

  /// The person's first name.
  external String get first_name;
  external set first_name(String v);

  /// The Kana variation of the person's first name (Japan only).
  external String get first_name_kana;
  external set first_name_kana(String v);

  /// The Kanji variation of the person's first name (Japan only).
  external String get first_name_kanji;
  external set first_name_kanji(String v);

  /// The person's gender (International regulations require either "male" or "female").
  external String get gender;
  external set gender(String v);

  /// The person's ID number, as appropriate for their country. For example, a social security number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you can also provide a [PII token provided by Stripe.js](https://stripe.com/docs/stripe.js#collecting-pii-data).
  external String get id_number;
  external set id_number(String v);

  /// The person's last name.
  external String get last_name;
  external set last_name(String v);

  /// The Kana variation of the person's last name (Japan only).
  external String get last_name_kana;
  external set last_name_kana(String v);

  /// The Kanji variation of the person's last name (Japan only).
  external String get last_name_kanji;
  external set last_name_kanji(String v);

  /// The person's maiden name.
  external String get maiden_name;
  external set maiden_name(String v);

  /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
  external MetadataParam /*MetadataParam|Null*/ get metadata;
  external set metadata(MetadataParam /*MetadataParam|Null*/ v);

  /// The person's phone number.
  external String get phone;
  external set phone(String v);

  /// The relationship that this person has with the account's legal entity.
  external Relationship get relationship;
  external set relationship(Relationship v);

  /// The last 4 digits of the person's social security number.
  external String get ssn_last_4;
  external set ssn_last_4(String v);

  /// The person's verification status.
  external Person_Verification get verification;
  external set verification(Person_Verification v);
  external factory Person(
      {Person_Address address,
      JapanAddressParam address_kana,
      JapanAddressParam address_kanji,
      Person_Dob /*Person_Dob|Null*/ dob,
      String email,
      String first_name,
      String first_name_kana,
      String first_name_kanji,
      String gender,
      String id_number,
      String last_name,
      String last_name_kana,
      String last_name_kanji,
      String maiden_name,
      MetadataParam /*MetadataParam|Null*/ metadata,
      String phone,
      Relationship relationship,
      String ssn_last_4,
      Person_Verification verification});
}

// Module Person
@anonymous
@JS()
abstract class Person_Address {
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
  external factory Person_Address(
      {String city,
      String country,
      String line1,
      String line2,
      String postal_code,
      String state});
}

@anonymous
@JS()
abstract class Person_Dob {
  /// The day of birth, between 1 and 31.
  external num get day;
  external set day(num v);

  /// The month of birth, between 1 and 12.
  external num get month;
  external set month(num v);

  /// The four-digit year of birth.
  external num get year;
  external set year(num v);
  external factory Person_Dob({num day, num month, num year});
}

@anonymous
@JS()
abstract class Relationship {
  /// Whether the person is a director of the account's legal entity. Currently only required for accounts in the EU. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
  external bool get director;
  external set director(bool v);

  /// Whether the person has significant responsibility to control, manage, or direct the organization.
  external bool get executive;
  external set executive(bool v);

  /// Whether the person is an owner of the account's legal entity.
  external bool get owner;
  external set owner(bool v);

  /// The percent owned by the person of the account's legal entity.
  external num /*num|Null*/ get percent_ownership;
  external set percent_ownership(num /*num|Null*/ v);

  /// Whether the person is authorized as the primary representative of the account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
  external bool get representative;
  external set representative(bool v);

  /// The person's title (e.g., CEO, Support Engineer).
  external String get title;
  external set title(String v);
  external factory Relationship(
      {bool director,
      bool executive,
      bool owner,
      num /*num|Null*/ percent_ownership,
      bool representative,
      String title});
}

@anonymous
@JS()
abstract class Person_Verification {
  /// A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
  external Verification_AdditionalDocument get additional_document;
  external set additional_document(Verification_AdditionalDocument v);

  /// An identifying document, either a passport or local ID card.
  external Person_Verification_Document get document;
  external set document(Person_Verification_Document v);
  external factory Person_Verification(
      {Verification_AdditionalDocument additional_document,
      Person_Verification_Document document});
}

// Module Verification
@anonymous
@JS()
abstract class Verification_AdditionalDocument {
  /// The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get back;
  external set back(String v);

  /// The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get front;
  external set front(String v);
  external factory Verification_AdditionalDocument({String back, String front});
}

@anonymous
@JS()
abstract class Person_Verification_Document {
  /// The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get back;
  external set back(String v);

  /// The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`. The uploaded file needs to be a color image (smaller than 8,000px by 8,000px), in JPG, PNG, or PDF format, and less than 10 MB in size.
  external String get front;
  external set front(String v);
  external factory Person_Verification_Document({String back, String front});
}

// End module Verification

// End module Person

// End module TokenCreateParams

// End module @stripe/stripe-js
