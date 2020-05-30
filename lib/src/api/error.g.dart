// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeError _$StripeErrorFromJson(Map<String, dynamic> json) {
  return StripeError(
    charge: json['charge'],
    code: _$enumDecodeNullable(_$StripeErrorCodeEnumMap, json['code']),
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
    type: _$enumDecodeNullable(_$StripeErrorTypeEnumMap, json['type']),
    cancellationReason: json['cancellation_reason'],
  );
}

Map<String, dynamic> _$StripeErrorToJson(StripeError instance) =>
    <String, dynamic>{
      'type': _$StripeErrorTypeEnumMap[instance.type],
      'raw': instance.raw,
      'raw_type': instance.rawType,
      'code': _$StripeErrorCodeEnumMap[instance.code],
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

const _$StripeErrorCodeEnumMap = {
  StripeErrorCode.account_already_exists: 'account_already_exists',
  StripeErrorCode.account_country_invalid_address:
      'account_country_invalid_address',
  StripeErrorCode.account_invalid: 'account_invalid',
  StripeErrorCode.account_number_invalid: 'account_number_invalid',
  StripeErrorCode.alipay_upgrade_required: 'alipay_upgrade_required',
  StripeErrorCode.amount_too_large: 'amount_too_large',
  StripeErrorCode.amount_too_small: 'amount_too_small',
  StripeErrorCode.api_key_expired: 'api_key_expired',
  StripeErrorCode.authentication_required: 'authentication_required',
  StripeErrorCode.balance_insufficient: 'balance_insufficient',
  StripeErrorCode.bank_account_declined: 'bank_account_declined',
  StripeErrorCode.bank_account_exists: 'bank_account_exists',
  StripeErrorCode.bank_account_unusable: 'bank_account_unusable',
  StripeErrorCode.bank_account_unverified: 'bank_account_unverified',
  StripeErrorCode.bank_account_verification_failed:
      'bank_account_verification_failed',
  StripeErrorCode.bitcoin_upgrade_required: 'bitcoin_upgrade_required',
  StripeErrorCode.card_decline_rate_limit_exceeded:
      'card_decline_rate_limit_exceeded',
  StripeErrorCode.card_declined: 'card_declined',
  StripeErrorCode.charge_already_captured: 'charge_already_captured',
  StripeErrorCode.charge_already_refunded: 'charge_already_refunded',
  StripeErrorCode.charge_disputed: 'charge_disputed',
  StripeErrorCode.charge_exceeds_source_limit: 'charge_exceeds_source_limit',
  StripeErrorCode.charge_expired_for_capture: 'charge_expired_for_capture',
  StripeErrorCode.charge_invalid_parameter: 'charge_invalid_parameter',
  StripeErrorCode.country_unsupported: 'country_unsupported',
  StripeErrorCode.coupon_expired: 'coupon_expired',
  StripeErrorCode.customer_max_payment_methods: 'customer_max_payment_methods',
  StripeErrorCode.customer_max_subscriptions: 'customer_max_subscriptions',
  StripeErrorCode.email_invalid: 'email_invalid',
  StripeErrorCode.expired_card: 'expired_card',
  StripeErrorCode.idempotency_key_in_use: 'idempotency_key_in_use',
  StripeErrorCode.incorrect_address: 'incorrect_address',
  StripeErrorCode.incorrect_cvc: 'incorrect_cvc',
  StripeErrorCode.incorrect_number: 'incorrect_number',
  StripeErrorCode.incorrect_zip: 'incorrect_zip',
  StripeErrorCode.instant_payouts_unsupported: 'instant_payouts_unsupported',
  StripeErrorCode.invalid_card_type: 'invalid_card_type',
  StripeErrorCode.invalid_characters: 'invalid_characters',
  StripeErrorCode.invalid_charge_amount: 'invalid_charge_amount',
  StripeErrorCode.invalid_cvc: 'invalid_cvc',
  StripeErrorCode.invalid_expiry_month: 'invalid_expiry_month',
  StripeErrorCode.invalid_expiry_year: 'invalid_expiry_year',
  StripeErrorCode.invalid_number: 'invalid_number',
  StripeErrorCode.invalid_source_usage: 'invalid_source_usage',
  StripeErrorCode.invoice_no_customer_line_items:
      'invoice_no_customer_line_items',
  StripeErrorCode.invoice_no_subscription_line_items:
      'invoice_no_subscription_line_items',
  StripeErrorCode.invoice_not_editable: 'invoice_not_editable',
  StripeErrorCode.invoice_payment_intent_requires_action:
      'invoice_payment_intent_requires_action',
  StripeErrorCode.invoice_upcoming_none: 'invoice_upcoming_none',
  StripeErrorCode.livemode_mismatch: 'livemode_mismatch',
  StripeErrorCode.lock_timeout: 'lock_timeout',
  StripeErrorCode.missing: 'missing',
  StripeErrorCode.not_allowed_on_standard_account:
      'not_allowed_on_standard_account',
  StripeErrorCode.order_creation_failed: 'order_creation_failed',
  StripeErrorCode.order_required_settings: 'order_required_settings',
  StripeErrorCode.order_status_invalid: 'order_status_invalid',
  StripeErrorCode.order_upstream_timeout: 'order_upstream_timeout',
  StripeErrorCode.out_of_inventory: 'out_of_inventory',
  StripeErrorCode.parameter_invalid_empty: 'parameter_invalid_empty',
  StripeErrorCode.parameter_invalid_integer: 'parameter_invalid_integer',
  StripeErrorCode.parameter_invalid_string_blank:
      'parameter_invalid_string_blank',
  StripeErrorCode.parameter_invalid_string_empty:
      'parameter_invalid_string_empty',
  StripeErrorCode.parameter_missing: 'parameter_missing',
  StripeErrorCode.parameter_unknown: 'parameter_unknown',
  StripeErrorCode.parameters_exclusive: 'parameters_exclusive',
  StripeErrorCode.payment_intent_action_required:
      'payment_intent_action_required',
  StripeErrorCode.payment_intent_authentication_failure:
      'payment_intent_authentication_failure',
  StripeErrorCode.payment_intent_incompatible_payment_method:
      'payment_intent_incompatible_payment_method',
  StripeErrorCode.payment_intent_invalid_parameter:
      'payment_intent_invalid_parameter',
  StripeErrorCode.payment_intent_payment_attempt_failed:
      'payment_intent_payment_attempt_failed',
  StripeErrorCode.payment_intent_unexpected_state:
      'payment_intent_unexpected_state',
  StripeErrorCode.payment_method_unactivated: 'payment_method_unactivated',
  StripeErrorCode.payment_method_unexpected_state:
      'payment_method_unexpected_state',
  StripeErrorCode.payouts_not_allowed: 'payouts_not_allowed',
  StripeErrorCode.platform_api_key_expired: 'platform_api_key_expired',
  StripeErrorCode.postal_code_invalid: 'postal_code_invalid',
  StripeErrorCode.processing_error: 'processing_error',
  StripeErrorCode.product_inactive: 'product_inactive',
  StripeErrorCode.rate_limit: 'rate_limit',
  StripeErrorCode.resource_already_exists: 'resource_already_exists',
  StripeErrorCode.resource_missing: 'resource_missing',
  StripeErrorCode.routing_number_invalid: 'routing_number_invalid',
  StripeErrorCode.secret_key_required: 'secret_key_required',
  StripeErrorCode.sepa_unsupported_account: 'sepa_unsupported_account',
  StripeErrorCode.setup_attempt_failed: 'setup_attempt_failed',
  StripeErrorCode.setup_intent_authentication_failure:
      'setup_intent_authentication_failure',
  StripeErrorCode.setup_intent_invalid_parameter:
      'setup_intent_invalid_parameter',
  StripeErrorCode.setup_intent_unexpected_state:
      'setup_intent_unexpected_state',
  StripeErrorCode.shipping_calculation_failed: 'shipping_calculation_failed',
  StripeErrorCode.sku_inactive: 'sku_inactive',
  StripeErrorCode.state_unsupported: 'state_unsupported',
  StripeErrorCode.tax_id_invalid: 'tax_id_invalid',
  StripeErrorCode.taxes_calculation_failed: 'taxes_calculation_failed',
  StripeErrorCode.testmode_charges_only: 'testmode_charges_only',
  StripeErrorCode.tls_version_unsupported: 'tls_version_unsupported',
  StripeErrorCode.token_already_used: 'token_already_used',
  StripeErrorCode.token_in_use: 'token_in_use',
  StripeErrorCode.transfers_not_allowed: 'transfers_not_allowed',
  StripeErrorCode.upstream_order_creation_failed:
      'upstream_order_creation_failed',
  StripeErrorCode.url_invalid: 'url_invalid',
};

const _$StripeErrorTypeEnumMap = {
  StripeErrorType.apiConnectionError: 'api_connection_error',
  StripeErrorType.apiError: 'api_error',
  StripeErrorType.authenticationError: 'authentication_error',
  StripeErrorType.cardError: 'card_error',
  StripeErrorType.idempotencyError: 'idempotency_error',
  StripeErrorType.invalidRequestError: 'invalid_request_error',
  StripeErrorType.rateLimitError: 'rate_limit_error',
};
