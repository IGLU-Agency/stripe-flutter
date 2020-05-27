import 'dart:async';
import 'dart:math';

import 'package:stripeflutter/src/api/model/intent_action.dart';
import 'package:stripeflutter/src/api/resources/payment_intents.dart';
import 'package:stripeflutter/src/api/resources/payment_methods.dart';
import 'package:stripeflutter/src/api/resources/setup_intents.dart';
import 'package:stripeflutter/src/utils/json_utils.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api_handler.dart';

typedef Future<dynamic> IntentProvider(Uri uri);

class Stripe {
  static Stripe _instance;

  final StripeApiHandler _apiHandler;

  final String publishableKey;

  final String apiVersion;
  final SupportLocale locale;

  String _returnUrlForSca;

  PaymentIntents paymentIntents;
  PaymentMethods paymentMethods;
  SetupIntents setupIntents;

  /// Creates a new [Stripe] object. Use this constructor if you wish to handle the instance of this class by yourself.
  /// Alternatively, use [Stripe.init] to create a singleton and access it through [Stripe.instance].
  ///
  /// [publishableKey] is your publishable key, beginning with "sk_".
  /// Your can copy your key from https://dashboard.stripe.com/account/apikeys
  ///
  /// [stripeAccount] is the id of a stripe customer and stats with "cus_".
  /// This is a optional parameter.
  ///
  /// [returnUrlForSca] can be used to use your own return url for
  /// Strong Customer Authentication (SCA) such as 3DS, 3DS2, BankID and others.
  /// It is recommended to use your own app specific url scheme and host.
  Stripe(this.publishableKey,
      {this.apiVersion = defaultApiVersion, this.locale = SupportLocale.auto, String stripeAccount, String returnUrlForSca})
      : _apiHandler = StripeApiHandler(stripeAccount: stripeAccount, locale: locale) {
    _validateKey(publishableKey, stripeAccount);
    _returnUrlForSca = returnUrlForSca ?? "stripesdk://3ds.stripesdk.io";
    _apiHandler.apiVersion = apiVersion;
    paymentIntents = PaymentIntents(this);
    paymentMethods = PaymentMethods(this);
    setupIntents = SetupIntents(this);
  }

  /// Initializes the singleton instance of [Stripe]. Afterwards you can
  /// use [Stripe.instance] to access the created instance.
  ///
  /// [publishableKey] is your publishable key, beginning with "sk_".
  /// Your can copy your key from https://dashboard.stripe.com/account/apikeys
  ///
  /// [stripeAccount] is the id of a stripe customer and stats with "cus_".
  /// This is a optional parameter.
  ///
  /// [returnUrlForSca] can be used to use your own return url for
  /// Strong Customer Authentication (SCA) such as 3DS, 3DS2, BankID and others.
  /// It is recommended to use your own app specific url scheme and host. This
  /// parameter must match your "android/app/src/main/AndroidManifest.xml"
  /// and "ios/Runner/Info.plist" configuration.
  static void init(String publishableKey,
      {String apiVersion = defaultApiVersion, String stripeAccount, String returnUrlForSca}) {
    if (_instance == null) {
      _instance = Stripe(publishableKey,
          apiVersion: apiVersion, stripeAccount: stripeAccount, returnUrlForSca: returnUrlForSca);
    }
  }

  /// Access the singleton instance of [Stripe].
  /// Throws an [Exception] if [Stripe.init] hasn't been called previously.
  static Stripe get instance {
    if (_instance == null) {
      throw Exception(
          "Attempted to get singleton instance of StripeApi without initialization");
    }
    return _instance;
  }

  /// Validates the received [publishableKey] and throws a [Exception] if an
  /// invalid key has been submitted.
  static void _validateKey(String publishableKey, String stripeAccount) {
    if (publishableKey == null || publishableKey.isEmpty) {
      throw Exception("Invalid Publishable Key: " +
          "You must use a valid publishable key to create a token.  " +
          "For more info, see https://stripe.com/docs/stripe.js.");
    }
    if ((stripeAccount != null && !stripeAccount.startsWith("acct_"))) {
      throw Exception("Invalid Stripe Account");
    }
  }

  Future<Map<String, dynamic>> request(
      RequestMethod method, String path,
      {Map<String, dynamic> params}) {
    removeNullAndEmptyParams(params);
    return _apiHandler.request(method, path, publishableKey, defaultApiVersion, params: params);
  }

  /// Creates a return URL that can be used to authenticate a single PaymentIntent.
  /// This should be set on the intent before attempting to authenticate it.
  String getReturnUrlForSca() {
    final requestId = Random.secure().nextInt(99999999);
    return "$_returnUrlForSca?requestId=$requestId";
  }

  Future<dynamic> authenticateIntent(IntentAction action, IntentProvider callback) async {
    final url = action.redirectToUrl.url;
    final returnUrl = Uri.parse(action.redirectToUrl.returnUrl);
    final completer = Completer<dynamic>();
    StreamSubscription sub;
    sub = getUriLinksStream().listen((Uri uri) async {
      if (uri.scheme == returnUrl.scheme &&
          uri.host == returnUrl.host &&
          uri.queryParameters['requestId'] == returnUrl.queryParameters['requestId']) {
        await sub.cancel();
        final intent = await callback(uri);
        completer.complete(intent);
      }
    });

    await launch(url, forceSafariVC: false);
    return completer.future;
  }
}

String parseIdFromClientSecret(String clientSecret) {
  return clientSecret.split("_secret")[0];
}

enum SupportLocale {
  auto,
  ar,
  bg,
  cs,
  da,
  de,
  el,
  et,
  en,
  es,
  fi,
  fr,
  he,
  id,
  it,
  ja,
  lt,
  lv,
  ms,
  nb,
  nl,
  pl,
  ptBR,
  pt,
  ru,
  sk,
  sl,
  sv,
  zh
}

extension ParseToString on SupportLocale {
  String toShortString() {
    if (this == SupportLocale.ptBR) {
      return "pt-br";
    }
    return this.toString().split('.').last;
  }
}