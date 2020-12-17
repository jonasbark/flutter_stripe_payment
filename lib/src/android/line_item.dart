import 'package:json_annotation/json_annotation.dart';

part 'line_item.g.dart';

@JsonSerializable()
class LineItem {
  @JsonKey(name: 'currency_code')
  final String currencyCode;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'quantity')
  final String quantity;

  @JsonKey(name: 'total_price')
  final String totalPrice;

  @JsonKey(name: 'unit_price')
  final String unitPrice;

  const LineItem({
    this.currencyCode,
    this.description,
    this.quantity,
    this.totalPrice,
    this.unitPrice,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) =>
      _$LineItemFromJson(json);
  Map<String, dynamic> toJson() => _$LineItemToJson(this);
}
