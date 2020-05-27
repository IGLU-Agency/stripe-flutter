// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) {
  return PaymentResponse(
    token: json['token'] == null
        ? null
        : Token.fromJson(json['token'] as Map<String, dynamic>),
  )
    ..paymentMethod = json['payment_method'] == null
        ? null
        : PaymentMethod.fromJson(json['payment_method'] as Map<String, dynamic>)
    ..source = json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>)
    ..payerName = json['payer_name'] as String
    ..payerEmail = json['payer_email'] as String
    ..payerPhone = json['payer_phone'] as String
    ..shippingAddress = json['shipping_address'] == null
        ? null
        : ShippingAddress.fromJson(
            json['shipping_address'] as Map<String, dynamic>)
    ..shippingOption = json['shipping_option'] == null
        ? null
        : ShippingOption.fromJson(
            json['shipping_option'] as Map<String, dynamic>)
    ..methodName = json['method_name'] as String;
}

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'token': instance.token?.toJson(),
      'payment_method': instance.paymentMethod?.toJson(),
      'source': instance.source?.toJson(),
      'payer_name': instance.payerName,
      'payer_email': instance.payerEmail,
      'payer_phone': instance.payerPhone,
      'shipping_address': instance.shippingAddress?.toJson(),
      'shipping_option': instance.shippingOption?.toJson(),
      'method_name': instance.methodName,
    };
