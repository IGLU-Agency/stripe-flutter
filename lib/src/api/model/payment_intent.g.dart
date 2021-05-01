// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentIntent _$PaymentIntentFromJson(Map<String, dynamic> json) {
  return PaymentIntent(
    id: json['id'] as String?,
    object: json['object'] as String?,
    amount: json['amount'] as int?,
    amountCapturable: json['amount_capturable'] as int?,
    amountReceived: json['amount_received'] as int?,
    application: json['application'],
    applicationFeeAmount: json['application_fee_amount'],
    canceledAt: json['canceled_at'],
    cancellationReason: json['cancellation_reason'],
    captureMethod: json['capture_method'] as String?,
    charges: json['charges'],
    clientSecret: json['client_secret'] as String?,
    confirmationMethod: json['confirmation_method'] as String?,
    created: json['created'] as int?,
    currency: json['currency'] as String?,
    customer: json['customer'],
    description: json['description'] as String?,
    invoice: json['invoice'],
    lastPaymentError: json['last_payment_error'],
    livemode: json['livemode'] as bool?,
    metadata: json['metadata'] as Map<String, dynamic>?,
    nextAction: json['next_action'] == null
        ? null
        : IntentAction.fromJson(json['next_action'] as Map<String, dynamic>),
    onBehalfOf: json['on_behalf_of'],
    paymentMethod: json['payment_method'],
    paymentMethodOptions: json['payment_method_options'] == null
        ? null
        : PaymentMethodData.fromJson(
            json['payment_method_options'] as Map<String, dynamic>),
    paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    receiptEmail: json['receipt_email'] as String?,
    review: json['review'],
    setupFutureUsage: _$enumDecodeNullable(
        _$SetupFutureUsageEnumMap, json['setup_future_usage']),
    shipping: json['shipping'] == null
        ? null
        : Shipping.fromJson(json['shipping'] as Map<String, dynamic>),
    statementDescriptor: json['statement_descriptor'],
    statementDescriptorSuffix: json['statement_descriptor_suffix'],
    status: _$enumDecodeNullable(_$PaymentIntentStatusEnumMap, json['status']),
    transferData: json['transfer_data'] == null
        ? null
        : Transfer.fromJson(json['transfer_data'] as Map<String, dynamic>),
    transferGroup: json['transfer_group'] as String?,
  );
}

Map<String, dynamic> _$PaymentIntentToJson(PaymentIntent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'amount': instance.amount,
      'amount_capturable': instance.amountCapturable,
      'amount_received': instance.amountReceived,
      'application': instance.application,
      'application_fee_amount': instance.applicationFeeAmount,
      'canceled_at': instance.canceledAt,
      'cancellation_reason': instance.cancellationReason,
      'capture_method': instance.captureMethod,
      'charges': instance.charges,
      'client_secret': instance.clientSecret,
      'confirmation_method': instance.confirmationMethod,
      'created': instance.created,
      'currency': instance.currency,
      'customer': instance.customer,
      'description': instance.description,
      'invoice': instance.invoice,
      'last_payment_error': instance.lastPaymentError,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
      'next_action': instance.nextAction?.toJson(),
      'on_behalf_of': instance.onBehalfOf,
      'payment_method': instance.paymentMethod,
      'payment_method_options': instance.paymentMethodOptions?.toJson(),
      'payment_method_types': instance.paymentMethodTypes,
      'receipt_email': instance.receiptEmail,
      'review': instance.review,
      'setup_future_usage':
          _$SetupFutureUsageEnumMap[instance.setupFutureUsage],
      'shipping': instance.shipping?.toJson(),
      'statement_descriptor': instance.statementDescriptor,
      'statement_descriptor_suffix': instance.statementDescriptorSuffix,
      'status': _$PaymentIntentStatusEnumMap[instance.status],
      'transfer_data': instance.transferData?.toJson(),
      'transfer_group': instance.transferGroup,
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

const _$SetupFutureUsageEnumMap = {
  SetupFutureUsage.onSession: 'on_session',
  SetupFutureUsage.offSession: 'off_session',
};

const _$PaymentIntentStatusEnumMap = {
  PaymentIntentStatus.requiresPaymentMethod: 'requires_payment_method',
  PaymentIntentStatus.requiresConfirmation: 'requires_confirmation',
  PaymentIntentStatus.requiresAction: 'requires_action',
  PaymentIntentStatus.processing: 'processing',
  PaymentIntentStatus.requiresCapture: 'requires_capture',
  PaymentIntentStatus.canceled: 'canceled',
  PaymentIntentStatus.succeeded: 'succeeded',
};
