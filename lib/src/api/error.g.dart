// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeError _$StripeErrorFromJson(Map<String, dynamic> json) {
  return StripeError(
    charge: json['charge'],
    code: json['code'],
    declineCode: json['decline_code'],
    detail: json['detail'],
    docUrl: json['doc_url'],
    headers: json['headers'],
    message: json['message'],
    param: json['param'],
    paymentIntent: json['payment_intent'],
    paymentMethod: json['payment_method'],
    raw: json['raw'],
    rawType: json['raw_type'],
    requestId: json['request_id'],
    setupIntent: json['setup_intent'],
    source: json['source'],
    statusCode: json['status_code'],
    type: json['type'],
  )..cancellationReason = json['cancellation_reason'];
}

Map<String, dynamic> _$StripeErrorToJson(StripeError instance) =>
    <String, dynamic>{
      'type': instance.type,
      'raw': instance.raw,
      'raw_type': instance.rawType,
      'code': instance.code,
      'doc_url': instance.docUrl,
      'param': instance.param,
      'detail': instance.detail,
      'headers': instance.headers,
      'request_id': instance.requestId,
      'status_code': instance.statusCode,
      'message': instance.message,
      'charge': instance.charge,
      'decline_code': instance.declineCode,
      'payment_intent': instance.paymentIntent,
      'payment_method': instance.paymentMethod,
      'setup_intent': instance.setupIntent,
      'source': instance.source,
      'cancellation_reason': instance.cancellationReason,
    };
