import 'package:flutter/material.dart';
import 'package:flutter_payments_stripe_sdk/flutter_payments_stripe_sdk.dart';
import 'package:flutter_payments_stripe_sdk/src/utils/card_utils.dart';
import 'package:flutter_payments_stripe_sdk/src/utils/model_utils.dart';
import 'package:flutter_payments_stripe_sdk/src/utils/text_utils.dart';

class StripeCard {
  static const int CVC_LENGTH_AMERICAN_EXPRESS = 4;
  static const int CVC_LENGTH_COMMON = 3;

  static const String FUNDING_CREDIT = "credit";
  static const String FUNDING_DEBIT = "debit";
  static const String FUNDING_PREPAID = "prepaid";
  static const String FUNDING_UNKNOWN = "unknown";

  /// Based on http://en.wikipedia.org/wiki/Bank_card_number#Issuer_identification_number_.28IIN.29
  static const List<String> PREFIXES_AMERICAN_EXPRESS = ["34", "37"];
  static const List<String> PREFIXES_DISCOVER = ["60", "64", "65"];
  static const List<String> PREFIXES_JCB = ["35"];
  static const List<String> PREFIXES_DINERS_CLUB = [
    "300",
    "301",
    "302",
    "303",
    "304",
    "305",
    "309",
    "36",
    "38",
    "39"
  ];
  static const List<String> PREFIXES_VISA = ["4"];
  static const List<String> PREFIXES_MASTERCARD = [
    "2221",
    "2222",
    "2223",
    "2224",
    "2225",
    "2226",
    "2227",
    "2228",
    "2229",
    "223",
    "224",
    "225",
    "226",
    "227",
    "228",
    "229",
    "23",
    "24",
    "25",
    "26",
    "270",
    "271",
    "2720",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "67"
  ];
  static const List<String> PREFIXES_UNIONPAY = ["62"];

  ///

  static const int MAX_LENGTH_STANDARD = 16;
  static const int MAX_LENGTH_AMERICAN_EXPRESS = 15;
  static const int MAX_LENGTH_DINERS_CLUB = 14;

  String? number;
  String? cvc;
  int? expMonth;
  int? expYear;
  String? name;
  String? addressLine1;
  String? addressLine1Check;
  String? addressLine2;
  String? addressCity;
  String? addressState;
  String? addressZip;
  String? addressZipCheck;
  String? addressCountry;
  String? last4;
  String? funding;
  String? fingerprint;
  String? country;
  String? currency;
  String? customerId;
  String? cvcCheck;
  String? id;

  StripeCard({
    this.number,
    this.cvc,
    this.expMonth,
    this.expYear,
    this.name,
    this.addressLine1,
    this.addressLine1Check,
    this.addressLine2,
    this.addressCity,
    this.addressState,
    this.addressZip,
    this.addressZipCheck,
    this.addressCountry,
    this.last4,
    CardBrand brand = CardBrand.unknown,
    this.funding,
    this.fingerprint,
    this.country,
    this.currency,
    this.customerId,
    this.cvcCheck,
    this.id,
  });

  CardBrand? get brand {
    if (!isBlank(number)) {
      return getPossibleCardType(number);
    } else {
      return CardBrand.unknown;
    }
  }

  AssetImage? get brandImage {
    String? imgString = returnCardImage(brand);
    if (imgString != null) {
      return AssetImage(imgString, package: "flutter_payments_stripe_sdk");
    }
    return null;
  }

  /// Checks whether {@code this} represents a valid card.
  ///
  /// @return {@code true} if valid, {@code false} otherwise.

  bool validateCard() {
    return _validateCard();
  }

  /// Checks whether or not the {@link #number} field is valid.
  ///
  /// @return {@code true} if valid, {@code false} otherwise.
  bool validateNumber() {
    return isValidCardNumber(number);
  }

  bool isEmpty() {
    return (number == null || number?.isEmpty == true) &&
        expMonth == null &&
        expYear == null &&
        (cvc == null || cvc?.isEmpty == true);
  }

  /// Checks whether or not the {@link #expMonth} and {@link #expYear} fields represent a valid
  /// expiry date.
  ///
  /// @return {@code true} if valid, {@code false} otherwise
  bool validateDate() {
    return validateExpiryDate(expMonth, expYear);
  }

  /// Checks whether or not the {@link #cvc} field is valid.
  ///
  /// @return {@code true} if valid, {@code false} otherwise
  bool validateCVC() {
    if (isBlank(cvc)) {
      return false;
    }
    String cvcValue = cvc!.trim();
    CardBrand? updatedType = brand;
    bool validLength =
        (updatedType == null && cvcValue.length >= 3 && cvcValue.length <= 4) ||
            (CardBrand.amex == updatedType && cvcValue.length == 4) ||
            cvcValue.length == 3;

    return ModelUtils.isWholePositiveNumber(cvcValue) && validLength;
  }

  bool _validateCard() {
    if (cvc == null) {
      return validateNumber() && validateDate();
    } else {
      return validateNumber() && validateDate() && validateCVC();
    }
  }

  PaymentMethodData toPaymentMethod() {
    return PaymentMethodData(
        type: PaymentMethodType.card,
        card: CardMethod(
            cvc: cvc, expMonth: expMonth, expYear: expYear, number: number),
        billingDetails: BillingDetails(
            address: Address(
              city: addressCity,
              country: addressCountry,
              line1: addressLine1,
              line2: addressLine2,
              postalCode: addressZip,
              state: addressCountry,
            ),
            name: name));
  }

  /// Converts an unchecked String value to a {@link CardBrand} or {@code null}.
  ///
  /// @param possibleCardType a String that might match a {@link CardBrand} or be empty.
  /// @return {@code null} if the input is blank, else the appropriate {@link CardBrand}.
  static CardBrand? asCardBrand(CardBrand? possibleCardType) {
    if (possibleCardType == null) {
      return null;
    }
    if (CardBrand.amex == possibleCardType) {
      return CardBrand.amex;
    } else if (CardBrand.mastercard == possibleCardType) {
      return CardBrand.mastercard;
    } else if (CardBrand.diners == possibleCardType) {
      return CardBrand.diners;
    } else if (CardBrand.discover == possibleCardType) {
      return CardBrand.discover;
    } else if (CardBrand.jcb == possibleCardType) {
      return CardBrand.jcb;
    } else if (CardBrand.visa == possibleCardType) {
      return CardBrand.visa;
    } else if (CardBrand.unionpay == possibleCardType) {
      return CardBrand.unionpay;
    } else {
      return CardBrand.unknown;
    }
  }

  String? asCardMask() {
    if (brand == null) {
      return null;
    }

    if (CardBrand.amex == brand) {
      return '0000 000000 00000';
    } else if (CardBrand.mastercard == brand) {
      return '0000 0000 0000 0000';
    } else if (CardBrand.diners == brand) {
      return '0000 0000 0000 00';
    } else if (CardBrand.discover == brand) {
      return '0000 0000 0000 0000';
    } else if (CardBrand.jcb == brand) {
      return '0000 0000 0000 0000';
    } else if (CardBrand.visa == brand) {
      return '0000 0000 0000 0000';
    } else if (CardBrand.unionpay == brand) {
      return '0000 0000 0000 0000';
    } else {
      return '0000 0000 0000 0000';
    }
  }

  String? asCardImage() {
    return returnCardImage(brand);
  }

  /// Converts an unchecked String value to a {@link FundingType} or {@code null}.
  ///
  /// @param possibleFundingType a String that might match a {@link FundingType} or be empty
  /// @return {@code null} if the input is blank, else the appropriate {@link FundingType}
  static String? asFundingType(String? possibleFundingType) {
    if (possibleFundingType == null || possibleFundingType.trim().isEmpty) {
      return null;
    }

    if (StripeCard.FUNDING_CREDIT == possibleFundingType) {
      return StripeCard.FUNDING_CREDIT;
    } else if (StripeCard.FUNDING_DEBIT == possibleFundingType) {
      return StripeCard.FUNDING_DEBIT;
    } else if (StripeCard.FUNDING_PREPAID == possibleFundingType) {
      return StripeCard.FUNDING_PREPAID;
    } else {
      return StripeCard.FUNDING_UNKNOWN;
    }
  }
}
