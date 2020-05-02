@JS()
library api.Sources;

import "package:js/js.dart";
import "shared.dart" show Metadata, Address, MetadataParam, AddressParam;

// Module @stripe/stripe-js
/// The Source object.
@anonymous
@JS()
abstract class Source {
  /// Unique identifier for the object.
  external String get id;
  external set id(String v);

  /// String representing the object's type. Objects of the same type share the same value.
  external String /*'source'*/ get object;
  external set object(String /*'source'*/ v);
  external AchCreditTransfer get ach_credit_transfer;
  external set ach_credit_transfer(AchCreditTransfer v);
  external AchDebit get ach_debit;
  external set ach_debit(AchDebit v);
  external AcssDebit get acss_debit;
  external set acss_debit(AcssDebit v);
  external Alipay get alipay;
  external set alipay(Alipay v);

  /// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources.
  external num /*num|Null*/ get amount;
  external set amount(num /*num|Null*/ v);
  external AuBecsDebit get au_becs_debit;
  external set au_becs_debit(AuBecsDebit v);
  external Bancontact get bancontact;
  external set bancontact(Bancontact v);
  external Card get card;
  external set card(Card v);
  external CardPresent get card_present;
  external set card_present(CardPresent v);

  /// The client secret of the source. Used for client-side retrieval using a publishable key.
  external String get client_secret;
  external set client_secret(String v);
  external CodeVerification get code_verification;
  external set code_verification(CodeVerification v);

  /// Time at which the object was created. Measured in seconds since the Unix epoch.
  external num get created;
  external set created(num v);

  /// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources.
  external String /*String|Null*/ get currency;
  external set currency(String /*String|Null*/ v);

  /// The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer.
  external String get customer;
  external set customer(String v);
  external Eps get eps;
  external set eps(Eps v);

  /// The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`.
  external String get flow;
  external set flow(String v);
  external Giropay get giropay;
  external set giropay(Giropay v);
  external Ideal get ideal;
  external set ideal(Ideal v);
  external Klarna get klarna;
  external set klarna(Klarna v);

  /// Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
  external bool get livemode;
  external set livemode(bool v);

  /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
  external Metadata /*Metadata|Null*/ get metadata;
  external set metadata(Metadata /*Metadata|Null*/ v);
  external Multibanco get multibanco;
  external set multibanco(Multibanco v);

  /// Information about the owner of the payment instrument that may be used or required by particular source types.
  external Owner /*Owner|Null*/ get owner;
  external set owner(Owner /*Owner|Null*/ v);
  external P24 get p24;
  external set p24(P24 v);
  external Receiver get receiver;
  external set receiver(Receiver v);
  external Redirect get redirect;
  external set redirect(Redirect v);
  external SepaCreditTransfer get sepa_credit_transfer;
  external set sepa_credit_transfer(SepaCreditTransfer v);
  external SepaDebit get sepa_debit;
  external set sepa_debit(SepaDebit v);
  external Sofort get sofort;
  external set sofort(Sofort v);
  external SourceOrder get source_order;
  external set source_order(SourceOrder v);

  /// Extra information about a source. This will appear on your customer's statement every time you charge the source.
  external String /*String|Null*/ get statement_descriptor;
  external set statement_descriptor(String /*String|Null*/ v);

  /// The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge.
  external String get status;
  external set status(String v);
  external ThreeDSecure get three_d_secure;
  external set three_d_secure(ThreeDSecure v);

  /// The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An additional hash is included on the source with a name matching this value. It contains additional information specific to the [payment method](https://stripe.com/docs/sources) used.
  external String /*'ach_credit_transfer'|'ach_debit'|'acss_debit'|'alipay'|'au_becs_debit'|'bancontact'|'card'|'card_present'|'eps'|'giropay'|'ideal'|'klarna'|'multibanco'|'p24'|'sepa_credit_transfer'|'sepa_debit'|'sofort'|'three_d_secure'|'wechat'*/ get type;
  external set type(
      String /*'ach_credit_transfer'|'ach_debit'|'acss_debit'|'alipay'|'au_becs_debit'|'bancontact'|'card'|'card_present'|'eps'|'giropay'|'ideal'|'klarna'|'multibanco'|'p24'|'sepa_credit_transfer'|'sepa_debit'|'sofort'|'three_d_secure'|'wechat'*/ v);

  /// Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned.
  external String /*String|Null*/ get usage;
  external set usage(String /*String|Null*/ v);
  external Wechat get wechat;
  external set wechat(Wechat v);
  external factory Source(
      {String id,
      String /*'source'*/ object,
      AchCreditTransfer ach_credit_transfer,
      AchDebit ach_debit,
      AcssDebit acss_debit,
      Alipay alipay,
      num /*num|Null*/ amount,
      AuBecsDebit au_becs_debit,
      Bancontact bancontact,
      Card card,
      CardPresent card_present,
      String client_secret,
      CodeVerification code_verification,
      num created,
      String /*String|Null*/ currency,
      String customer,
      Eps eps,
      String flow,
      Giropay giropay,
      Ideal ideal,
      Klarna klarna,
      bool livemode,
      Metadata /*Metadata|Null*/ metadata,
      Multibanco multibanco,
      Owner /*Owner|Null*/ owner,
      P24 p24,
      Receiver receiver,
      Redirect redirect,
      SepaCreditTransfer sepa_credit_transfer,
      SepaDebit sepa_debit,
      Sofort sofort,
      SourceOrder source_order,
      String /*String|Null*/ statement_descriptor,
      String status,
      ThreeDSecure three_d_secure,
      String /*'ach_credit_transfer'|'ach_debit'|'acss_debit'|'alipay'|'au_becs_debit'|'bancontact'|'card'|'card_present'|'eps'|'giropay'|'ideal'|'klarna'|'multibanco'|'p24'|'sepa_credit_transfer'|'sepa_debit'|'sofort'|'three_d_secure'|'wechat'*/ type,
      String /*String|Null*/ usage,
      Wechat wechat});
}

// Module Source
@anonymous
@JS()
abstract class AchCreditTransfer {
  external String /*String|Null*/ get account_number;
  external set account_number(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_name;
  external set refund_account_holder_name(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_type;
  external set refund_account_holder_type(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_routing_number;
  external set refund_routing_number(String /*String|Null*/ v);
  external String /*String|Null*/ get routing_number;
  external set routing_number(String /*String|Null*/ v);
  external String /*String|Null*/ get swift_code;
  external set swift_code(String /*String|Null*/ v);
  external factory AchCreditTransfer(
      {String /*String|Null*/ account_number,
      String /*String|Null*/ bank_name,
      String /*String|Null*/ fingerprint,
      String /*String|Null*/ refund_account_holder_name,
      String /*String|Null*/ refund_account_holder_type,
      String /*String|Null*/ refund_routing_number,
      String /*String|Null*/ routing_number,
      String /*String|Null*/ swift_code});
}

@anonymous
@JS()
abstract class AchDebit {
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external String /*String|Null*/ get routing_number;
  external set routing_number(String /*String|Null*/ v);
  external String /*String|Null*/ get type;
  external set type(String /*String|Null*/ v);
  external factory AchDebit(
      {String /*String|Null*/ bank_name,
      String /*String|Null*/ country,
      String /*String|Null*/ fingerprint,
      String /*String|Null*/ last4,
      String /*String|Null*/ routing_number,
      String /*String|Null*/ type});
}

@anonymous
@JS()
abstract class AcssDebit {
  external String /*String|Null*/ get bank_address_city;
  external set bank_address_city(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_address_line_1;
  external set bank_address_line_1(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_address_line_2;
  external set bank_address_line_2(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_address_postal_code;
  external set bank_address_postal_code(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);
  external String /*String|Null*/ get category;
  external set category(String /*String|Null*/ v);
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external String /*String|Null*/ get routing_number;
  external set routing_number(String /*String|Null*/ v);
  external factory AcssDebit(
      {String /*String|Null*/ bank_address_city,
      String /*String|Null*/ bank_address_line_1,
      String /*String|Null*/ bank_address_line_2,
      String /*String|Null*/ bank_address_postal_code,
      String /*String|Null*/ bank_name,
      String /*String|Null*/ category,
      String /*String|Null*/ country,
      String /*String|Null*/ fingerprint,
      String /*String|Null*/ last4,
      String /*String|Null*/ routing_number});
}

@anonymous
@JS()
abstract class Alipay {
  external String /*String|Null*/ get data_string;
  external set data_string(String /*String|Null*/ v);
  external String /*String|Null*/ get native_url;
  external set native_url(String /*String|Null*/ v);
  external String /*String|Null*/ get statement_descriptor;
  external set statement_descriptor(String /*String|Null*/ v);
  external factory Alipay(
      {String /*String|Null*/ data_string,
      String /*String|Null*/ native_url,
      String /*String|Null*/ statement_descriptor});
}

@anonymous
@JS()
abstract class AuBecsDebit {
  external String /*String|Null*/ get bsb_number;
  external set bsb_number(String /*String|Null*/ v);
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external factory AuBecsDebit(
      {String /*String|Null*/ bsb_number,
      String /*String|Null*/ fingerprint,
      String /*String|Null*/ last4});
}

@anonymous
@JS()
abstract class Bancontact {
  external String /*String|Null*/ get bank_code;
  external set bank_code(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);
  external String /*String|Null*/ get bic;
  external set bic(String /*String|Null*/ v);
  external String /*String|Null*/ get iban_last4;
  external set iban_last4(String /*String|Null*/ v);
  external String /*String|Null*/ get preferred_language;
  external set preferred_language(String /*String|Null*/ v);
  external String /*String|Null*/ get statement_descriptor;
  external set statement_descriptor(String /*String|Null*/ v);
  external factory Bancontact(
      {String /*String|Null*/ bank_code,
      String /*String|Null*/ bank_name,
      String /*String|Null*/ bic,
      String /*String|Null*/ iban_last4,
      String /*String|Null*/ preferred_language,
      String /*String|Null*/ statement_descriptor});
}

@anonymous
@JS()
abstract class Card {
  external String /*String|Null*/ get address_line1_check;
  external set address_line1_check(String /*String|Null*/ v);
  external String /*String|Null*/ get address_zip_check;
  external set address_zip_check(String /*String|Null*/ v);
  external String /*String|Null*/ get brand;
  external set brand(String /*String|Null*/ v);
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);
  external String /*String|Null*/ get cvc_check;
  external set cvc_check(String /*String|Null*/ v);
  external String get description;
  external set description(String v);
  external String /*String|Null*/ get dynamic_last4;
  external set dynamic_last4(String /*String|Null*/ v);
  external num /*num|Null*/ get exp_month;
  external set exp_month(num /*num|Null*/ v);
  external num /*num|Null*/ get exp_year;
  external set exp_year(num /*num|Null*/ v);
  external String get fingerprint;
  external set fingerprint(String v);
  external String /*String|Null*/ get funding;
  external set funding(String /*String|Null*/ v);
  external String get iin;
  external set iin(String v);
  external String get issuer;
  external set issuer(String v);
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external String /*String|Null*/ get name;
  external set name(String /*String|Null*/ v);
  external String get three_d_secure;
  external set three_d_secure(String v);
  external String /*String|Null*/ get tokenization_method;
  external set tokenization_method(String /*String|Null*/ v);
  external factory Card(
      {String /*String|Null*/ address_line1_check,
      String /*String|Null*/ address_zip_check,
      String /*String|Null*/ brand,
      String /*String|Null*/ country,
      String /*String|Null*/ cvc_check,
      String description,
      String /*String|Null*/ dynamic_last4,
      num /*num|Null*/ exp_month,
      num /*num|Null*/ exp_year,
      String fingerprint,
      String /*String|Null*/ funding,
      String iin,
      String issuer,
      String /*String|Null*/ last4,
      String /*String|Null*/ name,
      String three_d_secure,
      String /*String|Null*/ tokenization_method});
}

@anonymous
@JS()
abstract class CardPresent {
  external String get application_cryptogram;
  external set application_cryptogram(String v);
  external String get application_preferred_name;
  external set application_preferred_name(String v);
  external String /*String|Null*/ get authorization_code;
  external set authorization_code(String /*String|Null*/ v);
  external String get authorization_response_code;
  external set authorization_response_code(String v);
  external String /*String|Null*/ get brand;
  external set brand(String /*String|Null*/ v);
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);
  external String get cvm_type;
  external set cvm_type(String v);
  external String /*String|Null*/ get data_type;
  external set data_type(String /*String|Null*/ v);
  external String get dedicated_file_name;
  external set dedicated_file_name(String v);
  external String get description;
  external set description(String v);
  external String get emv_auth_data;
  external set emv_auth_data(String v);
  external String /*String|Null*/ get evidence_customer_signature;
  external set evidence_customer_signature(String /*String|Null*/ v);
  external String /*String|Null*/ get evidence_transaction_certificate;
  external set evidence_transaction_certificate(String /*String|Null*/ v);
  external num /*num|Null*/ get exp_month;
  external set exp_month(num /*num|Null*/ v);
  external num /*num|Null*/ get exp_year;
  external set exp_year(num /*num|Null*/ v);
  external String get fingerprint;
  external set fingerprint(String v);
  external String /*String|Null*/ get funding;
  external set funding(String /*String|Null*/ v);
  external String get iin;
  external set iin(String v);
  external String get issuer;
  external set issuer(String v);
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external String /*String|Null*/ get pos_device_id;
  external set pos_device_id(String /*String|Null*/ v);
  external String get pos_entry_mode;
  external set pos_entry_mode(String v);
  external String /*String|Null*/ get read_method;
  external set read_method(String /*String|Null*/ v);
  external String /*String|Null*/ get reader;
  external set reader(String /*String|Null*/ v);
  external String get terminal_verification_results;
  external set terminal_verification_results(String v);
  external String get transaction_status_information;
  external set transaction_status_information(String v);
  external factory CardPresent(
      {String application_cryptogram,
      String application_preferred_name,
      String /*String|Null*/ authorization_code,
      String authorization_response_code,
      String /*String|Null*/ brand,
      String /*String|Null*/ country,
      String cvm_type,
      String /*String|Null*/ data_type,
      String dedicated_file_name,
      String description,
      String emv_auth_data,
      String /*String|Null*/ evidence_customer_signature,
      String /*String|Null*/ evidence_transaction_certificate,
      num /*num|Null*/ exp_month,
      num /*num|Null*/ exp_year,
      String fingerprint,
      String /*String|Null*/ funding,
      String iin,
      String issuer,
      String /*String|Null*/ last4,
      String /*String|Null*/ pos_device_id,
      String pos_entry_mode,
      String /*String|Null*/ read_method,
      String /*String|Null*/ reader,
      String terminal_verification_results,
      String transaction_status_information});
}

@anonymous
@JS()
abstract class CodeVerification {
  /// The number of attempts remaining to authenticate the source object with a verification code.
  external num get attempts_remaining;
  external set attempts_remaining(num v);

  /// The status of the code verification, either `pending` (awaiting verification, `attempts_remaining` should be greater than 0), `succeeded` (successful verification) or `failed` (failed verification, cannot be verified anymore as `attempts_remaining` should be 0).
  external String get status;
  external set status(String v);
  external factory CodeVerification({num attempts_remaining, String status});
}

@anonymous
@JS()
abstract class Eps {
  external String /*String|Null*/ get reference;
  external set reference(String /*String|Null*/ v);
  external String /*String|Null*/ get statement_descriptor;
  external set statement_descriptor(String /*String|Null*/ v);
  external factory Eps(
      {String /*String|Null*/ reference,
      String /*String|Null*/ statement_descriptor});
}

@anonymous
@JS()
abstract class Giropay {
  external String /*String|Null*/ get bank_code;
  external set bank_code(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);
  external String /*String|Null*/ get bic;
  external set bic(String /*String|Null*/ v);
  external String /*String|Null*/ get statement_descriptor;
  external set statement_descriptor(String /*String|Null*/ v);
  external factory Giropay(
      {String /*String|Null*/ bank_code,
      String /*String|Null*/ bank_name,
      String /*String|Null*/ bic,
      String /*String|Null*/ statement_descriptor});
}

@anonymous
@JS()
abstract class Ideal {
  external String /*String|Null*/ get bank;
  external set bank(String /*String|Null*/ v);
  external String /*String|Null*/ get bic;
  external set bic(String /*String|Null*/ v);
  external String /*String|Null*/ get iban_last4;
  external set iban_last4(String /*String|Null*/ v);
  external String /*String|Null*/ get statement_descriptor;
  external set statement_descriptor(String /*String|Null*/ v);
  external factory Ideal(
      {String /*String|Null*/ bank,
      String /*String|Null*/ bic,
      String /*String|Null*/ iban_last4,
      String /*String|Null*/ statement_descriptor});
}

@anonymous
@JS()
abstract class Klarna {
  external String get background_image_url;
  external set background_image_url(String v);
  external String /*String|Null*/ get client_token;
  external set client_token(String /*String|Null*/ v);
  external String get first_name;
  external set first_name(String v);
  external String get last_name;
  external set last_name(String v);
  external String get locale;
  external set locale(String v);
  external String get logo_url;
  external set logo_url(String v);
  external String get page_title;
  external set page_title(String v);
  external String get pay_later_asset_urls_descriptive;
  external set pay_later_asset_urls_descriptive(String v);
  external String get pay_later_asset_urls_standard;
  external set pay_later_asset_urls_standard(String v);
  external String get pay_later_name;
  external set pay_later_name(String v);
  external String get pay_later_redirect_url;
  external set pay_later_redirect_url(String v);
  external String get pay_now_asset_urls_descriptive;
  external set pay_now_asset_urls_descriptive(String v);
  external String get pay_now_asset_urls_standard;
  external set pay_now_asset_urls_standard(String v);
  external String get pay_now_name;
  external set pay_now_name(String v);
  external String get pay_now_redirect_url;
  external set pay_now_redirect_url(String v);
  external String get pay_over_time_asset_urls_descriptive;
  external set pay_over_time_asset_urls_descriptive(String v);
  external String get pay_over_time_asset_urls_standard;
  external set pay_over_time_asset_urls_standard(String v);
  external String get pay_over_time_name;
  external set pay_over_time_name(String v);
  external String get pay_over_time_redirect_url;
  external set pay_over_time_redirect_url(String v);
  external String get payment_method_categories;
  external set payment_method_categories(String v);
  external String get purchase_country;
  external set purchase_country(String v);
  external String get purchase_type;
  external set purchase_type(String v);
  external String get redirect_url;
  external set redirect_url(String v);
  external String get shipping_first_name;
  external set shipping_first_name(String v);
  external String get shipping_last_name;
  external set shipping_last_name(String v);
  external factory Klarna(
      {String background_image_url,
      String /*String|Null*/ client_token,
      String first_name,
      String last_name,
      String locale,
      String logo_url,
      String page_title,
      String pay_later_asset_urls_descriptive,
      String pay_later_asset_urls_standard,
      String pay_later_name,
      String pay_later_redirect_url,
      String pay_now_asset_urls_descriptive,
      String pay_now_asset_urls_standard,
      String pay_now_name,
      String pay_now_redirect_url,
      String pay_over_time_asset_urls_descriptive,
      String pay_over_time_asset_urls_standard,
      String pay_over_time_name,
      String pay_over_time_redirect_url,
      String payment_method_categories,
      String purchase_country,
      String purchase_type,
      String redirect_url,
      String shipping_first_name,
      String shipping_last_name});
}

@anonymous
@JS()
abstract class Multibanco {
  external String /*String|Null*/ get entity;
  external set entity(String /*String|Null*/ v);
  external String /*String|Null*/ get reference;
  external set reference(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_city;
  external set refund_account_holder_address_city(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_country;
  external set refund_account_holder_address_country(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_line1;
  external set refund_account_holder_address_line1(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_line2;
  external set refund_account_holder_address_line2(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_postal_code;
  external set refund_account_holder_address_postal_code(
      String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_state;
  external set refund_account_holder_address_state(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_name;
  external set refund_account_holder_name(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_iban;
  external set refund_iban(String /*String|Null*/ v);
  external factory Multibanco(
      {String /*String|Null*/ entity,
      String /*String|Null*/ reference,
      String /*String|Null*/ refund_account_holder_address_city,
      String /*String|Null*/ refund_account_holder_address_country,
      String /*String|Null*/ refund_account_holder_address_line1,
      String /*String|Null*/ refund_account_holder_address_line2,
      String /*String|Null*/ refund_account_holder_address_postal_code,
      String /*String|Null*/ refund_account_holder_address_state,
      String /*String|Null*/ refund_account_holder_name,
      String /*String|Null*/ refund_iban});
}

@anonymous
@JS()
abstract class Owner {
  /// Owner's address.
  external Address /*Address|Null*/ get address;
  external set address(Address /*Address|Null*/ v);

  /// Owner's email address.
  external String /*String|Null*/ get email;
  external set email(String /*String|Null*/ v);

  /// Owner's full name.
  external String /*String|Null*/ get name;
  external set name(String /*String|Null*/ v);

  /// Owner's phone number (including extension).
  external String /*String|Null*/ get phone;
  external set phone(String /*String|Null*/ v);

  /// Verified owner's address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
  external Address /*Address|Null*/ get verified_address;
  external set verified_address(Address /*Address|Null*/ v);

  /// Verified owner's email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
  external String /*String|Null*/ get verified_email;
  external set verified_email(String /*String|Null*/ v);

  /// Verified owner's full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
  external String /*String|Null*/ get verified_name;
  external set verified_name(String /*String|Null*/ v);

  /// Verified owner's phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
  external String /*String|Null*/ get verified_phone;
  external set verified_phone(String /*String|Null*/ v);
  external factory Owner(
      {Address /*Address|Null*/ address,
      String /*String|Null*/ email,
      String /*String|Null*/ name,
      String /*String|Null*/ phone,
      Address /*Address|Null*/ verified_address,
      String /*String|Null*/ verified_email,
      String /*String|Null*/ verified_name,
      String /*String|Null*/ verified_phone});
}

@anonymous
@JS()
abstract class P24 {
  external String /*String|Null*/ get reference;
  external set reference(String /*String|Null*/ v);
  external factory P24({String /*String|Null*/ reference});
}

@anonymous
@JS()
abstract class Receiver {
  /// The address of the receiver source. This is the value that should be communicated to the customer to send their funds to.
  external String /*String|Null*/ get address;
  external set address(String /*String|Null*/ v);

  /// The total amount that was charged by you. The amount charged is expressed in the source's currency.
  external num get amount_charged;
  external set amount_charged(num v);

  /// The total amount received by the receiver source. `amount_received = amount_returned + amount_charged` is true at all time. The amount received is expressed in the source's currency.
  external num get amount_received;
  external set amount_received(num v);

  /// The total amount that was returned to the customer. The amount returned is expressed in the source's currency.
  external num get amount_returned;
  external set amount_returned(num v);

  /// Type of refund attribute method, one of `email`, `manual`, or `none`.
  external String get refund_attributes_method;
  external set refund_attributes_method(String v);

  /// Type of refund attribute status, one of `missing`, `requested`, or `available`.
  external String get refund_attributes_status;
  external set refund_attributes_status(String v);
  external factory Receiver(
      {String /*String|Null*/ address,
      num amount_charged,
      num amount_received,
      num amount_returned,
      String refund_attributes_method,
      String refund_attributes_status});
}

@anonymous
@JS()
abstract class Redirect {
  /// The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out of the redirect flow), `declined` (the authentication failed or the transaction was declined), or `processing_error` (the redirect failed due to a technical error). Present only if the redirect status is `failed`.
  external String /*String|Null*/ get failure_reason;
  external set failure_reason(String /*String|Null*/ v);

  /// The URL you provide to redirect the customer to after they authenticated their payment.
  external String get return_url;
  external set return_url(String v);

  /// The status of the redirect, either `pending` (ready to be used by your customer to authenticate the transaction), `succeeded` (succesful authentication, cannot be reused) or `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be reused).
  external String get status;
  external set status(String v);

  /// The URL provided to you to redirect a customer to as part of a `redirect` authentication flow.
  external String get url;
  external set url(String v);
  external factory Redirect(
      {String /*String|Null*/ failure_reason,
      String return_url,
      String status,
      String url});
}

@anonymous
@JS()
abstract class SepaCreditTransfer {
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);
  external String /*String|Null*/ get bic;
  external set bic(String /*String|Null*/ v);
  external String /*String|Null*/ get iban;
  external set iban(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_city;
  external set refund_account_holder_address_city(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_country;
  external set refund_account_holder_address_country(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_line1;
  external set refund_account_holder_address_line1(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_line2;
  external set refund_account_holder_address_line2(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_postal_code;
  external set refund_account_holder_address_postal_code(
      String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_address_state;
  external set refund_account_holder_address_state(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_account_holder_name;
  external set refund_account_holder_name(String /*String|Null*/ v);
  external String /*String|Null*/ get refund_iban;
  external set refund_iban(String /*String|Null*/ v);
  external factory SepaCreditTransfer(
      {String /*String|Null*/ bank_name,
      String /*String|Null*/ bic,
      String /*String|Null*/ iban,
      String /*String|Null*/ refund_account_holder_address_city,
      String /*String|Null*/ refund_account_holder_address_country,
      String /*String|Null*/ refund_account_holder_address_line1,
      String /*String|Null*/ refund_account_holder_address_line2,
      String /*String|Null*/ refund_account_holder_address_postal_code,
      String /*String|Null*/ refund_account_holder_address_state,
      String /*String|Null*/ refund_account_holder_name,
      String /*String|Null*/ refund_iban});
}

@anonymous
@JS()
abstract class SepaDebit {
  external String /*String|Null*/ get bank_code;
  external set bank_code(String /*String|Null*/ v);
  external String /*String|Null*/ get branch_code;
  external set branch_code(String /*String|Null*/ v);
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external String /*String|Null*/ get mandate_reference;
  external set mandate_reference(String /*String|Null*/ v);
  external String /*String|Null*/ get mandate_url;
  external set mandate_url(String /*String|Null*/ v);
  external factory SepaDebit(
      {String /*String|Null*/ bank_code,
      String /*String|Null*/ branch_code,
      String /*String|Null*/ country,
      String /*String|Null*/ fingerprint,
      String /*String|Null*/ last4,
      String /*String|Null*/ mandate_reference,
      String /*String|Null*/ mandate_url});
}

@anonymous
@JS()
abstract class Sofort {
  external String /*String|Null*/ get bank_code;
  external set bank_code(String /*String|Null*/ v);
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);
  external String /*String|Null*/ get bic;
  external set bic(String /*String|Null*/ v);
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);
  external String /*String|Null*/ get iban_last4;
  external set iban_last4(String /*String|Null*/ v);
  external String /*String|Null*/ get preferred_language;
  external set preferred_language(String /*String|Null*/ v);
  external String /*String|Null*/ get statement_descriptor;
  external set statement_descriptor(String /*String|Null*/ v);
  external factory Sofort(
      {String /*String|Null*/ bank_code,
      String /*String|Null*/ bank_name,
      String /*String|Null*/ bic,
      String /*String|Null*/ country,
      String /*String|Null*/ iban_last4,
      String /*String|Null*/ preferred_language,
      String /*String|Null*/ statement_descriptor});
}

@anonymous
@JS()
abstract class SourceOrder {
  /// A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
  external num get amount;
  external set amount(num v);

  /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
  external String get currency;
  external set currency(String v);

  /// The email address of the customer placing the order.
  external String get email;
  external set email(String v);

  /// List of items constituting the order.
  external List<Item> /*List<Item>|Null*/ get items;
  external set items(List<Item> /*List<Item>|Null*/ v);
  external Shipping get shipping;
  external set shipping(Shipping v);
  external factory SourceOrder(
      {num amount,
      String currency,
      String email,
      List<Item> /*List<Item>|Null*/ items,
      Shipping shipping});
}

// Module SourceOrder
@anonymous
@JS()
abstract class Item {
  /// The amount (price) for this order item.
  external num /*num|Null*/ get amount;
  external set amount(num /*num|Null*/ v);

  /// This currency of this order item. Required when `amount` is present.
  external String /*String|Null*/ get currency;
  external set currency(String /*String|Null*/ v);

  /// Human-readable description for this order item.
  external String /*String|Null*/ get description;
  external set description(String /*String|Null*/ v);

  /// The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
  external num get quantity;
  external set quantity(num v);

  /// The type of this order item. Must be `sku`, `tax`, or `shipping`.
  external String /*String|Null*/ get type;
  external set type(String /*String|Null*/ v);
  external factory Item(
      {num /*num|Null*/ amount,
      String /*String|Null*/ currency,
      String /*String|Null*/ description,
      num quantity,
      String /*String|Null*/ type});
}

@anonymous
@JS()
abstract class Shipping {
  external Address get address;
  external set address(Address v);

  /// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
  external String /*String|Null*/ get carrier;
  external set carrier(String /*String|Null*/ v);

  /// Recipient name.
  external String /*String|Null*/ get name;
  external set name(String /*String|Null*/ v);

  /// Recipient phone (including extension).
  external String /*String|Null*/ get phone;
  external set phone(String /*String|Null*/ v);

  /// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
  external String /*String|Null*/ get tracking_number;
  external set tracking_number(String /*String|Null*/ v);
  external factory Shipping(
      {Address address,
      String /*String|Null*/ carrier,
      String /*String|Null*/ name,
      String /*String|Null*/ phone,
      String /*String|Null*/ tracking_number});
}

// End module SourceOrder
@anonymous
@JS()
abstract class ThreeDSecure {
  external String /*String|Null*/ get address_line1_check;
  external set address_line1_check(String /*String|Null*/ v);
  external String /*String|Null*/ get address_zip_check;
  external set address_zip_check(String /*String|Null*/ v);
  external bool /*bool|Null*/ get authenticated;
  external set authenticated(bool /*bool|Null*/ v);
  external String /*String|Null*/ get brand;
  external set brand(String /*String|Null*/ v);
  external String /*String|Null*/ get card;
  external set card(String /*String|Null*/ v);
  external String /*String|Null*/ get country;
  external set country(String /*String|Null*/ v);
  external String /*String|Null*/ get customer;
  external set customer(String /*String|Null*/ v);
  external String /*String|Null*/ get cvc_check;
  external set cvc_check(String /*String|Null*/ v);
  external String get description;
  external set description(String v);
  external String /*String|Null*/ get dynamic_last4;
  external set dynamic_last4(String /*String|Null*/ v);
  external num /*num|Null*/ get exp_month;
  external set exp_month(num /*num|Null*/ v);
  external num /*num|Null*/ get exp_year;
  external set exp_year(num /*num|Null*/ v);
  external String get fingerprint;
  external set fingerprint(String v);
  external String /*String|Null*/ get funding;
  external set funding(String /*String|Null*/ v);
  external String get iin;
  external set iin(String v);
  external String get issuer;
  external set issuer(String v);
  external String /*String|Null*/ get last4;
  external set last4(String /*String|Null*/ v);
  external String /*String|Null*/ get name;
  external set name(String /*String|Null*/ v);
  external String get three_d_secure;
  external set three_d_secure(String v);
  external String /*String|Null*/ get tokenization_method;
  external set tokenization_method(String /*String|Null*/ v);
  external factory ThreeDSecure(
      {String /*String|Null*/ address_line1_check,
      String /*String|Null*/ address_zip_check,
      bool /*bool|Null*/ authenticated,
      String /*String|Null*/ brand,
      String /*String|Null*/ card,
      String /*String|Null*/ country,
      String /*String|Null*/ customer,
      String /*String|Null*/ cvc_check,
      String description,
      String /*String|Null*/ dynamic_last4,
      num /*num|Null*/ exp_month,
      num /*num|Null*/ exp_year,
      String fingerprint,
      String /*String|Null*/ funding,
      String iin,
      String issuer,
      String /*String|Null*/ last4,
      String /*String|Null*/ name,
      String three_d_secure,
      String /*String|Null*/ tokenization_method});
}

/*type Type =
      | 'ach_credit_transfer'
      | 'ach_debit'
      | 'acss_debit'
      | 'alipay'
      | 'au_becs_debit'
      | 'bancontact'
      | 'card'
      | 'card_present'
      | 'eps'
      | 'giropay'
      | 'ideal'
      | 'klarna'
      | 'multibanco'
      | 'p24'
      | 'sepa_credit_transfer'
      | 'sepa_debit'
      | 'sofort'
      | 'three_d_secure'
      | 'wechat';
*/
@anonymous
@JS()
abstract class Wechat {
  external String get prepay_id;
  external set prepay_id(String v);
  external String /*String|Null*/ get qr_code_url;
  external set qr_code_url(String /*String|Null*/ v);
  external String get statement_descriptor;
  external set statement_descriptor(String v);
  external factory Wechat(
      {String prepay_id,
      String /*String|Null*/ qr_code_url,
      String statement_descriptor});
}

// End module Source
@anonymous
@JS()
abstract class SourceCreateParams {
  /// Amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources. Not supported for `receiver` type sources, where charge amount may not be specified until funds land.
  external num get amount;
  external set amount(num v);

  /// Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready.
  external String get currency;
  external set currency(String v);

  /// The `Customer` to whom the original source is attached to. Must be set when the original source is not a `Source` (e.g., `Card`).
  external String get customer;
  external set customer(String v);

  /// Specifies which fields in the response should be expanded.
  external List<String> get expand;
  external set expand(List<String> v);

  /// The authentication `flow` of the source to create. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`. It is generally inferred unless a type supports multiple flows.
  external String /*'code_verification'|'none'|'receiver'|'redirect'*/ get flow;
  external set flow(
      String /*'code_verification'|'none'|'receiver'|'redirect'*/ v);

  /// Information about a mandate possibility attached to a source object (generally for bank debits) as well as its acceptance status.
  external Mandate get mandate;
  external set mandate(Mandate v);
  external MetadataParam get metadata;
  external set metadata(MetadataParam v);

  /// The source to share.
  external String get original_source;
  external set original_source(String v);

  /// Information about the owner of the payment instrument that may be used or required by particular source types.
  external SourceCreateParams_Owner get owner;
  external set owner(SourceCreateParams_Owner v);

  /// Optional parameters for the receiver flow. Can be set only if the source is a receiver (`flow` is `receiver`).
  external SourceCreateParams_Receiver get receiver;
  external set receiver(SourceCreateParams_Receiver v);

  /// Parameters required for the redirect flow. Required if the source is authenticated by a redirect (`flow` is `redirect`).
  external SourceCreateParams_Redirect get redirect;
  external set redirect(SourceCreateParams_Redirect v);

  /// Information about the items and shipping associated with the source. Required for transactional credit (for example Klarna) sources before you can charge it.
  external SourceCreateParams_SourceOrder get source_order;
  external set source_order(SourceCreateParams_SourceOrder v);

  /// An arbitrary string to be displayed on your customer's statement. As an example, if your website is `RunClub` and the item you're charging for is a race ticket, you may want to specify a `statement_descriptor` of `RunClub 5K race ticket.` While many payment types will display this information, some may not display it at all.
  external String get statement_descriptor;
  external set statement_descriptor(String v);

  /// An optional token used to create the source. When passed, token properties will override source parameters.
  external String get token;
  external set token(String v);

  /// The `type` of the source to create. Required unless `customer` and `original_source` are specified (see the [Cloning card Sources](https://stripe.com/docs/sources/connect#cloning-card-sources) guide)
  external String get type;
  external set type(String v);
  external String /*'reusable'|'single_use'*/ get usage;
  external set usage(String /*'reusable'|'single_use'*/ v);
  external factory SourceCreateParams(
      {num amount,
      String currency,
      String customer,
      List<String> expand,
      String /*'code_verification'|'none'|'receiver'|'redirect'*/ flow,
      Mandate mandate,
      MetadataParam metadata,
      String original_source,
      SourceCreateParams_Owner owner,
      SourceCreateParams_Receiver receiver,
      SourceCreateParams_Redirect redirect,
      SourceCreateParams_SourceOrder source_order,
      String statement_descriptor,
      String token,
      String type,
      String /*'reusable'|'single_use'*/ usage});
}

// Module SourceCreateParams
/*type Flow = 'code_verification' | 'none' | 'receiver' | 'redirect';*/
@anonymous
@JS()
abstract class Mandate {
  /// The parameters required to notify Stripe of a mandate acceptance or refusal by the customer.
  external Acceptance get acceptance;
  external set acceptance(Acceptance v);

  /// The amount specified by the mandate. (Leave null for a mandate covering all amounts)
  external dynamic /*num|''*/ get amount;
  external set amount(dynamic /*num|''*/ v);

  /// The currency specified by the mandate. (Must match `currency` of the source)
  external String get currency;
  external set currency(String v);

  /// The interval of debits permitted by the mandate. Either `one_time` (just permitting a single debit), `scheduled` (with debits on an agreed schedule or for clearly-defined events), or `variable`(for debits with any frequency)
  external String /*'one_time'|'scheduled'|'variable'*/ get interval;
  external set interval(String /*'one_time'|'scheduled'|'variable'*/ v);

  /// The method Stripe should use to notify the customer of upcoming debit instructions and/or mandate confirmation as required by the underlying debit network. Either `email` (an email is sent directly to the customer), `manual` (a `source.mandate_notification` event is sent to your webhooks endpoint and you should handle the notification) or `none` (the underlying debit network does not require any notification).
  external String /*'deprecated_none'|'email'|'manual'|'none'|'stripe_email'*/ get notification_method;
  external set notification_method(
      String /*'deprecated_none'|'email'|'manual'|'none'|'stripe_email'*/ v);
  external factory Mandate(
      {Acceptance acceptance,
      dynamic /*num|''*/ amount,
      String currency,
      String /*'one_time'|'scheduled'|'variable'*/ interval,
      String /*'deprecated_none'|'email'|'manual'|'none'|'stripe_email'*/ notification_method});
}

// Module Mandate
@anonymous
@JS()
abstract class Acceptance {
  /// The Unix timestamp (in seconds) when the mandate was accepted or refused by the customer.
  external num get date;
  external set date(num v);

  /// The IP address from which the mandate was accepted or refused by the customer.
  external String get ip;
  external set ip(String v);

  /// The parameters required to store a mandate accepted offline. Should only be set if `mandate[type]` is `offline`
  external Offline get offline;
  external set offline(Offline v);

  /// The parameters required to store a mandate accepted online. Should only be set if `mandate[type]` is `online`
  external Online get online;
  external set online(Online v);

  /// The status of the mandate acceptance. Either `accepted` (the mandate was accepted) or `refused` (the mandate was refused).
  external String /*'accepted'|'pending'|'refused'|'revoked'*/ get status;
  external set status(String /*'accepted'|'pending'|'refused'|'revoked'*/ v);

  /// The type of acceptance information included with the mandate. Either `online` or `offline`
  external String /*'offline'|'online'*/ get type;
  external set type(String /*'offline'|'online'*/ v);

  /// The user agent of the browser from which the mandate was accepted or refused by the customer.
  external String get user_agent;
  external set user_agent(String v);
  external factory Acceptance(
      {num date,
      String ip,
      Offline offline,
      Online online,
      String /*'accepted'|'pending'|'refused'|'revoked'*/ status,
      String /*'offline'|'online'*/ type,
      String user_agent});
}

// Module Acceptance
@anonymous
@JS()
abstract class Offline {
  /// An email to contact you with if a copy of the mandate is requested, required if `type` is `offline`.
  external String get contact_email;
  external set contact_email(String v);
  external factory Offline({String contact_email});
}

@anonymous
@JS()
abstract class Online {
  /// The Unix timestamp (in seconds) when the mandate was accepted or refused by the customer.
  external num get date;
  external set date(num v);

  /// The IP address from which the mandate was accepted or refused by the customer.
  external String get ip;
  external set ip(String v);

  /// The user agent of the browser from which the mandate was accepted or refused by the customer.
  external String get user_agent;
  external set user_agent(String v);
  external factory Online({num date, String ip, String user_agent});
}

/*type Status = 'accepted' | 'pending' | 'refused' | 'revoked';*/
/*type Type = 'offline' | 'online';*/

// End module Acceptance
/*type Interval = 'one_time' | 'scheduled' | 'variable';*/
/*type NotificationMethod =
        | 'deprecated_none'
        | 'email'
        | 'manual'
        | 'none'
        | 'stripe_email';
*/

// End module Mandate
@anonymous
@JS()
abstract class SourceCreateParams_Owner {
  /// Owner's address.
  external Address get address;
  external set address(Address v);

  /// Owner's email address.
  external String get email;
  external set email(String v);

  /// Owner's full name.
  external String get name;
  external set name(String v);

  /// Owner's phone number.
  external String get phone;
  external set phone(String v);
  external factory SourceCreateParams_Owner(
      {Address address, String email, String name, String phone});
}

// Module Owner
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

// End module Owner
@anonymous
@JS()
abstract class SourceCreateParams_Receiver {
  /// The method Stripe should use to request information needed to process a refund or mispayment. Either `email` (an email is sent directly to the customer) or `manual` (a `source.refund_attributes_required` event is sent to your webhooks endpoint). Refer to each payment method's documentation to learn which refund attributes may be required.
  external String /*'email'|'manual'|'none'*/ get refund_attributes_method;
  external set refund_attributes_method(String /*'email'|'manual'|'none'*/ v);
  external factory SourceCreateParams_Receiver(
      {String /*'email'|'manual'|'none'*/ refund_attributes_method});
}

// Module Receiver
/*type RefundAttributesMethod = 'email' | 'manual' | 'none';*/

// End module Receiver
@anonymous
@JS()
abstract class SourceCreateParams_Redirect {
  /// The URL you provide to redirect the customer back to you after they authenticated their payment. It can use your application URI scheme in the context of a mobile application.
  external String get return_url;
  external set return_url(String v);
  external factory SourceCreateParams_Redirect({String return_url});
}

@anonymous
@JS()
abstract class SourceCreateParams_SourceOrder {
  /// List of items constituting the order.
  external List<SourceOrder_Item> get items;
  external set items(List<SourceOrder_Item> v);

  /// Shipping address for the order. Required if any of the SKUs are for products that have `shippable` set to true.
  external SourceOrder_Shipping get shipping;
  external set shipping(SourceOrder_Shipping v);
  external factory SourceCreateParams_SourceOrder(
      {List<SourceOrder_Item> items, SourceOrder_Shipping shipping});
}

// Module SourceOrder
@anonymous
@JS()
abstract class SourceOrder_Item {
  external num get amount;
  external set amount(num v);
  external String get currency;
  external set currency(String v);
  external String get description;
  external set description(String v);

  /// The ID of the SKU being ordered.
  external String get parent;
  external set parent(String v);

  /// The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
  external num get quantity;
  external set quantity(num v);
  external String /*'discount'|'shipping'|'sku'|'tax'*/ get type;
  external set type(String /*'discount'|'shipping'|'sku'|'tax'*/ v);
  external factory SourceOrder_Item(
      {num amount,
      String currency,
      String description,
      String parent,
      num quantity,
      String /*'discount'|'shipping'|'sku'|'tax'*/ type});
}

// Module Item
/*type Type = 'discount' | 'shipping' | 'sku' | 'tax';*/

// End module Item
@anonymous
@JS()
abstract class SourceOrder_Shipping {
  /// Shipping address.
  external AddressParam get address;
  external set address(AddressParam v);

  /// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
  external String get carrier;
  external set carrier(String v);

  /// Recipient name.
  external String get name;
  external set name(String v);

  /// Recipient phone (including extension).
  external String get phone;
  external set phone(String v);

  /// The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
  external String get tracking_number;
  external set tracking_number(String v);
  external factory SourceOrder_Shipping(
      {AddressParam address,
      String carrier,
      String name,
      String phone,
      String tracking_number});
}

// End module SourceOrder
/*type Usage = 'reusable' | 'single_use';*/

// End module SourceCreateParams

// End module @stripe/stripe-js
