// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receiver _$ReceiverFromJson(Map json) {
  return Receiver(
    address: json['address'] as String,
    amountCharged: json['amountCharged'] as int,
    amountReceived: json['amountReceived'] as int,
    amountReturned: json['amountReturned'] as int,
    refundAttributesMethod: json['refundAttributesMethod'] as String,
    refundAttributesStatus: json['refundAttributesStatus'] as String,
  );
}

Map<String, dynamic> _$ReceiverToJson(Receiver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  writeNotNull('amountCharged', instance.amountCharged);
  writeNotNull('amountReceived', instance.amountReceived);
  writeNotNull('amountReturned', instance.amountReturned);
  writeNotNull('refundAttributesMethod', instance.refundAttributesMethod);
  writeNotNull('refundAttributesStatus', instance.refundAttributesStatus);
  return val;
}
