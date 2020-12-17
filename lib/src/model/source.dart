import 'package:json_annotation/json_annotation.dart';

import 'ach_credit_transfer.dart';
import 'code_verification.dart';
import 'owner.dart';
import 'receiver.dart';

part 'source.g.dart';

enum SourceFlow {
  @JsonValue(0)
  redirect,

  @JsonValue(1)
  receiver,

  @JsonValue(2)
  codeVerification,

  @JsonValue(3)
  none,
}

enum SourceStatus {
  @JsonValue(0)
  canceled,

  @JsonValue(1)
  chargeable,

  @JsonValue(2)
  consumed,

  @JsonValue(3)
  failed,

  @JsonValue(4)
  pending,
}

enum SourceUsage {
  @JsonValue(0)
  reusable,

  @JsonValue(1)
  singleUse,
}

@JsonSerializable()
class Source {
  final String object;
  final Receiver receiver;
  final AchCreditTransfer achCreditTransfer;
  final num amount;
  final String clientSecret;
  final CodeVerification codeVerification;
  final num created;
  final String currency;
  final SourceFlow flow;
  final String sourceId;
  final bool livemode;
  final Map<dynamic, dynamic> metadata;
  final Owner owner;
  final String statementDescriptor;
  final SourceStatus status;
  final String type;
  final SourceUsage usage;

  const Source({
    this.object,
    this.receiver,
    this.achCreditTransfer,
    this.amount,
    this.clientSecret,
    this.codeVerification,
    this.created,
    this.currency,
    this.flow,
    this.sourceId,
    this.livemode,
    this.metadata,
    this.owner,
    this.statementDescriptor,
    this.status,
    this.type,
    this.usage,
  });

  factory Source.fromJson(Map json) => _$SourceFromJson(json);
  Map toJson() => _$SourceToJson(this);
}
