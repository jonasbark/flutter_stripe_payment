@JS()
library stripe_js.token_and_sources;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

// Module @stripe/stripe-js
/// An object containing the unique ID and client secret for a `Source`.
/// You can use a `Source` object created with `stripe.createSource` as the argument to `stripe.retrieveSource`, as every `Source` object has both `id` and `client_secret` keys.
@anonymous
@JS()
abstract class RetrieveSourceParam {
  /// Unique identifier of the `Source`.
  external String get id;
  external set id(String v);

  /// A secret available to the web client that created the `Source`, for purposes of retrieving the `Source` later from that same client.
  external String get client_secret;
  external set client_secret(String v);
  external factory RetrieveSourceParam({String id, String client_secret});
}

/// An object containing additional payment information you might have collected.
/// Although these fields are optional, we highly recommend collecting name and address.
/// This information can be used to perform a number of verifications, such as CVC, ZIP, and address verification.
/// Radar includes built-in rules that can block payments where the ZIP or CVC verifications with the cardholder’s bank failed.
@anonymous
@JS()
abstract class CreateTokenCardData {
  /// @recommended
  external String get name;
  external set name(String v);
  external String get address_line1;
  external set address_line1(String v);
  external String get address_line2;
  external set address_line2(String v);
  external String get address_city;
  external set address_city(String v);
  external String get address_state;
  external set address_state(String v);
  external String get address_zip;
  external set address_zip(String v);

  /// A two character country code (for example, `US`).
  /// @recommended
  external String get address_country;
  external set address_country(String v);

  /// Required in order to [add the card to a Connect account](https://stripe.com/docs/connect/payouts#bank-accounts) (in all other cases, this parameter is not used).
  /// Currently, the only supported currency for debit card payouts is `usd`.
  external String get currency;
  external set currency(String v);
  external factory CreateTokenCardData(
      {String name,
      String address_line1,
      String address_line2,
      String address_city,
      String address_state,
      String address_zip,
      String address_country,
      String currency});
}

@anonymous
@JS()
abstract class CreateTokenIbanData {
  /// Three character currency code (e.g., `eur`).
  external String get currency;
  external set currency(String v);
  external String get account_holder_name;
  external set account_holder_name(String v);
  external String get account_holder_type;
  external set account_holder_type(String v);
  external factory CreateTokenIbanData(
      {String currency,
      String account_holder_name,
      String account_holder_type});
}

@anonymous
@JS()
abstract class CreateTokenPiiData {
  external String get personal_id_number;
  external set personal_id_number(String v);
  external factory CreateTokenPiiData({String personal_id_number});
}

@anonymous
@JS()
abstract class CreateTokenBankAccountData {
  external String get country;
  external set country(String v);
  external String get currency;
  external set currency(String v);
  external String get routing_number;
  external set routing_number(String v);
  external String get account_number;
  external set account_number(String v);
  external String get account_holder_name;
  external set account_holder_name(String v);
  external String get account_holder_type;
  external set account_holder_type(String v);
  external factory CreateTokenBankAccountData(
      {String country,
      String currency,
      String routing_number,
      String account_number,
      String account_holder_name,
      String account_holder_type});
}

/// A required object containing the `type` of `Source` you want to create, and any additional payment information that you have collected.
/// See the [Sources API](https://stripe.com/docs/api#create_source) reference for details.
/// You cannot pass raw card information to `stripe.createSource(sourceData)`.
/// Instead, you must gather card information in an `Element` and use `stripe.createSource(element, sourceData)`.
/// You can also pass an existing card token to convert it into a `Source` object.
/*type CreateSourceData = SourceCreateParams;*/

// End module @stripe/stripe-js
@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
