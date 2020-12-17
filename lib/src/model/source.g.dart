// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map json) {
  return Source(
    object: json['object'] as String,
    receiver: json['receiver'] == null
        ? null
        : Receiver.fromJson(json['receiver'] as Map),
    achCreditTransfer: json['achCreditTransfer'] == null
        ? null
        : AchCreditTransfer.fromJson(json['achCreditTransfer'] as Map),
    amount: json['amount'] as num,
    clientSecret: json['clientSecret'] as String,
    codeVerification: json['codeVerification'] == null
        ? null
        : CodeVerification.fromJson(json['codeVerification'] as Map),
    created: json['created'] as num,
    currency: json['currency'] as String,
    flow: _$enumDecodeNullable(_$SourceFlowEnumMap, json['flow']),
    sourceId: json['sourceId'] as String,
    livemode: json['livemode'] as bool,
    metadata: json['metadata'] as Map,
    owner: json['owner'] == null ? null : Owner.fromJson(json['owner'] as Map),
    statementDescriptor: json['statementDescriptor'] as String,
    status: _$enumDecodeNullable(_$SourceStatusEnumMap, json['status']),
    type: json['type'] as String,
    usage: _$enumDecodeNullable(_$SourceUsageEnumMap, json['usage']),
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.object);
  writeNotNull('receiver', instance.receiver?.toJson());
  writeNotNull('achCreditTransfer', instance.achCreditTransfer?.toJson());
  writeNotNull('amount', instance.amount);
  writeNotNull('clientSecret', instance.clientSecret);
  writeNotNull('codeVerification', instance.codeVerification?.toJson());
  writeNotNull('created', instance.created);
  writeNotNull('currency', instance.currency);
  writeNotNull('flow', _$SourceFlowEnumMap[instance.flow]);
  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('livemode', instance.livemode);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull('statementDescriptor', instance.statementDescriptor);
  writeNotNull('status', _$SourceStatusEnumMap[instance.status]);
  writeNotNull('type', instance.type);
  writeNotNull('usage', _$SourceUsageEnumMap[instance.usage]);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SourceFlowEnumMap = {
  SourceFlow.redirect: 'redirect',
  SourceFlow.receiver: 'receiver',
  SourceFlow.codeVerification: 'codeVerification',
  SourceFlow.none: 'none',
  SourceFlow.unknown: 'unknown',
};

const _$SourceStatusEnumMap = {
  SourceStatus.canceled: 'canceled',
  SourceStatus.chargeable: 'chargeable',
  SourceStatus.consumed: 'consumed',
  SourceStatus.failed: 'failed',
  SourceStatus.pending: 'pending',
  SourceStatus.unknown: 'unknown',
};

const _$SourceUsageEnumMap = {
  SourceUsage.reusable: 'reusable',
  SourceUsage.singleUse: 'singleUse',
  SourceUsage.unknown: 'unknown',
};
