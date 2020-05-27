import 'package:json_annotation/json_annotation.dart';

part 'shipping_option.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class ShippingOption {
  String id;
  String label;
  bool detail;
  double amount;

  ShippingOption({this.id, this.amount, this.detail, this.label});
  factory ShippingOption.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingOptionToJson(this);
}
