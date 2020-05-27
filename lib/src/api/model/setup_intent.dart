import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/confirm_payment_intent_request.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/payment_method_data.dart';

import 'intent_action.dart';

part 'setup_intent.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class SetupIntent {
  String id;
  String object;
  dynamic application;
  String cancellationReason;
  String clientSecret;
  int created;
  dynamic customer;
  String description;
  //TODO: LAST SETUP ERRO
  dynamic lastSetupError;
  bool livemode;
  dynamic mandate;
  Map<String, dynamic> metadata;
  IntentAction nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodData paymentMethodOptions;
  List<String> paymentMethodTypes;
  dynamic singleUseMandate;
  SetupIntentStatus status;
  SetupFutureUsage usage;

  SetupIntent({
    this.id,
    this.object,
    this.application,
    this.cancellationReason,
    this.clientSecret,
    this.created,
    this.customer,
    this.description,
    this.lastSetupError,
    this.livemode,
    this.mandate,
    this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodOptions,
    this.paymentMethodTypes,
    this.singleUseMandate,
    this.status,
    this.usage,
  });
  factory SetupIntent.fromJson(Map<String, dynamic> json) =>
      _$SetupIntentFromJson(json);
  Map<String, dynamic> toJson() => _$SetupIntentToJson(this);
}

enum SetupIntentStatus {
  @JsonValue("requires_payment_method")
  requiresPaymentMethod,
  @JsonValue("requires_confirmation")
  requiresConfirmation,
  @JsonValue("requires_action")
  requiresAction,
  @JsonValue("processing")
  processing,
  @JsonValue("canceled")
  canceled,
  @JsonValue("succeeded")
  succeeded
}
