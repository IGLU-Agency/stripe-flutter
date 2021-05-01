import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/confirm_intent_option.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/payment_method.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/shipping.dart';

import 'payment_method_data.dart';

part 'confirm_payment_intent_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ConfirmPaymentIntentRequest {
  String? paymentMethod;
  String? receiptEmail;
  SetupFutureUsage? setupFutureUsage;
  Shipping? shipping;
  String? returnUrl;
  PaymentMethodData? paymentMethodOptions;
  String? mandate;
  bool? offSession;
  bool? savePaymentMethod;
  List<PaymentMethodType?>? paymentMethodTypes;
  bool? useStripeSdk;
  //TODO: mandate_date
  Map<String, dynamic>? mandateData;
  ConfirmIntentOption? options;

  ConfirmPaymentIntentRequest(
      {this.returnUrl,
      this.mandateData,
      this.paymentMethod,
      this.paymentMethodOptions,
      this.mandate,
      this.offSession,
      this.paymentMethodTypes,
      this.receiptEmail,
      this.savePaymentMethod,
      this.setupFutureUsage,
      this.shipping,
      this.useStripeSdk,
      this.options});
  factory ConfirmPaymentIntentRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPaymentIntentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmPaymentIntentRequestToJson(this);
}

enum SetupFutureUsage {
  @JsonValue("on_session")
  onSession,
  @JsonValue("off_session")
  offSession
}
