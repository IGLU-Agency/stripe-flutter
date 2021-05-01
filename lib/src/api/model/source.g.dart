// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    id: json['id'] as String?,
    object: json['object'] as String?,
    amount: json['amount'],
    clientSecret: json['client_secret'] as String?,
    created: json['created'] as int?,
    currency: json['currency'] as String?,
    flow: json['flow'] as String?,
    livemode: json['livemode'] as bool?,
    metadata: json['metadata'] as Map<String, dynamic>?,
    owner: json['owner'],
    receiver: json['receiver'],
    statementDescriptor: json['statement_descriptor'],
    status: _$enumDecodeNullable(_$SourceStatusEnumMap, json['status']),
    type: _$enumDecodeNullable(_$SourceTypeEnumMap, json['type']),
    usage: json['usage'] as String?,
    codeVerification: json['code_verification'],
    customer: json['customer'] as String?,
    redirect: json['redirect'],
    sourceOrder: json['source_order'],
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'amount': instance.amount,
      'client_secret': instance.clientSecret,
      'created': instance.created,
      'currency': instance.currency,
      'flow': instance.flow,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
      'owner': instance.owner,
      'redirect': instance.redirect,
      'receiver': instance.receiver,
      'statement_descriptor': instance.statementDescriptor,
      'status': _$SourceStatusEnumMap[instance.status],
      'type': _$SourceTypeEnumMap[instance.type],
      'usage': instance.usage,
      'customer': instance.customer,
      'code_verification': instance.codeVerification,
      'source_order': instance.sourceOrder,
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

const _$SourceStatusEnumMap = {
  SourceStatus.canceled: 'canceled',
  SourceStatus.chargeable: 'chargeable',
  SourceStatus.consumed: 'consumed',
  SourceStatus.failed: 'failed',
  SourceStatus.pending: 'pending',
};

const _$SourceTypeEnumMap = {
  SourceType.achCreditTranfer: 'ach_credit_tranfer',
  SourceType.achDebit: 'ach_debit',
  SourceType.alipay: 'alipay',
  SourceType.bancontact: 'bancontact',
  SourceType.card: 'card',
  SourceType.cardPresent: 'card_present',
  SourceType.eps: 'eps',
  SourceType.giropay: 'giropay',
  SourceType.ideal: 'ideal',
  SourceType.multibanco: 'multibanco',
  SourceType.klarna: 'klarna',
  SourceType.p24: 'p24',
  SourceType.sepaDebit: 'sepa_debit',
  SourceType.sofort: 'sofort',
  SourceType.threeDSecure: 'three_d_secure',
  SourceType.wechat: 'wechat',
};
