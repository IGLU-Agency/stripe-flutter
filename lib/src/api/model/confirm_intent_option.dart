import 'package:json_annotation/json_annotation.dart';

part 'confirm_intent_option.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class ConfirmIntentOption {
  bool handleActions;

  ConfirmIntentOption({this.handleActions});
  factory ConfirmIntentOption.fromJson(Map<String, dynamic> json) =>
      _$ConfirmIntentOptionFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmIntentOptionToJson(this);
}
