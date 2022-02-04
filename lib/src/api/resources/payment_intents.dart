import 'package:flutter_payments_stripe_sdk/src/api/api_handler.dart';

import '../../../flutter_payments_stripe_sdk.dart';

class PaymentIntents {
  PaymentIntents(this._stripe);
  final Stripe _stripe;

  /// Retrieve a PaymentIntent.
  /// https://stripe.com/docs/api/payment_intents/retrieve
  retrievePaymentIntent(String clientSecret, {String? apiVersion}) async {
    final intentId = parseIdFromClientSecret(clientSecret);
    final path = "/payment_intents/$intentId";
    final params = {'client_secret': clientSecret};
    var result =
        await (_stripe.request(RequestMethod.get, path, params: params));
    if (result != null) {
      if (result.containsKey("isError") && result.containsKey("error")) {
        return StripeError.fromJson(result["error"]);
      } else {
        return PaymentIntent.fromJson(result);
      }
    } else {
      return PaymentIntent.fromJson({});
    }
  }

  /// Confirm a PaymentIntent
  /// https://stripe.com/docs/api/payment_intents/confirm
  confirmPaymentIntent(String clientSecret,
      {ConfirmPaymentIntentRequest? data}) async {
    var params = {};
    if (data != null) {
      params = data.toJson();
    }
    final intent = parseIdFromClientSecret(clientSecret);
    params['client_secret'] = clientSecret;
    params.putIfAbsent("return_url", () => _stripe.getReturnUrlForSca());
    final path = "/payment_intents/$intent/confirm";
    var result = await (_stripe.request(RequestMethod.post, path,
        params: params as Map<String, dynamic>));
    if (result != null) {
      if (result.containsKey("isError") && result.containsKey("error")) {
        return StripeError.fromJson(result["error"]);
      } else {
        var intent = PaymentIntent.fromJson(result);
        if (intent.status == PaymentIntentStatus.requiresAction &&
            intent.nextAction!.type == IntentActionType.redirectToUrl) {
          var result = await _stripe.authenticateIntent(
              intent.nextAction!,
              (uri) => retrievePaymentIntent(
                  uri!.queryParameters['payment_intent_client_secret']!));
          return result;
        } else {
          return intent;
        }
      }
    }
  }
}
