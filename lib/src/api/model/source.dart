import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class Source {
  String id;
  String object;
  dynamic amount;
  String clientSecret;
  int created;
  String currency;
  String flow;
  bool livemode;
  Map<String, dynamic> metadata;
  //TODO: owner
  dynamic owner;
  //TODO: redirect
  dynamic redirect;
  //TODO: receiver
  dynamic receiver;
  dynamic statementDescriptor;
  SourceStatus status;
  SourceType type;
  String usage;
  String customer;
  //TODO: code_verification
  dynamic codeVerification;
  //TODO: source_order
  dynamic sourceOrder;

  Source(
      {this.id,
      this.object,
      this.amount,
      this.clientSecret,
      this.created,
      this.currency,
      this.flow,
      this.livemode,
      this.metadata,
      this.owner,
      this.receiver,
      this.statementDescriptor,
      this.status,
      this.type,
      this.usage,
      this.codeVerification,
      this.customer,
      this.redirect,
      this.sourceOrder});
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

enum SourceStatus {
  @JsonValue("canceled")
  canceled,
  @JsonValue("chargeable")
  chargeable,
  @JsonValue("consumed")
  consumed,
  @JsonValue("failed")
  failed,
  @JsonValue("pending")
  pending,
}

enum SourceType {
  @JsonValue("ach_credit_tranfer")
  achCreditTranfer,
  @JsonValue("ach_debit")
  achDebit,
  @JsonValue("alipay")
  alipay,
  @JsonValue("bancontact")
  bancontact,
  @JsonValue("card")
  card,
  @JsonValue("card_present")
  cardPresent,
  @JsonValue("eps")
  eps,
  @JsonValue("giropay")
  giropay,
  @JsonValue("ideal")
  ideal,
  @JsonValue("multibanco")
  multibanco,
  @JsonValue("klarna")
  klarna,
  @JsonValue("p24")
  p24,
  @JsonValue("sepa_debit")
  sepaDebit,
  @JsonValue("sofort")
  sofort,
  @JsonValue("three_d_secure")
  threeDSecure,
  @JsonValue("wechat")
  wechat,
}
