@JS()
library api.BankAccounts;

import "package:js/js.dart";

// Module @stripe/stripe-js
/// The BankAccount object.
@anonymous
@JS()
abstract class BankAccount {
  /// Unique identifier for the object.
  external String get id;
  external set id(String v);

  /// String representing the object's type. Objects of the same type share the same value.
  external String /*'bank_account'*/ get object;
  external set object(String /*'bank_account'*/ v);

  /// The name of the person or business that owns the bank account.
  external String /*String|Null*/ get account_holder_name;
  external set account_holder_name(String /*String|Null*/ v);

  /// The type of entity that holds the account. This can be either `individual` or `company`.
  external String /*String|Null*/ get account_holder_type;
  external set account_holder_type(String /*String|Null*/ v);

  /// Name of the bank associated with the routing number (e.g., `WELLS FARGO`).
  external String /*String|Null*/ get bank_name;
  external set bank_name(String /*String|Null*/ v);

  /// Two-letter ISO code representing the country the bank account is located in.
  external String get country;
  external set country(String v);

  /// Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
  external String get currency;
  external set currency(String v);

  /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
  external String /*String|Null*/ get fingerprint;
  external set fingerprint(String /*String|Null*/ v);

  /// The last four digits of the bank account number.
  external String get last4;
  external set last4(String v);

  /// The routing transit number for the bank account.
  external String /*String|Null*/ get routing_number;
  external set routing_number(String /*String|Null*/ v);

  /// For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn't enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If a transfer sent to this bank account fails, we'll set the status to `errored` and will not continue to send transfers until the bank details are updated.
  /// For external accounts, possible values are `new` and `errored`. Validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated.
  external String get status;
  external set status(String v);
  external factory BankAccount(
      {String id,
      String /*'bank_account'*/ object,
      String /*String|Null*/ account_holder_name,
      String /*String|Null*/ account_holder_type,
      String /*String|Null*/ bank_name,
      String country,
      String currency,
      String /*String|Null*/ fingerprint,
      String last4,
      String /*String|Null*/ routing_number,
      String status});
}

// End module @stripe/stripe-js
