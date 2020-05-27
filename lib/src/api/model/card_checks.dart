import 'package:json_annotation/json_annotation.dart';

import 'card.dart';

part 'card_checks.g.dart';

@JsonSerializable(
    nullable: true, fieldRename: FieldRename.snake, explicitToJson: true)
class CardChecks {
  AddressFieldCheck addressLine1Check;
  AddressFieldCheck addressPostalCodeCheck;
  AddressFieldCheck cvcCheck;

  CardChecks(
      {this.addressLine1Check, this.addressPostalCodeCheck, this.cvcCheck});
  factory CardChecks.fromJson(Map<String, dynamic> json) =>
      _$CardChecksFromJson(json);
  Map<String, dynamic> toJson() => _$CardChecksToJson(this);
}
