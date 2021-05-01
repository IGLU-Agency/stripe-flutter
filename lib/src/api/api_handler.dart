import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../flutter_payments_stripe_sdk.dart';

const String defaultApiVersion = '2020-08-27';

enum RequestMethod { get, post, put, delete, option }

class StripeApiHandler {
  static const String liveApiBase = "https://api.stripe.com";
  static const String liveLoggingBase = "https://q.stripe.com";
  static const String logginEndpoint = "https://m.stripe.com/4";
  static const String liveApiPath = liveApiBase + "/v1";

  static const String versionName = "27";

  ///Each API request has an associated request identifier.
  ///You can find this value in the response headers, under Request-Id.
  ///You can also find request identifiers in the URLs of individual request logs in your Dashboard.
  ///If you need to contact us about a specific request, providing the request identifier will ensure the fastest possible resolution.
  static const String headerKeyRequestID = "Request-Id";
  static const String fieldError = "error";
  static const String fieldSource = "source";

  String apiVersion = defaultApiVersion;

  static const String malformedResponseMessage =
      "An improperly formatted error response was found.";

  final http.Client _client = http.Client();

  final String? stripeAccount;
  final SupportLocale? locale;

  StripeApiHandler({this.stripeAccount, this.locale});

  Future<Map<String, dynamic>?> request(
      RequestMethod method, String path, String key, String apiVersion,
      {final Map<String, dynamic>? params}) {
    final options = RequestOptions(
        key: key, apiVersion: apiVersion, stripeAccount: stripeAccount);
    return _getStripeResponse(method, liveApiPath + path, options,
        params: params);
  }

  Future<Map<String, dynamic>?> _getStripeResponse(
      RequestMethod method, final String url, final RequestOptions options,
      {Map<String, dynamic>? params}) async {
    final headers = _headers(options: options);

    http.Response response;

    switch (method) {
      case RequestMethod.get:
        String fUrl = url;
        if (params != null && params.isNotEmpty) {
          fUrl = "$url?${_encodeMap(params)}";
        }
        response = await _client.get(Uri.parse(fUrl),
            headers: headers as Map<String, String>?);
        break;

      case RequestMethod.post:
        response = await _client.post(
          Uri.parse(url),
          headers: headers as Map<String, String>?,
          body: params != null ? _urlEncodeMap(params) : null,
        );
        break;

      case RequestMethod.delete:
        response = await _client.delete(Uri.parse(url),
            headers: headers as Map<String, String>?);
        break;
      default:
        throw Exception("Request Method: $method not implemented");
    }

    final requestId = response.headers[headerKeyRequestID];
    final statusCode = response.statusCode;
    Map<String, dynamic>? resp;
    try {
      resp = json.decode(response.body);
    } catch (error) {
      return {
        "isError": true,
        "error": {
          "type": "general",
          "message": "Unknown Error",
          "requestId": requestId
        }
      };
    }
    if (statusCode < 200 || statusCode >= 300) {
      final Map<String, dynamic> errBody = resp![fieldError];
      errBody["requestId"] = requestId;
      return {"isError": true, "error": errBody};
    } else {
      return resp;
    }
  }

  ///
  ///
  ///
  static Map<String, String?> _headers({RequestOptions? options}) {
    final Map<String, String?> headers = Map();
    headers["Accept-Charset"] = "UTF-8";
    headers["Accept"] = "application/json";
    headers["Content-Type"] = "application/x-www-form-urlencoded";
    headers["User-Agent"] = "Stripe/v1Dart/$versionName";

    if (options != null) {
      headers["Authorization"] = "Bearer ${options.key}";
    }

    // debug headers
    Map<String, String> propertyMap = Map();
    propertyMap["os.name"] = defaultTargetPlatform.toString();
    propertyMap["bindings.version"] = versionName;
    propertyMap["lang"] = "Dart";
    propertyMap["publisher"] = "luca@iaconelli.it";

    headers["X-Stripe-Client-User-Agent"] = json.encode(propertyMap);

    if (options != null) {
      headers["Stripe-Version"] = options.apiVersion;

      if (options.stripeAccount != null) {
        headers["Stripe-Account"] = options.stripeAccount;
      }
    }

    return headers;
  }

  static String _encodeMap(Map<String, dynamic> params) {
    return params.keys
        .map((key) =>
            '${Uri.encodeComponent(key)}=${Uri.encodeComponent(params[key].toString())}')
        .join('&');
  }

  static String _urlEncodeMap(dynamic data) {
    StringBuffer urlData = StringBuffer("");
    bool first = true;
    void urlEncode(dynamic sub, String path) {
      if (sub is List) {
        for (int i = 0; i < sub.length; i++) {
          urlEncode(sub[i], "$path%5B%5D");
        }
      } else if (sub is Map) {
        sub.forEach((k, v) {
          if (path == "") {
            urlEncode(v, "${Uri.encodeQueryComponent(k)}");
          } else {
            urlEncode(v, "$path%5B${Uri.encodeQueryComponent(k)}%5D");
          }
        });
      } else {
        if (!first) {
          urlData.write("&");
        }
        first = false;
        urlData.write("$path=${Uri.encodeQueryComponent(sub.toString())}");
      }
    }

    urlEncode(data, "");
    return urlData.toString();
  }
}

class RequestOptions {
  static const String TYPE_QUERY = "source";
  static const String TYPE_JSON = "json_data";

  final String apiVersion;
  final String? guid;
  final String? key;
  final String? requestType;
  final String? stripeAccount;

  RequestOptions({
    required this.apiVersion,
    this.guid,
    this.key,
    this.requestType,
    this.stripeAccount,
  });
}
