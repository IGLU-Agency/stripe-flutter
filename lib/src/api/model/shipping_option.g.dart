// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) {
  return ShippingOption(
    id: json['id'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    detail: json['detail'] as bool,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$ShippingOptionToJson(ShippingOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'detail': instance.detail,
      'amount': instance.amount,
    };
