// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_checks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardChecks _$CardChecksFromJson(Map<String, dynamic> json) {
  return CardChecks(
    addressLine1Check: _$enumDecodeNullable(
        _$AddressFieldCheckEnumMap, json['address_line1_check']),
    addressPostalCodeCheck: _$enumDecodeNullable(
        _$AddressFieldCheckEnumMap, json['address_postal_code_check']),
    cvcCheck:
        _$enumDecodeNullable(_$AddressFieldCheckEnumMap, json['cvc_check']),
  );
}

Map<String, dynamic> _$CardChecksToJson(CardChecks instance) =>
    <String, dynamic>{
      'address_line1_check':
          _$AddressFieldCheckEnumMap[instance.addressLine1Check],
      'address_postal_code_check':
          _$AddressFieldCheckEnumMap[instance.addressPostalCodeCheck],
      'cvc_check': _$AddressFieldCheckEnumMap[instance.cvcCheck],
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

const _$AddressFieldCheckEnumMap = {
  AddressFieldCheck.pass: 'pass',
  AddressFieldCheck.fail: 'fail',
  AddressFieldCheck.unavailable: 'unavailable',
  AddressFieldCheck.unchecked: 'unchecked',
};
