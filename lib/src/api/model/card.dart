import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/card_checks.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/three_d_secure_usage.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/wallet.dart';

part 'card.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Card {
  String? id;
  String? object;
  String? addressCity;
  String? addressCountry;
  String? addressLine1;
  AddressFieldCheck? addressLine1Check;
  String? addressLine2;
  String? addressState;
  String? addressZip;
  AddressFieldCheck? addressZipCheck;
  CardBrand? brand;
  String? country;
  String? currency;
  AddressFieldCheck? cvcCheck;
  String? dynamicLast4;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  Funding? funding;
  String? last4;
  Map<String, dynamic>? metadata;
  String? name;
  TokenizationMethod? tokenizationMethod;
  CardChecks? checks;
  //TODO: generated_from
  dynamic generatedFrom;
  ThreeDSecureUsage? threeDSecureUsage;
  Wallet? wallet;

  Card(
      {this.addressCity,
      this.addressCountry,
      this.addressLine1,
      this.addressLine1Check,
      this.addressLine2,
      this.addressState,
      this.addressZip,
      this.addressZipCheck,
      this.brand,
      this.id,
      this.object,
      this.country,
      this.currency,
      this.cvcCheck,
      this.dynamicLast4,
      this.expMonth,
      this.expYear,
      this.fingerprint,
      this.funding,
      this.last4,
      this.metadata,
      this.name,
      this.tokenizationMethod});
  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}

enum CardBrand {
  @JsonValue("American Express")
  americanExpress,
  @JsonValue("Diners Club")
  dinersClub,
  @JsonValue("Discover")
  Discover,
  @JsonValue("JCB")
  JCB,
  @JsonValue("MasterCard")
  masterCard,
  @JsonValue("UnionPay")
  unionPay,
  @JsonValue("Visa")
  Visa,
  @JsonValue("Unknown")
  Unknown,
  @JsonValue("amex")
  amex,
  @JsonValue("diners")
  diners,
  @JsonValue("discover")
  discover,
  @JsonValue("jcb")
  jcb,
  @JsonValue("mastercard")
  mastercard,
  @JsonValue("unionpay")
  unionpay,
  @JsonValue("visa")
  visa,
  @JsonValue("unknown")
  unknown
}

extension ParseToStringCardBrand on CardBrand {
  String toValue() {
    return this.toString().split('.').last;
  }
}

enum AddressFieldCheck {
  @JsonValue("pass")
  pass,
  @JsonValue("fail")
  fail,
  @JsonValue("unavailable")
  unavailable,
  @JsonValue("unchecked")
  unchecked
}

enum Funding {
  @JsonValue("credit")
  credit,
  @JsonValue("debit")
  debit,
  @JsonValue("prepaid")
  prepaid,
  @JsonValue("unknown")
  unknown
}

enum TokenizationMethod {
  @JsonValue("amex_express_checkout")
  amexExpressCheckout,
  @JsonValue("android_pay")
  androidPay,
  @JsonValue("google_pay")
  googlePay,
  @JsonValue("apple_pay")
  applePay,
  @JsonValue("samsung_pay")
  samsungPay,
  @JsonValue("masterpass")
  masterpass,
  @JsonValue("visa_checkout")
  visaCheckout
}
