// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_payment_intent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmPaymentIntentRequest _$ConfirmPaymentIntentRequestFromJson(
    Map<String, dynamic> json) {
  return ConfirmPaymentIntentRequest(
    returnUrl: json['return_url'] as String?,
    mandateData: json['mandate_data'] as Map<String, dynamic>?,
    paymentMethod: json['payment_method'] as String?,
    paymentMethodOptions: json['payment_method_options'] == null
        ? null
        : PaymentMethodData.fromJson(
            json['payment_method_options'] as Map<String, dynamic>),
    mandate: json['mandate'] as String?,
    offSession: json['off_session'] as bool?,
    paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
        ?.map((e) => _$enumDecodeNullable(_$PaymentMethodTypeEnumMap, e))
        .toList(),
    receiptEmail: json['receipt_email'] as String?,
    savePaymentMethod: json['save_payment_method'] as bool?,
    setupFutureUsage: _$enumDecodeNullable(
        _$SetupFutureUsageEnumMap, json['setup_future_usage']),
    shipping: json['shipping'] == null
        ? null
        : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
    useStripeSdk: json['use_stripe_sdk'] as bool?,
    options: json['options'] == null
        ? null
        : ConfirmIntentOption.fromJson(json['options'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConfirmPaymentIntentRequestToJson(
        ConfirmPaymentIntentRequest instance) =>
    <String, dynamic>{
      'payment_method': instance.paymentMethod,
      'receipt_email': instance.receiptEmail,
      'setup_future_usage':
          _$SetupFutureUsageEnumMap[instance.setupFutureUsage],
      'shipping': instance.shipping?.toJson(),
      'return_url': instance.returnUrl,
      'payment_method_options': instance.paymentMethodOptions?.toJson(),
      'mandate': instance.mandate,
      'off_session': instance.offSession,
      'save_payment_method': instance.savePaymentMethod,
      'payment_method_types': instance.paymentMethodTypes
          ?.map((e) => _$PaymentMethodTypeEnumMap[e])
          .toList(),
      'use_stripe_sdk': instance.useStripeSdk,
      'mandate_data': instance.mandateData,
      'options': instance.options?.toJson(),
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

const _$SetupFutureUsageEnumMap = {
  SetupFutureUsage.onSession: 'on_session',
  SetupFutureUsage.offSession: 'off_session',
};
