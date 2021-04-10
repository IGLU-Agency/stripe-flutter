import 'package:json_annotation/json_annotation.dart';

/// StripeError is the base error from which all other more specific Stripe errors derive.
/// Specifically for errors returned from Stripe's REST API.
part 'error.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class StripeError extends Error {
  StripeErrorType type;
  var raw;
  var rawType;
  StripeErrorCode code;
  var docUrl;
  var param;
  var detail;
  var headers;
  var requestId;
  var statusCode;
  var message;
  var charge;
  var declineCode;
  var paymentIntent;
  var paymentMethod;
  var setupIntent;
  var source;
  var cancellationReason;

  StripeError(
      {this.charge,
      this.code,
      this.declineCode,
      this.detail,
      this.docUrl,
      this.headers,
      this.message,
      this.param,
      this.paymentIntent,
      this.paymentMethod,
      this.raw,
      this.rawType,
      this.requestId,
      this.setupIntent,
      this.source,
      this.statusCode,
      this.type,
      this.cancellationReason});
  factory StripeError.fromJson(Map<String, dynamic> json) =>
      _$StripeErrorFromJson(json);
  Map<String, dynamic> toJson() => _$StripeErrorToJson(this);
}

enum StripeErrorType {
  @JsonValue("api_connection_error")
  apiConnectionError,
  @JsonValue("api_error")
  apiError,
  @JsonValue("authentication_error")
  authenticationError,
  @JsonValue("card_error")
  cardError,
  @JsonValue("idempotency_error")
  idempotencyError,
  @JsonValue("invalid_request_error")
  invalidRequestError,
  @JsonValue("rate_limit_error")
  rateLimitError,
}

enum StripeErrorCode {
  @JsonValue("account_already_exists")
  account_already_exists,
  @JsonValue("account_country_invalid_address")
  account_country_invalid_address,
  @JsonValue("account_invalid")
  account_invalid,
  @JsonValue("account_number_invalid")
  account_number_invalid,
  @JsonValue("alipay_upgrade_required")
  alipay_upgrade_required,
  @JsonValue("amount_too_large")
  amount_too_large,
  @JsonValue("amount_too_small")
  amount_too_small,
  @JsonValue("api_key_expired")
  api_key_expired,
  @JsonValue("authentication_required")
  authentication_required,
  @JsonValue("balance_insufficient")
  balance_insufficient,
  @JsonValue("bank_account_declined")
  bank_account_declined,
  @JsonValue("bank_account_exists")
  bank_account_exists,
  @JsonValue("bank_account_unusable")
  bank_account_unusable,
  @JsonValue("bank_account_unverified")
  bank_account_unverified,
  @JsonValue("bank_account_verification_failed")
  bank_account_verification_failed,
  @JsonValue("bitcoin_upgrade_required")
  bitcoin_upgrade_required,
  @JsonValue("card_decline_rate_limit_exceeded")
  card_decline_rate_limit_exceeded,
  @JsonValue("card_declined")
  card_declined,
  @JsonValue("charge_already_captured")
  charge_already_captured,
  @JsonValue("charge_already_refunded")
  charge_already_refunded,
  @JsonValue("charge_disputed")
  charge_disputed,
  @JsonValue("charge_exceeds_source_limit")
  charge_exceeds_source_limit,
  @JsonValue("charge_expired_for_capture")
  charge_expired_for_capture,
  @JsonValue("charge_invalid_parameter")
  charge_invalid_parameter,
  @JsonValue("country_unsupported")
  country_unsupported,
  @JsonValue("coupon_expired")
  coupon_expired,
  @JsonValue("customer_max_payment_methods")
  customer_max_payment_methods,
  @JsonValue("customer_max_subscriptions")
  customer_max_subscriptions,
  @JsonValue("email_invalid")
  email_invalid,
  @JsonValue("expired_card")
  expired_card,
  @JsonValue("idempotency_key_in_use")
  idempotency_key_in_use,
  @JsonValue("incorrect_address")
  incorrect_address,
  @JsonValue("incorrect_cvc")
  incorrect_cvc,
  @JsonValue("incorrect_number")
  incorrect_number,
  @JsonValue("incorrect_zip")
  incorrect_zip,
  @JsonValue("instant_payouts_unsupported")
  instant_payouts_unsupported,
  @JsonValue("invalid_card_type")
  invalid_card_type,
  @JsonValue("invalid_characters")
  invalid_characters,
  @JsonValue("invalid_charge_amount")
  invalid_charge_amount,
  @JsonValue("invalid_cvc")
  invalid_cvc,
  @JsonValue("invalid_expiry_month")
  invalid_expiry_month,
  @JsonValue("invalid_expiry_year")
  invalid_expiry_year,
  @JsonValue("invalid_number")
  invalid_number,
  @JsonValue("invalid_source_usage")
  invalid_source_usage,
  @JsonValue("invoice_no_customer_line_items")
  invoice_no_customer_line_items,
  @JsonValue("invoice_no_subscription_line_items")
  invoice_no_subscription_line_items,
  @JsonValue("invoice_not_editable")
  invoice_not_editable,
  @JsonValue("invoice_payment_intent_requires_action")
  invoice_payment_intent_requires_action,
  @JsonValue("invoice_upcoming_none")
  invoice_upcoming_none,
  @JsonValue("livemode_mismatch")
  livemode_mismatch,
  @JsonValue("lock_timeout")
  lock_timeout,
  @JsonValue("missing")
  missing,
  @JsonValue("not_allowed_on_standard_account")
  not_allowed_on_standard_account,
  @JsonValue("order_creation_failed")
  order_creation_failed,
  @JsonValue("order_required_settings")
  order_required_settings,
  @JsonValue("order_status_invalid")
  order_status_invalid,
  @JsonValue("order_upstream_timeout")
  order_upstream_timeout,
  @JsonValue("out_of_inventory")
  out_of_inventory,
  @JsonValue("parameter_invalid_empty")
  parameter_invalid_empty,
  @JsonValue("parameter_invalid_integer")
  parameter_invalid_integer,
  @JsonValue("parameter_invalid_string_blank")
  parameter_invalid_string_blank,
  @JsonValue("parameter_invalid_string_empty")
  parameter_invalid_string_empty,
  @JsonValue("parameter_missing")
  parameter_missing,
  @JsonValue("parameter_unknown")
  parameter_unknown,
  @JsonValue("parameters_exclusive")
  parameters_exclusive,
  @JsonValue("payment_intent_action_required")
  payment_intent_action_required,
  @JsonValue("payment_intent_authentication_failure")
  payment_intent_authentication_failure,
  @JsonValue("payment_intent_incompatible_payment_method")
  payment_intent_incompatible_payment_method,
  @JsonValue("payment_intent_invalid_parameter")
  payment_intent_invalid_parameter,
  @JsonValue("payment_intent_payment_attempt_failed")
  payment_intent_payment_attempt_failed,
  @JsonValue("payment_intent_unexpected_state")
  payment_intent_unexpected_state,
  @JsonValue("payment_method_unactivated")
  payment_method_unactivated,
  @JsonValue("payment_method_unexpected_state")
  payment_method_unexpected_state,
  @JsonValue("payouts_not_allowed")
  payouts_not_allowed,
  @JsonValue("platform_api_key_expired")
  platform_api_key_expired,
  @JsonValue("postal_code_invalid")
  postal_code_invalid,
  @JsonValue("processing_error")
  processing_error,
  @JsonValue("product_inactive")
  product_inactive,
  @JsonValue("rate_limit")
  rate_limit,
  @JsonValue("resource_already_exists")
  resource_already_exists,
  @JsonValue("resource_missing")
  resource_missing,
  @JsonValue("routing_number_invalid")
  routing_number_invalid,
  @JsonValue("secret_key_required")
  secret_key_required,
  @JsonValue("sepa_unsupported_account")
  sepa_unsupported_account,
  @JsonValue("setup_attempt_failed")
  setup_attempt_failed,
  @JsonValue("setup_intent_authentication_failure")
  setup_intent_authentication_failure,
  @JsonValue("setup_intent_invalid_parameter")
  setup_intent_invalid_parameter,
  @JsonValue("setup_intent_unexpected_state")
  setup_intent_unexpected_state,
  @JsonValue("shipping_calculation_failed")
  shipping_calculation_failed,
  @JsonValue("sku_inactive")
  sku_inactive,
  @JsonValue("state_unsupported")
  state_unsupported,
  @JsonValue("tax_id_invalid")
  tax_id_invalid,
  @JsonValue("taxes_calculation_failed")
  taxes_calculation_failed,
  @JsonValue("testmode_charges_only")
  testmode_charges_only,
  @JsonValue("tls_version_unsupported")
  tls_version_unsupported,
  @JsonValue("token_already_used")
  token_already_used,
  @JsonValue("token_in_use")
  token_in_use,
  @JsonValue("transfers_not_allowed")
  transfers_not_allowed,
  @JsonValue("upstream_order_creation_failed")
  upstream_order_creation_failed,
  @JsonValue("url_invalid")
  url_invalid,
}
