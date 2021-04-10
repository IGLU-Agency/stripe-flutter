import 'package:json_annotation/json_annotation.dart';

import 'payment_method_data.dart';

part 'confirm_setup_intent_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ConfirmSetupIntentRequest {
  PaymentMethodData paymentMethod;
  String returnUrl;
  //PaymentMethodData paymentMethodData;
  //TODO: mandate_date
  Map<String, dynamic> mandateData;
  bool useStripeSdk;

  ConfirmSetupIntentRequest(
      {this.returnUrl,
      this.mandateData,
      this.paymentMethod,
      this.useStripeSdk});
  factory ConfirmSetupIntentRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmSetupIntentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmSetupIntentRequestToJson(this);
}
