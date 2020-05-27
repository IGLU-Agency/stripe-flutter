// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingDetails _$BillingDetailsFromJson(Map<String, dynamic> json) {
  return BillingDetails(
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    email: json['email'] as String,
    name: json['name'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$BillingDetailsToJson(BillingDetails instance) =>
    <String, dynamic>{
      'address': instance.address?.toJson(),
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
    };
