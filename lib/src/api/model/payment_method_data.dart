import 'package:json_annotation/json_annotation.dart';
import 'package:stripeflutter/src/api/model/billing_details.dart';
import 'package:stripeflutter/src/api/model/payment_method.dart';

part 'payment_method_data.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class PaymentMethodData {
  PaymentMethodType type;
  BillingDetails billingDetails;
  Map<String, dynamic> metadata;
  AuBecsDebitMethod auBecsDebit;
  CardMethod card;
  FpxMethod fpx;
  IdealMethod ideal;
  SepaDebitMethod sepaDebit;

  PaymentMethodData(
      {this.billingDetails,
      this.metadata,
      this.type,
      this.auBecsDebit,
      this.card,
      this.fpx,
      this.ideal,
      this.sepaDebit});
  factory PaymentMethodData.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDataFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentMethodDataToJson(this);
}

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class AuBecsDebitMethod {
  String accountNumber;
  String bsbNumber;

  AuBecsDebitMethod({this.accountNumber, this.bsbNumber});
  factory AuBecsDebitMethod.fromJson(Map<String, dynamic> json) =>
      _$AuBecsDebitMethodFromJson(json);
  Map<String, dynamic> toJson() => _$AuBecsDebitMethodToJson(this);
}

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class CardMethod {
  int expMonth;
  int expYear;
  String number;
  String cvc;

  CardMethod({this.cvc, this.expMonth, this.expYear, this.number});
  factory CardMethod.fromJson(Map<String, dynamic> json) =>
      _$CardMethodFromJson(json);
  Map<String, dynamic> toJson() => _$CardMethodToJson(this);
}

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class FpxMethod {
  String bank;
  FpxMethod({this.bank});

  factory FpxMethod.fromJson(Map<String, dynamic> json) =>
      _$FpxMethodFromJson(json);
  Map<String, dynamic> toJson() => _$FpxMethodToJson(this);
}

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class IdealMethod {
  String bank;
  IdealMethod({this.bank});

  factory IdealMethod.fromJson(Map<String, dynamic> json) =>
      _$IdealMethodFromJson(json);
  Map<String, dynamic> toJson() => _$IdealMethodToJson(this);
}

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class SepaDebitMethod {
  String iban;
  SepaDebitMethod({this.iban});

  factory SepaDebitMethod.fromJson(Map<String, dynamic> json) =>
      _$SepaDebitMethodFromJson(json);
  Map<String, dynamic> toJson() => _$SepaDebitMethodToJson(this);
}
