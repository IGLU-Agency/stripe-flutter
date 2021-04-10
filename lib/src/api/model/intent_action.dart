import 'package:json_annotation/json_annotation.dart';

import 'redirect_to_url.dart';

part 'intent_action.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class IntentAction {
  RedirectToUrl redirectToUrl;
  IntentActionType type;
  dynamic useStripeSdk;

  IntentAction({this.type, this.useStripeSdk});
  factory IntentAction.fromJson(Map<String, dynamic> json) =>
      _$IntentActionFromJson(json);
  Map<String, dynamic> toJson() => _$IntentActionToJson(this);
}

enum IntentActionType {
  @JsonValue("redirect_to_url")
  redirectToUrl,
  @JsonValue("use_stripe_sdk")
  useStripeSdk
}
