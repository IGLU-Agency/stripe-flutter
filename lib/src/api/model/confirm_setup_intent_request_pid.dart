import 'package:json_annotation/json_annotation.dart';

part 'confirm_setup_intent_request_pid.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ConfirmSetupIntentRequestPID {
  String paymentMethod;
  String returnUrl;
  //TODO: mandate_date
  Map<String, dynamic> mandateData;
  bool useStripeSdk;

  ConfirmSetupIntentRequestPID(
      {this.returnUrl,
      this.mandateData,
      this.paymentMethod,
      this.useStripeSdk});
  factory ConfirmSetupIntentRequestPID.fromJson(Map<String, dynamic> json) =>
      _$ConfirmSetupIntentRequestPIDFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmSetupIntentRequestPIDToJson(this);
}
