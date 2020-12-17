import 'package:json_annotation/json_annotation.dart';

import 'prefilled_information.dart';

part 'card_form_payment_request.g.dart';

@JsonSerializable()
class CardFormPaymentRequest {
  PrefilledInformation prefilledInformation;
  String requiredBillingAddressFields;

  CardFormPaymentRequest({
    this.prefilledInformation,
    this.requiredBillingAddressFields,
  });

  factory CardFormPaymentRequest.fromJson(Map json) =>
      _$CardFormPaymentRequestFromJson(json);
  Map toJson() => _$CardFormPaymentRequestToJson(this);
}
