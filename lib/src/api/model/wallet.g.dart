// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet(
    amexExpressCheckout: json['amex_express_checkout'],
    applePay: json['apple_pay'],
    dynamicLast4: json['dynamic_last4'] as String,
    googlePay: json['google_pay'],
    masterpass: json['masterpass'],
    samsungPay: json['samsung_pay'],
    type: _$enumDecodeNullable(_$TokenizationMethodEnumMap, json['type']),
    visaCheckout: json['visa_checkout'],
  );
}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'amex_express_checkout': instance.amexExpressCheckout,
      'apple_pay': instance.applePay,
      'dynamic_last4': instance.dynamicLast4,
      'google_pay': instance.googlePay,
      'masterpass': instance.masterpass,
      'samsung_pay': instance.samsungPay,
      'type': _$TokenizationMethodEnumMap[instance.type],
      'visa_checkout': instance.visaCheckout,
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

const _$TokenizationMethodEnumMap = {
  TokenizationMethod.amexExpressCheckout: 'amex_express_checkout',
  TokenizationMethod.androidPay: 'android_pay',
  TokenizationMethod.googlePay: 'google_pay',
  TokenizationMethod.applePay: 'apple_pay',
  TokenizationMethod.samsungPay: 'samsung_pay',
  TokenizationMethod.masterpass: 'masterpass',
  TokenizationMethod.visaCheckout: 'visa_checkout',
};
