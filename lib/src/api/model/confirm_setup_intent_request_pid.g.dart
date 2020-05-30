// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_setup_intent_request_pid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmSetupIntentRequestPID _$ConfirmSetupIntentRequestPIDFromJson(
    Map<String, dynamic> json) {
  return ConfirmSetupIntentRequestPID(
    returnUrl: json['return_url'] as String,
    mandateData: json['mandate_data'] as Map<String, dynamic>,
    paymentMethod: json['payment_method'] as String,
    useStripeSdk: json['use_stripe_sdk'] as bool,
  );
}

Map<String, dynamic> _$ConfirmSetupIntentRequestPIDToJson(
        ConfirmSetupIntentRequestPID instance) =>
    <String, dynamic>{
      'payment_method': instance.paymentMethod,
      'return_url': instance.returnUrl,
      'mandate_data': instance.mandateData,
      'use_stripe_sdk': instance.useStripeSdk,
    };
