import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class BankAccount {
  String? id;
  String? object;
  String? accountHolderName;
  String? accountHolderType;
  String? bankName;
  String? country;
  String? currency;
  String? fingerprint;
  String? last4;
  String? routingNumber;
  BankAccountStatus? status;

  BankAccount(
      {this.accountHolderName,
      this.accountHolderType,
      this.bankName,
      this.country,
      this.currency,
      this.fingerprint,
      this.id,
      this.last4,
      this.object,
      this.routingNumber,
      this.status});
  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
  Map<String, dynamic> toJson() => _$BankAccountToJson(this);
}

enum BankAccountStatus {
  @JsonValue("new")
  newS,
  @JsonValue("validated")
  validated,
  @JsonValue("verified")
  verified,
  @JsonValue("verification_failed")
  verificationFailed,
  @JsonValue("errored")
  errored
}
