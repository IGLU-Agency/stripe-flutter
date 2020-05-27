// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return PaymentMethod(
    id: json['id'] as String,
    auBecsDebit: json['au_becs_debit'] == null
        ? null
        : AuBecsDebit.fromJson(json['au_becs_debit'] as Map<String, dynamic>),
    billingDetails: json['billing_details'] == null
        ? null
        : BillingDetails.fromJson(
            json['billing_details'] as Map<String, dynamic>),
    customer: json['customer'],
    metadata: json['metadata'] as Map<String, dynamic>,
    object: json['object'] as String,
    type: _$enumDecodeNullable(_$PaymentMethodTypeEnumMap, json['type']),
  )
    ..card = json['card'] == null
        ? null
        : Card.fromJson(json['card'] as Map<String, dynamic>)
    ..cardPresent = json['card_present']
    ..created = json['created'] as int
    ..fpx = json['fpx']
    ..ideal = json['ideal']
    ..livemode = json['livemode'] as bool
    ..sepaDebit = json['sepa_debit'];
}

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billing_details': instance.billingDetails?.toJson(),
      'customer': instance.customer,
      'metadata': instance.metadata,
      'type': _$PaymentMethodTypeEnumMap[instance.type],
      'object': instance.object,
      'au_becs_debit': instance.auBecsDebit?.toJson(),
      'card': instance.card?.toJson(),
      'card_present': instance.cardPresent,
      'created': instance.created,
      'fpx': instance.fpx,
      'ideal': instance.ideal,
      'livemode': instance.livemode,
      'sepa_debit': instance.sepaDebit,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.auBecsDebit: 'au_becs_debit',
  PaymentMethodType.card: 'card',
  PaymentMethodType.fpx: 'fpx',
  PaymentMethodType.ideal: 'ideal',
  PaymentMethodType.sepaDebit: 'sepa_debit',
};
