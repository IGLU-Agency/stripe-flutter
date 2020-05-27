import 'package:json_annotation/json_annotation.dart';
import 'package:stripeflutter/src/api/model/au_becs_debit.dart';
import 'package:stripeflutter/src/api/model/billing_details.dart';
import 'package:stripeflutter/src/api/model/card.dart';


part 'payment_method.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class PaymentMethod {
  
  String id;
  BillingDetails billingDetails;
  dynamic customer;
  Map<String, dynamic> metadata;
  PaymentMethodType type;
  String object;
  AuBecsDebit auBecsDebit;
  Card card;
  dynamic cardPresent;
  int created;
  dynamic fpx;
  dynamic ideal;
  bool livemode;
  dynamic sepaDebit;

  PaymentMethod({this.id, this.auBecsDebit, this.billingDetails, this.customer, this.metadata, this.object, this.type});
  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}



enum PaymentMethodType {
  @JsonValue("au_becs_debit")
  auBecsDebit, 
  @JsonValue("card")
  card, 
  @JsonValue("fpx")
  fpx, 
  @JsonValue("ideal")
  ideal,
  @JsonValue("sepa_debit")
  sepaDebit
}