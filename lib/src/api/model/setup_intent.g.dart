// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupIntent _$SetupIntentFromJson(Map<String, dynamic> json) {
  return SetupIntent(
    id: json['id'] as String,
    object: json['object'] as String,
    application: json['application'],
    cancellationReason: json['cancellation_reason'] as String,
    clientSecret: json['client_secret'] as String,
    created: json['created'] as int,
    customer: json['customer'],
    description: json['description'] as String,
    lastSetupError: json['last_setup_error'],
    livemode: json['livemode'] as bool,
    mandate: json['mandate'],
    metadata: json['metadata'] as Map<String, dynamic>,
    nextAction: json['next_action'] == null
        ? null
        : IntentAction.fromJson(json['next_action'] as Map<String, dynamic>),
    onBehalfOf: json['on_behalf_of'],
    paymentMethod: json['payment_method'],
    paymentMethodOptions: json['payment_method_options'] == null
        ? null
        : PaymentMethodData.fromJson(
            json['payment_method_options'] as Map<String, dynamic>),
    paymentMethodTypes: (json['payment_method_types'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    singleUseMandate: json['single_use_mandate'],
    status: _$enumDecodeNullable(_$SetupIntentStatusEnumMap, json['status']),
    usage: _$enumDecodeNullable(_$SetupFutureUsageEnumMap, json['usage']),
  );
}

Map<String, dynamic> _$SetupIntentToJson(SetupIntent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'application': instance.application,
      'cancellation_reason': instance.cancellationReason,
      'client_secret': instance.clientSecret,
      'created': instance.created,
      'customer': instance.customer,
      'description': instance.description,
      'last_setup_error': instance.lastSetupError,
      'livemode': instance.livemode,
      'mandate': instance.mandate,
      'metadata': instance.metadata,
      'next_action': instance.nextAction?.toJson(),
      'on_behalf_of': instance.onBehalfOf,
      'payment_method': instance.paymentMethod,
      'payment_method_options': instance.paymentMethodOptions?.toJson(),
      'payment_method_types': instance.paymentMethodTypes,
      'single_use_mandate': instance.singleUseMandate,
      'status': _$SetupIntentStatusEnumMap[instance.status],
      'usage': _$SetupFutureUsageEnumMap[instance.usage],
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

const _$SetupIntentStatusEnumMap = {
  SetupIntentStatus.requiresPaymentMethod: 'requires_payment_method',
  SetupIntentStatus.requiresConfirmation: 'requires_confirmation',
  SetupIntentStatus.requiresAction: 'requires_action',
  SetupIntentStatus.processing: 'processing',
  SetupIntentStatus.canceled: 'canceled',
  SetupIntentStatus.succeeded: 'succeeded',
};

const _$SetupFutureUsageEnumMap = {
  SetupFutureUsage.onSession: 'on_session',
  SetupFutureUsage.offSession: 'off_session',
};
