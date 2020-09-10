import '../../flutter_payments_stripe_sdk.dart';

String returnCardImage(CardBrand brand) {
  if (brand == null) {
    return null;
  }
  if (CardBrand.amex == brand) {
    return 'lib/assets/images/stp_card_amex.png';
  } else if (CardBrand.mastercard == brand) {
    return 'lib/assets/images/stp_card_mastercard.png';
  } else if (CardBrand.diners == brand) {
    return 'lib/assets/images/stp_card_diners.png';
  } else if (CardBrand.discover == brand) {
    return 'lib/assets/images/stp_card_discover.png';
  } else if (CardBrand.jcb == brand) {
    return 'lib/assets/images/stp_card_jcb.png';
  } else if (CardBrand.visa == brand) {
    return 'lib/assets/images/stp_card_visa.png';
  } else if (CardBrand.unionpay == brand) {
    return 'lib/assets/images/stp_card_unionpay_en.png';
  } else {
    return 'lib/assets/images/stp_card_unknown.png';
  }
}
