// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return BankAccount(
    accountHolderName: json['account_holder_name'] as String,
    accountHolderType: json['account_holder_type'] as String,
    bankName: json['bank_name'] as String,
    country: json['country'] as String,
    currency: json['currency'] as String,
    fingerprint: json['fingerprint'] as String,
    id: json['id'] as String,
    last4: json['last4'] as String,
    object: json['object'] as String,
    routingNumber: json['routing_number'] as String,
    status: _$enumDecodeNullable(_$BankAccountStatusEnumMap, json['status']),
  );
}

Map<String, dynamic> _$BankAccountToJson(BankAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'account_holder_name': instance.accountHolderName,
      'account_holder_type': instance.accountHolderType,
      'bank_name': instance.bankName,
      'country': instance.country,
      'currency': instance.currency,
      'fingerprint': instance.fingerprint,
      'last4': instance.last4,
      'routing_number': instance.routingNumber,
      'status': _$BankAccountStatusEnumMap[instance.status],
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

const _$BankAccountStatusEnumMap = {
  BankAccountStatus.newS: 'new',
  BankAccountStatus.validated: 'validated',
  BankAccountStatus.verified: 'verified',
  BankAccountStatus.verificationFailed: 'verification_failed',
  BankAccountStatus.errored: 'errored',
};
