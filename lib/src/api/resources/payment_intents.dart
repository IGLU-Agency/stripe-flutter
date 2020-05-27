import 'package:stripeflutter/src/api/model/confirm_payment_intent_request.dart';
import 'package:stripeflutter/src/api/model/payment_intent.dart';

import '../../../stripeflutter.dart';
import '../api_handler.dart';
import '../error.dart';
import '../stripe.dart';

class PaymentIntents {
  PaymentIntents(this._stripe);
  final Stripe _stripe;

  /// Retrieve a PaymentIntent.
  /// https://stripe.com/docs/api/payment_intents/retrieve
  retrievePaymentIntent(String clientSecret, {String apiVersion}) async {
    final intentId = parseIdFromClientSecret(clientSecret);
    final path = "/payment_intents/$intentId";
    final params = {'client_secret': clientSecret};
    var result = await _stripe.request(RequestMethod.get, path, params: params);
    if (result.containsKey("isError") && result.containsKey("error")) {
      return StripeError.fromJson(result["error"]);
    } else {
      return PaymentIntent.fromJson(result);
    }
  }

  /// Confirm a PaymentIntent
  /// https://stripe.com/docs/api/payment_intents/confirm
  confirmPaymentIntent(String clientSecret,
      {ConfirmPaymentIntentRequest data}) async {
    var params = {};
    if (data != null) {
      params = data.toJson();
    }
    final intent = parseIdFromClientSecret(clientSecret);
    params['client_secret'] = clientSecret;
    params.putIfAbsent("return_url", () => _stripe.getReturnUrlForSca());
    final path = "/payment_intents/$intent/confirm";
    var result =
        await _stripe.request(RequestMethod.post, path, params: params);
    if (result.containsKey("isError") && result.containsKey("error")) {
      return StripeError.fromJson(result["error"]);
    } else {
      var intent = PaymentIntent.fromJson(result);
      if (intent.status == PaymentIntentStatus.requiresAction &&
          intent.nextAction.type == IntentActionType.redirectToUrl) {
        var result = await _stripe.authenticateIntent(
            intent.nextAction,
            (uri) => retrievePaymentIntent(
                uri.queryParameters['payment_intent_client_secret']));
        return result;
      } else {
        return intent;
      }
    }
  }
}
