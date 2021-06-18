import 'package:flutter_payments_stripe_sdk/src/api/error.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/payment_method.dart';
import 'package:flutter_payments_stripe_sdk/src/api/model/payment_method_data.dart';

import '../api_handler.dart';
import '../stripe.dart';

class PaymentMethods {
  PaymentMethods(this._stripe);

  final Stripe _stripe;

  /// Use stripe.paymentMethods.create to convert payment information collected by elements into a PaymentMethod object that you safely pass to your server to use in an API call.
  /// NOTE: In most integrations, you will not need to use this method. Instead, use methods like stripe.paymentIntents.confirm, which will automatically create a PaymentMethod when you confirm a PaymentIntent.
  create(PaymentMethodData params) async {
    var result = await (_stripe.request(RequestMethod.post, "/payment_methods",
        params: params.toJson()));
    if (result != null) {
      if (result.containsKey("isError") && result.containsKey("error")) {
        return StripeError.fromJson(result["error"]);
      } else {
        return PaymentMethod.fromJson(result);
      }
    } else {
      return PaymentMethod.fromJson({});
    }
  }
}
