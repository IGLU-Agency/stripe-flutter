import 'package:json_annotation/json_annotation.dart';
import 'package:stripeflutter/src/api/model/payment_method.dart';
import 'package:stripeflutter/src/api/model/shipping_address.dart';
import 'package:stripeflutter/src/api/model/shipping_option.dart';
import 'package:stripeflutter/src/api/model/source.dart';

import 'token.dart';

part 'payment_response.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class PaymentResponse {
  Token token;
  PaymentMethod paymentMethod;
  Source source;
  String payerName;
  String payerEmail;
  String payerPhone;
  ShippingAddress shippingAddress;
  ShippingOption shippingOption;
  String methodName;

  PaymentResponse({this.token});
  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}
