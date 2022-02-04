import 'dart:async';

import '../../../flutter_payments_stripe_sdk.dart';
import '../api_handler.dart';

class SetupIntents {
  SetupIntents(this._stripe);

  final Stripe _stripe;

  /// Retrieve a SetupIntent.
  /// https://stripe.com/docs/api/setup_intents/retrieve
  retrieveSetupIntent(String clientSecret) async {
    final intentId = parseIdFromClientSecret(clientSecret);
    final path = "/setup_intents/$intentId";
    final params = {'client_secret': clientSecret};
    var result = await (_stripe.request(RequestMethod.get, path, params: params)
        as FutureOr<Map<String, dynamic>>);
    if (result.containsKey("isError") && result.containsKey("error")) {
      return StripeError.fromJson(result["error"]);
    } else {
      return SetupIntent.fromJson(result);
    }
  }

  /// Confirm a SetupIntent
  /// https://stripe.com/docs/api/setup_intents/confirm
  confirmSetupIntent(String clientSecret,
      {ConfirmSetupIntentRequest? data,
      ConfirmSetupIntentRequestPID? data1}) async {
    Map<dynamic, dynamic>? params = {};
    if (data != null) {
      dynamic data1 = data;
      var pm = await _stripe.paymentMethods.create(data.paymentMethod!);
      if (pm.runtimeType == StripeError) {
        return pm;
      } else if (pm.runtimeType == PaymentMethod) {
        data1 = ConfirmSetupIntentRequestPID(
            paymentMethod: pm.id,
            returnUrl: data.returnUrl,
            mandateData: data.mandateData,
            useStripeSdk: data.useStripeSdk);
      } else {
        return null;
      }
      params = data1.toJson();
    } else if (data1 != null) {
      params = data1.toJson();
    }
    final intent = parseIdFromClientSecret(clientSecret);
    params!['client_secret'] = clientSecret;
    params.putIfAbsent("return_url", () => _stripe.getReturnUrlForSca());
    final path = "/setup_intents/$intent/confirm";
    var result = await (_stripe.request(RequestMethod.post, path,
        params: params as Map<String, dynamic>));
    if (result != null) {
      if (result.containsKey("isError") && result.containsKey("error")) {
        return StripeError.fromJson(result["error"]);
      } else {
        var intent = SetupIntent.fromJson(result);
        if (intent.status == SetupIntentStatus.requiresAction &&
            intent.nextAction!.type == IntentActionType.redirectToUrl) {
          var result = await _stripe.authenticateIntent(
              intent.nextAction!,
              (uri) => retrieveSetupIntent(
                  uri!.queryParameters['setup_intent_client_secret']!));
          return result;
        } else {
          return intent;
        }
      }
    }
  }
}
