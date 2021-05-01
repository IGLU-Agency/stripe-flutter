// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intent_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntentAction _$IntentActionFromJson(Map<String, dynamic> json) {
  return IntentAction(
    type: _$enumDecodeNullable(_$IntentActionTypeEnumMap, json['type']),
    useStripeSdk: json['use_stripe_sdk'],
  )..redirectToUrl = json['redirect_to_url'] == null
      ? null
      : RedirectToUrl.fromJson(json['redirect_to_url'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IntentActionToJson(IntentAction instance) =>
    <String, dynamic>{
      'redirect_to_url': instance.redirectToUrl?.toJson(),
      'type': _$IntentActionTypeEnumMap[instance.type],
      'use_stripe_sdk': instance.useStripeSdk,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$IntentActionTypeEnumMap = {
  IntentActionType.redirectToUrl: 'redirect_to_url',
  IntentActionType.useStripeSdk: 'use_stripe_sdk',
};
