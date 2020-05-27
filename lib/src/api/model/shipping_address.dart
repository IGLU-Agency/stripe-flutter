import 'package:json_annotation/json_annotation.dart';

part 'shipping_address.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class ShippingAddress {
  String country;
  List<String> addressLine;
  String region;
  String city;
  String postalCode;
  String recipient;
  String phone;
  String sortingCode;
  String dependendLocality;

  ShippingAddress(
      {this.addressLine,
      this.city,
      this.country,
      this.dependendLocality,
      this.phone,
      this.postalCode,
      this.recipient,
      this.region,
      this.sortingCode});
  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);
  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
