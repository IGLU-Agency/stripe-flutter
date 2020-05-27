// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) {
  return ShippingAddress(
    addressLine:
        (json['address_line'] as List)?.map((e) => e as String)?.toList(),
    city: json['city'] as String,
    country: json['country'] as String,
    dependendLocality: json['dependend_locality'] as String,
    phone: json['phone'] as String,
    postalCode: json['postal_code'] as String,
    recipient: json['recipient'] as String,
    region: json['region'] as String,
    sortingCode: json['sorting_code'] as String,
  );
}

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'address_line': instance.addressLine,
      'region': instance.region,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'recipient': instance.recipient,
      'phone': instance.phone,
      'sorting_code': instance.sortingCode,
      'dependend_locality': instance.dependendLocality,
    };
