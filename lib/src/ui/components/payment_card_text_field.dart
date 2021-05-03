import 'package:flutter/material.dart';

import '../../utils/card_utils.dart';
import '../model/card.dart';
import 'masked_text_controller.dart';

class PaymentCardTextField extends StatefulWidget {
  final Function(StripeCard)? onCardChanged;
  final Color primaryColor;
  final Color errorColor;
  final Color backgroundColor;
  final Color textColor;
  final Color? hintColor;
  final bool autoFocus;
  final Brightness? keyboardAppearance;

  final String? cardHintText;
  final String? cvcHintText;
  final String? expHintText;
  final TextStyle? hintStyle;

  final TextStyle? Function(PaymentCardTextFieldStatus, StripeCard)? style;

  final String Function(PaymentCardTextFieldError)? validationMessage;
  final Widget Function(PaymentCardTextFieldError)? validationIcon;

  final bool showShadow;
  final List<BoxShadow>? boxShadow;
  final BoxDecoration? Function(PaymentCardTextFieldStatus, StripeCard)?
      decoration;
  final BoxBorder Function(PaymentCardTextFieldStatus, StripeCard)? border;
  final BorderRadiusGeometry? borderRadius;

  final double height;
  final BoxConstraints? constraints;

  final EdgeInsets? textFieldPadding;

  final EdgeInsets? validityPadding;
  final bool showValidityWidget;

  PaymentCardTextField({
    this.onCardChanged,
    this.primaryColor = Colors.blue,
    this.errorColor = Colors.red,
    this.backgroundColor = Colors.white,
    this.hintColor,
    this.autoFocus = false,
    this.keyboardAppearance,
    this.textColor = const Color.fromRGBO(35, 35, 35, 1),
    this.cardHintText,
    this.cvcHintText,
    this.expHintText,
    this.hintStyle,
    this.style,
    this.validationMessage,
    this.validationIcon,
    this.boxShadow,
    this.height = 50,
    this.constraints,
    this.border,
    this.decoration,
    this.textFieldPadding,
    this.validityPadding,
    this.borderRadius,
    this.showValidityWidget = true,
    this.showShadow = true,
  });

  @override
  _PaymentCardTextFieldState createState() => _PaymentCardTextFieldState();
}

class _PaymentCardTextFieldState extends State<PaymentCardTextField> {
  var translator = MaskedTextController.getDefaultTranslator();
  MaskedTextController? _cardNumberController;
  MaskedTextController _cardExpirationController =
      MaskedTextController(mask: '00/00');
  MaskedTextController _cardCVCController = MaskedTextController(mask: '000');

  StripeCard card = StripeCard();

  FocusNode _cardNumberFocus = FocusNode();
  FocusNode _cardExpirationFocus = FocusNode();
  FocusNode _cardCVCFocus = FocusNode();

  double? _cardNumberWidth;
  double? _cardExpirationWidth;
  double? _cardCVCWidth;
  late double fullWidth;

  Widget? _animatedCardWidget;
  Widget? _animatedMessageWidget;
  int sizeConfig = 0;

  int? cardLength;
  bool isCardValid = false;
  bool isCardIncomplete = false;
  Color? themeColor;
  int? numberCount;
  int? cvcCount;
  String validityMessage = '';
  double validityAlpha = 0;

  PaymentCardTextFieldStatus status = PaymentCardTextFieldStatus.success;
  PaymentCardTextFieldError? error;

  @override
  void dispose() {
    super.dispose();
    _cardNumberFocus.dispose();
    _cardExpirationFocus.dispose();
    _cardCVCFocus.dispose();
  }

  @override
  void initState() {
    super.initState();

    themeColor = widget.primaryColor;

    translator.remove('*');

    _cardNumberController = MaskedTextController(
        mask: '0000 0000 0000 0000', translator: translator);

    _cardCVCController.addListener(_onCardCVCFocusChanged);
    _cardNumberFocus.addListener(_onCardNumberFocusChanged);
    _cardExpirationFocus.addListener(_onCardExpirationFocusChanged);
    _cardCVCFocus.addListener(_onCardCVCFocusChanged);

    _animatedCardWidget = Container(
      key: ValueKey(card.brand),
      height: 24,
      width: 32,
      child: Image(
        image: AssetImage(card.asCardImage() ?? "",
            package: "flutter_payments_stripe_sdk"),
      ),
    );

    _animatedMessageWidget = Container();
  }

  @override
  Widget build(BuildContext context) {
    _widthCalc();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:
              widget.textFieldPadding ?? EdgeInsets.symmetric(horizontal: 12.0),
          child: AnimatedContainer(
            constraints: widget.constraints ?? BoxConstraints(maxWidth: 400),
            duration: Duration(milliseconds: 150),
            height: widget.height,
            decoration: widget.decoration != null
                ? widget.decoration!(status, card)
                : BoxDecoration(
                    color: widget.backgroundColor,
                    border: widget.border != null
                        ? widget.border!(status, card)
                        : null,
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(6),
                    boxShadow: widget.showShadow
                        ? widget.boxShadow ??
                            [
                              BoxShadow(
                                  color: themeColor!,
                                  blurRadius: 2,
                                  spreadRadius: 1),
                            ]
                        : null,
                  ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 12,
                ),
                AnimatedSwitcher(
                    duration: Duration(milliseconds: 100),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: _animatedCardWidget),
                Container(
                  width: 8,
                ),
                AnimatedContainer(
                  onEnd: () {
                    if (sizeConfig == 0) {
                      _cardNumberController!.text = card.number ?? "";
                    }
                  },
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  duration: Duration(milliseconds: 150),
                  width: _cardNumberWidth,
                  child: TextFormField(
                    onChanged: (val) {
                      if (card.number == null ||
                          (card.number!.length <= val.length + 1)) {
                        _onCardNumberChanged();
                      }
                    },
                    onEditingComplete: () {
                      _cardNumberFocus.nextFocus();
                    },
                    cursorColor: themeColor,
                    keyboardAppearance: widget.keyboardAppearance,
                    autofocus: widget.autoFocus,
                    textInputAction: TextInputAction.next,
                    controller: _cardNumberController,
                    focusNode: _cardNumberFocus,
                    style: widget.style != null
                        ? widget.style!(status, card)
                        : TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: widget.textColor),
                    decoration: InputDecoration.collapsed(
                      hintText: widget.cardHintText ?? 'Card Number',
                      hintStyle: widget.hintStyle ??
                          TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: widget.hintColor),
                    ),
                  ),
                ),
                AnimatedContainer(
                  onEnd: () {
                    setState(() {});
                  },
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  duration: Duration(milliseconds: 150),
                  width: _cardExpirationWidth,
                  child: TextFormField(
                    onChanged: (val) {
                      _onCardExpirationChanged();
                    },
                    onEditingComplete: () {
                      _cardExpirationFocus.nextFocus();
                    },
                    cursorColor: themeColor,
                    keyboardAppearance: widget.keyboardAppearance,
                    textInputAction: TextInputAction.next,
                    controller: _cardExpirationController,
                    textAlign: TextAlign.center,
                    focusNode: _cardExpirationFocus,
                    style: widget.style != null
                        ? widget.style!(status, card)
                        : TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: widget.textColor),
                    decoration: InputDecoration.collapsed(
                      hintText: widget.expHintText ?? 'MM/YY',
                      hintStyle: widget.hintStyle ??
                          TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: widget.hintColor),
                    ),
                  ),
                ),
                AnimatedContainer(
                  onEnd: () {
                    setState(() {});
                  },
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  duration: Duration(milliseconds: 150),
                  width: _cardCVCWidth,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      onChanged: (val) {
                        _onCardCVCChanged();
                      },
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      keyboardAppearance: widget.keyboardAppearance,
                      textInputAction: TextInputAction.done,
                      cursorColor: themeColor,
                      focusNode: _cardCVCFocus,
                      controller: _cardCVCController,
                      textAlign: TextAlign.center,
                      style: widget.style != null
                          ? widget.style!(status, card)
                          : TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: widget.textColor),
                      decoration: InputDecoration.collapsed(
                        hintText: widget.cvcHintText ?? 'CVC',
                        hintStyle: widget.hintStyle ??
                            TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: widget.hintColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 8,
                ),
              ],
            ),
          ),
        ),
        if (widget.showValidityWidget &&
            validityMessage.isNotEmpty &&
            validityAlpha == 1)
          Padding(
            padding: widget.validityPadding ??
                EdgeInsets.only(left: 20.0, right: 20.0, top: 8),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 150),
              opacity: validityAlpha,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 150),
                    child: _animatedMessageWidget,
                  ),
                  Container(width: 2),
                  Text(
                    validityMessage,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: themeColor),
                  )
                ],
              ),
            ),
          )
      ],
    );
  }

  _widthCalc() {
    fullWidth = MediaQuery.of(context).size.width - 48 - 16 - 24;
    if (widget.border != null) {
      fullWidth =
          fullWidth - widget.border!(status, card).dimensions.horizontal;
    }
    if (sizeConfig == 0) {
      _cardNumberWidth = fullWidth * 0.75;
      _cardExpirationWidth = fullWidth * 0.25;
      _cardCVCWidth = fullWidth * 0.00;
    } else if (sizeConfig == 1) {
      _cardNumberWidth = fullWidth * 0.65;
      _cardExpirationWidth = fullWidth * 0.20;
      _cardCVCWidth = fullWidth * 0.15;
    } else if (sizeConfig == 2) {
      _cardNumberWidth = fullWidth * 0.65;
      _cardExpirationWidth = fullWidth * 0.20;
      _cardCVCWidth = fullWidth * 0.15;
    }
  }

  _onCardNumberFocusChanged() {
    if (_cardNumberFocus.hasFocus) {
      sizeConfig = 0;
      _cardNumberController!.text = card.number ?? "";
      _setImageCard();
    } else {
      if (card.number != null && card.number!.length > 4) {
        _cardNumberController!.text = card.number!.substring(0, 5);
      }
      _setImageCard();
      _onValidation();
    }
  }

  _onCardExpirationFocusChanged() {
    sizeConfig = 2;
    _setImageCard(showCvc: _cardCVCFocus.hasFocus);
    _onValidation();
  }

  _onCardCVCFocusChanged() {
    sizeConfig = 2;
    _setImageCard(showCvc: _cardCVCFocus.hasFocus);
    _onValidation();
  }

  _onCardNumberChanged() {
    card.number = _cardNumberController!.text;
    _setImageCard();
    if (_cardNumberController!.text.length < 4) {
      if (numberCount != null &&
          _cardNumberController!.text.length > numberCount!) {
        _cardNumberController!.updateMask(card.asCardMask() ?? "");
      }
      numberCount = _cardNumberController!.text.length;
      cardLength = getLengthForBrand(card.brand);
      cvcCount = getLengthForCVC(card.brand);
      if (cvcCount == 3) {
        _cardCVCController.updateMask('000');
      } else {
        _cardCVCController.updateMask('0000');
      }
    }
    _onValidation();
    if (widget.onCardChanged != null) {
      widget.onCardChanged!(card);
    }
    if (cardLength == _cardNumberController?.text.length) {
      FocusScope.of(context).nextFocus();
    }
  }

  _onCardExpirationChanged() {
    if (_cardExpirationController.text.length == 1) {
      if (_cardExpirationController.text != '1' &&
          _cardExpirationController.text != '0' &&
          _cardExpirationController.text.isNotEmpty) {
        _cardExpirationController.text =
            ('0' + _cardExpirationController.text + '/');
      }
    } else if (_cardExpirationController.text.length >= 2) {
      if ((_cardExpirationController.text.substring(0, 1) == '1' ||
              _cardExpirationController.text.substring(0, 1) == '0') &&
          _cardExpirationController.text.isNotEmpty &&
          _cardExpirationController.text.substring(1, 2) != '0' &&
          _cardExpirationController.text.substring(1, 2) != '1' &&
          _cardExpirationController.text.substring(1, 2) != '2') {
        _cardExpirationController.text = _cardExpirationController.text;
      }
    }
    card.expMonth = null;
    card.expYear = null;
    if (_cardExpirationController.text.length > 1 &&
        _cardExpirationController.text.length < 5) {
      card.expMonth = int.parse(_cardExpirationController.text.substring(0, 2));
    }
    if (_cardExpirationController.text.length == 5) {
      card.expMonth = int.parse(_cardExpirationController.text.substring(0, 2));
      card.expYear = int.parse(_cardExpirationController.text.substring(3, 5));
    }
    _onValidation();
    if (widget.onCardChanged != null) {
      widget.onCardChanged!(card);
    }
    if (_cardExpirationController.text.length == 5) {
      FocusScope.of(context).nextFocus();
    }
  }

  _onCardCVCChanged() {
    card.cvc = _cardCVCController.text;
    _onValidation();
    if (widget.onCardChanged != null) {
      widget.onCardChanged!(card);
    }
  }

  //CARD IMAGE
  _setImageCard({bool forceCardBrand = false, bool showCvc = false}) {
    if (forceCardBrand) {
      setState(() {
        _animatedCardWidget = Container(
            key: ValueKey(card.brand),
            height: 24,
            width: 32,
            child: Image(
              image: AssetImage(card.asCardImage() ?? "",
                  package: "flutter_payments_stripe_sdk"),
            ));
      });
      return;
    }
    var v1 = !card.isEmpty() &&
        (card.number?.length == cardLength && !card.validateNumber());
    var v2 = !card.isEmpty() &&
        (card.cvc?.length == cvcCount && !card.validateCVC());
    var v3 = !card.isEmpty() &&
        (card.expMonth != null && card.expYear != null && !card.validateDate());
    if (v1 || v2 || v3) {
      setState(() {
        _animatedCardWidget = Container(
          key: ValueKey(3),
          height: 24,
          width: 32,
          child: Image(
            image: AssetImage(
              'lib/assets/images/stp_card_error.png',
              package: "flutter_payments_stripe_sdk",
            ),
          ),
        );
      });
    } else {
      setState(() {
        if (showCvc) {
          _animatedCardWidget = Container(
            key: ValueKey(1001),
            height: 24,
            width: 32,
            child: Image(
              image: AssetImage('lib/assets/images/stp_card_cvc.png',
                  package: "flutter_payments_stripe_sdk"),
            ),
          );
        } else {
          _animatedCardWidget = Container(
            key: ValueKey(card.brand),
            height: 24,
            width: 32,
            child: Image(
              image: AssetImage(card.asCardImage() ?? "",
                  package: "flutter_payments_stripe_sdk"),
            ),
          );
        }
      });
    }
  }

  //VALIDATION
  _onValidation() {
    var errorFound = false;
    _setSuccess();

    //CVC
    if (!errorFound && !_cardCVCFocus.hasFocus) {
      if (_cardCVCController.text.length == cvcCount) {
        if (!card.validateCVC()) {
          errorFound = true;
          _setError();
          error = PaymentCardTextFieldError.cvcNotValid;
          validityMessage = widget.validationMessage != null
              ? widget.validationMessage!(PaymentCardTextFieldError.cvcNotValid)
              : 'Card\'s CVC not valid.';
        }
      } else if (_cardCVCController.text.isNotEmpty) {
        errorFound = true;
        _setError();
        error = PaymentCardTextFieldError.securityCodeIncomplete;
        validityMessage = widget.validationMessage != null
            ? widget.validationMessage!(
                PaymentCardTextFieldError.securityCodeIncomplete)
            : 'Your card\'s security code is incomplete.';
        _animatedMessageWidget = Container(
          key: ValueKey(1),
          height: 24,
          width: 24,
          child: widget.validationIcon != null
              ? widget.validationIcon!(
                  PaymentCardTextFieldError.securityCodeIncomplete)
              : Icon(
                  Icons.cancel,
                  color: themeColor,
                  size: 16,
                ),
        );
      }
    }

    //DATE
    if (!errorFound && !_cardExpirationFocus.hasFocus) {
      if (_cardExpirationController.text.isNotEmpty) {
        if (_cardExpirationController.text.length < 5) {
          errorFound = true;
          _setError();
          error = PaymentCardTextFieldError.expirationDateIncomplete;
          validityMessage = widget.validationMessage != null
              ? widget.validationMessage!(
                  PaymentCardTextFieldError.expirationDateIncomplete)
              : 'Your card\'s expiration date is incomplete.';
          _animatedMessageWidget = Container(
            key: ValueKey(1),
            height: 24,
            width: 24,
            child: widget.validationIcon != null
                ? widget.validationIcon!(
                    PaymentCardTextFieldError.expirationDateIncomplete)
                : Icon(
                    Icons.cancel,
                    color: themeColor,
                    size: 16,
                  ),
          );
        } else if (!card.validateDate()) {
          errorFound = true;
          _setError();
          error = PaymentCardTextFieldError.expirationYearIsInThePast;
          validityMessage = widget.validationMessage != null
              ? widget.validationMessage!(
                  PaymentCardTextFieldError.expirationYearIsInThePast)
              : 'Your card\'s expiration year is in the past.';
          _animatedMessageWidget = Container(
            key: ValueKey(2),
            height: 24,
            width: 24,
            child: widget.validationIcon != null
                ? widget.validationIcon!(
                    PaymentCardTextFieldError.expirationYearIsInThePast)
                : Icon(
                    Icons.cancel,
                    color: themeColor,
                    size: 16,
                  ),
          );
        }
      }
    }

    //CARD NUMBER
    if (!errorFound && !_cardNumberFocus.hasFocus) {
      if (card.number?.length == cardLength) {
        if (!card.validateNumber()) {
          errorFound = true;
          _setError();
          error = PaymentCardTextFieldError.cardNotValid;
          validityMessage = widget.validationMessage != null
              ? widget
                  .validationMessage!(PaymentCardTextFieldError.cardNotValid)
              : 'Your card number is invalid.';
          _animatedMessageWidget = Container(
            key: ValueKey(2),
            height: 24,
            width: 24,
            child: widget.validationIcon != null
                ? widget.validationIcon!(PaymentCardTextFieldError.cardNotValid)
                : Icon(
                    Icons.cancel,
                    color: themeColor,
                    size: 16,
                  ),
          );
        }
      } else {
        isCardIncomplete = true;
        errorFound = true;
        _setError();
        error = PaymentCardTextFieldError.cardIncomplete;
        validityMessage = widget.validationMessage != null
            ? widget
                .validationMessage!(PaymentCardTextFieldError.cardIncomplete)
            : 'Your card\'s number is incomplete.';
        _animatedMessageWidget = Container(
          key: ValueKey(1),
          height: 24,
          width: 24,
          child: widget.validationIcon != null
              ? widget.validationIcon!(PaymentCardTextFieldError.cardIncomplete)
              : Icon(
                  Icons.cancel,
                  color: themeColor,
                  size: 16,
                ),
        );
        _animatedCardWidget = Container(
          key: ValueKey(3),
          height: 24,
          width: 32,
          child: Image(
            image: AssetImage(
              'lib/assets/images/stp_card_error.png',
              package: "flutter_payments_stripe_sdk",
            ),
          ),
        );
      }
    }

    if (card.validateCard()) {
      sizeConfig = 2;
    }

    setState(() {});
  }

  _setError() {
    themeColor = widget.errorColor;
    validityAlpha = 1;
    status = PaymentCardTextFieldStatus.error;
  }

  _setSuccess() {
    isCardIncomplete = false;
    validityAlpha = 0;
    validityMessage = "";
    status = PaymentCardTextFieldStatus.success;
    themeColor = widget.primaryColor;
    _animatedMessageWidget = Container();
  }
}

enum PaymentCardTextFieldError {
  cvcNotValid,
  expirationYearIsInThePast,
  cardNotValid,
  cardIncomplete,
  expirationDateIncomplete,
  securityCodeIncomplete
}

enum PaymentCardTextFieldStatus { success, error }
