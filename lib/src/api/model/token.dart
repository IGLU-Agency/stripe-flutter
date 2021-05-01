import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/bank_account.dart';

part 'token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Token {
  String? id;
  String? object;
  BankAccount? bankAccount;
  String? clientIp;
  int? created;
  bool? livemode;
  String? type;
  bool? used;

  Token(
      {this.bankAccount,
      this.clientIp,
      this.created,
      this.id,
      this.livemode,
      this.object,
      this.type,
      this.used});
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
