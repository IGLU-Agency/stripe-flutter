import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/card.dart';

part 'wallet.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Wallet {
  dynamic amexExpressCheckout;
  dynamic applePay;
  String dynamicLast4;
  dynamic googlePay;
  dynamic masterpass;
  dynamic samsungPay;
  TokenizationMethod type;
  dynamic visaCheckout;

  Wallet(
      {this.amexExpressCheckout,
      this.applePay,
      this.dynamicLast4,
      this.googlePay,
      this.masterpass,
      this.samsungPay,
      this.type,
      this.visaCheckout});
  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
