import 'package:flutter/material.dart';
import 'package:flutter_payments_stripe_sdk/flutter_payments_stripe_sdk.dart';
import 'dart:convert' show json;
import 'package:http/http.dart' as http;
import 'package:flutter_payments_stripe_sdkexample/separator_line.dart';
import 'dart:convert' as convert;

import 'package:flutter_payments_stripe_sdkexample/text_icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe Flutter SDK Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var rows = ["Create a payment intent", "Create a setup intent"];
  //TODO: INSERT YOUR API KEY
  var stripe = Stripe("pk_test_...");
  var clientSecret = "";
  var setupIntentClientSecret = "";
  //TODO: INSERT YOUR BACKED URL
  var backendUrl = "";
  //TODO: INSERT A CUSTOMER ID
  var customerID = "";
  //
  var testPaymentMethodID = "pm_card_threeDSecure2Required";

  startCheckout() async {
    var url = "$backendUrl/stripe/payment_intents/create";
    var body = {
      "params": {"amount": "200", "currency": "eur", "customer": customerID}
    };
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: convert.json.encode(body));
    var j = json.decode(response.body);
    if (j["data"] != null && j["data"]["clientSecret"] != null) {
      clientSecret = j["data"]["clientSecret"];
      print(clientSecret);
    } else {
      print("SOMETHING WRONG");
    }
  }

  startSetupIntent() async {
    var url = "$backendUrl/stripe/setup_intents/create";
    var body = {
      "params": {"customer": customerID}
    };
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: convert.json.encode(body));
    var j = json.decode(response.body);
    if (j["data"] != null && j["data"]["clientSecret"] != null) {
      setupIntentClientSecret = j["data"]["clientSecret"];
      print(setupIntentClientSecret);
    } else {
      print("SOMETHING WRONG");
    }
  }

  performAction(String item) async {
    if (backendUrl.isEmpty) {
      print("Insert a backed url");
      return;
    }
    if (item == "Create a payment intent") {
      await startCheckout();
      var res = await stripe.paymentIntents.confirmPaymentIntent(clientSecret,
          data: ConfirmPaymentIntentRequest(
              paymentMethod: testPaymentMethodID,
              returnUrl: stripe.getReturnUrlForSca(),
              useStripeSdk: false));
      if (res.runtimeType == StripeError) {
        print((res as StripeError).toJson());
      } else if (res.runtimeType == PaymentIntent) {
        print((res as PaymentIntent).toJson());
      }
    } else if (item == "Create a setup intent") {
      await startSetupIntent();
      var res = await stripe.setupIntents.confirmSetupIntent(
          setupIntentClientSecret,
          data: ConfirmSetupIntentRequest(
              paymentMethod: PaymentMethodData(
                type: PaymentMethodType.card,
                card: CardMethod(
                  cvc: "555",
                  expMonth: 12,
                  expYear: 24,
                  number: "4242424242424242"
                )
              ),
              useStripeSdk: false,
              returnUrl: stripe.getReturnUrlForSca()));
      if (res.runtimeType == StripeError) {
        print((res as StripeError).toJson());
      } else if (res.runtimeType == SetupIntent) {
        print((res as SetupIntent).toJson());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Flutter SDK Example'),
      ),
      body: Padding(
          padding: EdgeInsets.all(0.0),
          child: ListView.separated(
            itemBuilder: (context, index) {
              if (index == rows.length) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: PaymentCardTextField(onCardChanged: (card) {
                    print(card.toMap());
                  }),
                );
              }
              var item = rows[index];
              return TextIcon(
                title: item,
                shapedSelectedBackground: false,
                tapHandler: (d) {
                  performAction(item);
                },
              );
            },
            separatorBuilder: (context, index) {
              return SeparatorLine(margin: EdgeInsets.fromLTRB(20, 0, 0, 0));
            },
            itemCount: rows.length + 1,
          )),
    );
  }
}
