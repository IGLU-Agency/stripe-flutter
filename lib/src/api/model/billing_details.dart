import 'package:json_annotation/json_annotation.dart';
import 'package:stripeflutter/src/api/model/address.dart';

part 'billing_details.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class BillingDetails {
  Address address;
  String email;
  String name;
  String phone;

  BillingDetails({this.address, this.email, this.name, this.phone});
  factory BillingDetails.fromJson(Map<String, dynamic> json) =>
      _$BillingDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BillingDetailsToJson(this);
}
