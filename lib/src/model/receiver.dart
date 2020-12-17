import 'package:json_annotation/json_annotation.dart';

part 'receiver.g.dart';

@JsonSerializable()
class Receiver {
  final String address;
  final int amountCharged;
  final int amountReceived;
  final int amountReturned;
  final String refundAttributesMethod;
  final String refundAttributesStatus;

  const Receiver({
    this.address,
    this.amountCharged,
    this.amountReceived,
    this.amountReturned,
    this.refundAttributesMethod,
    this.refundAttributesStatus,
  });

  factory Receiver.fromJson(Map json) => _$ReceiverFromJson(json);
  Map toJson() => _$ReceiverToJson(this);
}
