import 'package:stripeflutter/src/api/model/confirm_setup_intent_request.dart';
import 'package:stripeflutter/src/api/model/setup_intent.dart';

import '../../../stripeflutter.dart';
import '../api_handler.dart';
import '../error.dart';
import '../stripe.dart';

class SetupIntents {
  SetupIntents(this._stripe);

  final Stripe _stripe;

  /// Retrieve a SetupIntent.
  /// https://stripe.com/docs/api/setup_intents/retrieve
  retrieveSetupIntent(String clientSecret) async {
    final intentId = parseIdFromClientSecret(clientSecret);
    final path = "/setup_intents/$intentId";
    final params = {'client_secret': clientSecret};
    var result = await _stripe.request(RequestMethod.get, path, params: params);
    if (result.containsKey("isError") && result.containsKey("error")) {
      return StripeError.fromJson(result["error"]);
    } else {
      return SetupIntent.fromJson(result);
    }
  }

  /// Confirm a SetupIntent
  /// https://stripe.com/docs/api/setup_intents/confirm
  confirmSetupIntent(String clientSecret,
      {ConfirmSetupIntentRequest data}) async {
    var params = {};
    if (data != null) {
      params = data.toJson();
    }
    final intent = parseIdFromClientSecret(clientSecret);
    params['client_secret'] = clientSecret;
    params.putIfAbsent("return_url", () => _stripe.getReturnUrlForSca());
    final path = "/setup_intents/$intent/confirm";
    var result =
        await _stripe.request(RequestMethod.post, path, params: params);
    print(result);
    if (result.containsKey("isError") && result.containsKey("error")) {
      return StripeError.fromJson(result["error"]);
    } else {
      var intent = SetupIntent.fromJson(result);
      if (intent.status == SetupIntentStatus.requiresAction &&
          intent.nextAction.type == IntentActionType.redirectToUrl) {
        var result = await _stripe.authenticateIntent(
            intent.nextAction,
            (uri) => retrieveSetupIntent(
                uri.queryParameters['setup_intent_client_secret']));
        return result;
      } else {
        return intent;
      }
    }
  }
}
