import 'package:json_annotation/json_annotation.dart';

part 'confirm_intent_option.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ConfirmIntentOption {
  bool? handleActions;

  ConfirmIntentOption({this.handleActions});
  factory ConfirmIntentOption.fromJson(Map<String, dynamic> json) =>
      _$ConfirmIntentOptionFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmIntentOptionToJson(this);
}
