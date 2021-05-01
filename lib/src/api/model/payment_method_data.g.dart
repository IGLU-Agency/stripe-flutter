// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodData _$PaymentMethodDataFromJson(Map<String, dynamic> json) {
  return PaymentMethodData(
    billingDetails: json['billing_details'] == null
        ? null
        : BillingDetails.fromJson(
            json['billing_details'] as Map<String, dynamic>),
    metadata: json['metadata'] as Map<String, dynamic>?,
    type: _$enumDecodeNullable(_$PaymentMethodTypeEnumMap, json['type']),
    auBecsDebit: json['au_becs_debit'] == null
        ? null
        : AuBecsDebitMethod.fromJson(
            json['au_becs_debit'] as Map<String, dynamic>),
    card: json['card'] == null
        ? null
        : CardMethod.fromJson(json['card'] as Map<String, dynamic>),
    fpx: json['fpx'] == null
        ? null
        : FpxMethod.fromJson(json['fpx'] as Map<String, dynamic>),
    ideal: json['ideal'] == null
        ? null
        : IdealMethod.fromJson(json['ideal'] as Map<String, dynamic>),
    sepaDebit: json['sepa_debit'] == null
        ? null
        : SepaDebitMethod.fromJson(json['sepa_debit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaymentMethodDataToJson(PaymentMethodData instance) =>
    <String, dynamic>{
      'type': _$PaymentMethodTypeEnumMap[instance.type],
      'billing_details': instance.billingDetails?.toJson(),
      'metadata': instance.metadata,
      'au_becs_debit': instance.auBecsDebit?.toJson(),
      'card': instance.card?.toJson(),
      'fpx': instance.fpx?.toJson(),
      'ideal': instance.ideal?.toJson(),
      'sepa_debit': instance.sepaDebit?.toJson(),
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

const _$PaymentMethodTypeEnumMap = {
  PaymentMethodType.auBecsDebit: 'au_becs_debit',
  PaymentMethodType.card: 'card',
  PaymentMethodType.fpx: 'fpx',
  PaymentMethodType.ideal: 'ideal',
  PaymentMethodType.sepaDebit: 'sepa_debit',
};

AuBecsDebitMethod _$AuBecsDebitMethodFromJson(Map<String, dynamic> json) {
  return AuBecsDebitMethod(
    accountNumber: json['account_number'] as String?,
    bsbNumber: json['bsb_number'] as String?,
  );
}

Map<String, dynamic> _$AuBecsDebitMethodToJson(AuBecsDebitMethod instance) =>
    <String, dynamic>{
      'account_number': instance.accountNumber,
      'bsb_number': instance.bsbNumber,
    };

CardMethod _$CardMethodFromJson(Map<String, dynamic> json) {
  return CardMethod(
    cvc: json['cvc'] as String?,
    expMonth: json['exp_month'] as int?,
    expYear: json['exp_year'] as int?,
    number: json['number'] as String?,
  );
}

Map<String, dynamic> _$CardMethodToJson(CardMethod instance) =>
    <String, dynamic>{
      'exp_month': instance.expMonth,
      'exp_year': instance.expYear,
      'number': instance.number,
      'cvc': instance.cvc,
    };

FpxMethod _$FpxMethodFromJson(Map<String, dynamic> json) {
  return FpxMethod(
    bank: json['bank'] as String?,
  );
}

Map<String, dynamic> _$FpxMethodToJson(FpxMethod instance) => <String, dynamic>{
      'bank': instance.bank,
    };

IdealMethod _$IdealMethodFromJson(Map<String, dynamic> json) {
  return IdealMethod(
    bank: json['bank'] as String?,
  );
}

Map<String, dynamic> _$IdealMethodToJson(IdealMethod instance) =>
    <String, dynamic>{
      'bank': instance.bank,
    };

SepaDebitMethod _$SepaDebitMethodFromJson(Map<String, dynamic> json) {
  return SepaDebitMethod(
    iban: json['iban'] as String?,
  );
}

Map<String, dynamic> _$SepaDebitMethodToJson(SepaDebitMethod instance) =>
    <String, dynamic>{
      'iban': instance.iban,
    };
