// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_setup_intent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmSetupIntentRequest _$ConfirmSetupIntentRequestFromJson(
    Map<String, dynamic> json) {
  return ConfirmSetupIntentRequest(
    returnUrl: json['return_url'] as String,
    mandateData: json['mandate_data'] as Map<String, dynamic>,
    paymentMethod: json['payment_method'],
    useStripeSdk: json['use_stripe_sdk'] as bool,
  );
}

Map<String, dynamic> _$ConfirmSetupIntentRequestToJson(
        ConfirmSetupIntentRequest instance) =>
    <String, dynamic>{
      'payment_method': instance.paymentMethod,
      'return_url': instance.returnUrl,
      'mandate_data': instance.mandateData,
      'use_stripe_sdk': instance.useStripeSdk,
    };
