import 'package:flutter/material.dart';

import '../../utils/card_utils.dart';
import '../model/card.dart';
import 'masked_text_controller.dart';

class PaymentCardTextField extends StatefulWidget {
  final bool showZip;
  final Function(StripeCard) onCardChanged;
  final Color primaryColor;
  final Color errorColor;
  final Color backgroundColor;
  final Color textColor;
  final Color hintColor;

  PaymentCardTextField(
      {this.showZip = false,
      this.onCardChanged,
      this.primaryColor = Colors.blue,
      this.errorColor = Colors.red,
      this.backgroundColor = Colors.white,
      this.hintColor,
      this.textColor = const Color.fromRGBO(35, 35, 35, 1)});

  @override
  _PaymentCardTextFieldState createState() => _PaymentCardTextFieldState();
}

class _PaymentCardTextFieldState extends State<PaymentCardTextField> {
  var translator = MaskedTextController.getDefaultTranslator();
  MaskedTextController _cardNumberController;
  MaskedTextController _cardExpirationController =
      MaskedTextController(mask: '00/00');
  MaskedTextController _cardCVVController = MaskedTextController(mask: '000');
  TextEditingController _cardZipController =
      MaskedTextController(mask: '000000');

  StripeCard card = StripeCard();

  FocusNode _cardNumberFocus = FocusNode();
  FocusNode _cardExpirationFocus = FocusNode();
  FocusNode _cardCVVFocus = FocusNode();
  FocusNode _cardZipFocus = FocusNode();

  double _cardNumberWidth;
  double _cardExpirationWidth;
  double _cardCVVWidth;
  double _cardZipWidth;
  double fullWidth;

  Widget _animatedCardWidget;
  Widget _animatedMessageWidget;
  int sizeConfig = 0;
  Color borderColor;

  @override
  void dispose() {
    super.dispose();
    _cardNumberFocus.dispose();
    _cardExpirationFocus.dispose();
    _cardCVVFocus.dispose();
    _cardZipFocus.dispose();
  }

  @override
  void initState() {
    super.initState();

    borderColor = widget.primaryColor;
    themeColor = widget.primaryColor;

    if (widget.showZip) {
      sizeConfig = 0;
    }

    translator.remove('*');

    _cardNumberController = MaskedTextController(
        mask: '0000 0000 0000 0000', translator: translator);

    //_cardNumberController.addListener(_onCardNumberChanged);
    //_cardExpirationController.addListener(_onCardExpirationChanged);
    _cardCVVController.addListener(_onCardCVVChanged);

    _cardNumberFocus.addListener(_onCardNumberFocusChanged);
    _cardExpirationFocus.addListener(_onCardExpirationFocusChanged);
    _cardCVVFocus.addListener(_onCardCVVFocusChanged);
    _cardZipFocus.addListener(_onCardZipFocusChanged);

    _animatedCardWidget = SizedBox(
      key: ValueKey(card.brand),
      height: 24,
      width: 32,
      child: Image(
        image: AssetImage(card.asCardImage(), package: "flutter_payments_stripe_sdk"),
      ),
    );

    _animatedMessageWidget = SizedBox(
      key: ValueKey(1),
      height: 24,
      width: 32,
      child: Icon(
        Icons.check_circle,
        color: widget.primaryColor,
        size: 16,
      ),
    );
  }

  _onCardNumberFocusChanged() {
    if (_cardNumberFocus.hasFocus) {
      setState(() {
        sizeConfig = 0;
        _animatedCardWidget = SizedBox(
          key: ValueKey(card.brand),
          height: 24,
          width: 32,
          child: Image(
            image: AssetImage(card.asCardImage(), package: "flutter_payments_stripe_sdk"),
          ),
        );
      });
    } else {
      if (card.number != null && card.number.length > 4) {
        _cardNumberController.text = card.number.substring(0, 5);
      }
      if (cardLength != null && card.number.isNotEmpty) {
        if (cardLength != null && card.number.length < cardLength) {
          setState(() {
            isCardIncomplete = true;
            themeColor = widget.errorColor;
            validityAlpha = 1;
            validityMessage = 'Your card\'s number is incomplete.';
            _animatedMessageWidget = SizedBox(
              key: ValueKey(1),
              height: 24,
              width: 24,
              child: Icon(
                Icons.cancel,
                color: themeColor,
                size: 16,
              ),
            );
            _animatedCardWidget = SizedBox(
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
            isCardIncomplete = false;
          });
        }
      }
    }
  }

  _onCardExpirationFocusChanged() {
    if (_cardExpirationFocus.hasFocus) {
      setState(() {
        sizeConfig = widget.showZip ? 1 : 2;
      });

      if (isCardIncomplete) {
        setState(() {
          _animatedCardWidget = SizedBox(
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
          _animatedCardWidget = SizedBox(
            key: ValueKey(card.brand),
            height: 24,
            width: 32,
            child: Image(
              image: AssetImage(card.asCardImage(), package: "flutter_payments_stripe_sdk"),
            ),
          );
        });
      }
    } else {
      if (_cardExpirationController.text.isNotEmpty) {
        if (_cardExpirationController.text.length < 5) {
          setState(() {
            themeColor = widget.errorColor;
            validityAlpha = 1;
            validityMessage = 'Your card\'s expiration date is incomplete.';
            _animatedMessageWidget = SizedBox(
              key: ValueKey(1),
              height: 24,
              width: 24,
              child: Icon(
                Icons.cancel,
                color: themeColor,
                size: 16,
              ),
            );
          });
        }
      }
    }
  }

  _onCardCVVFocusChanged() {
    if (_cardCVVFocus.hasFocus) {
      setState(() {
        _animatedCardWidget = SizedBox(
          key: ValueKey(1001),
          height: 24,
          width: 32,
          child: Image(
            image: AssetImage('lib/assets/images/stp_card_cvc.png',
                package: "flutter_payments_stripe_sdk"),
          ),
        );
      });
    } else {
      if (isCardIncomplete) {
        setState(() {
          _animatedCardWidget = SizedBox(
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
          _animatedCardWidget = SizedBox(
            key: ValueKey(card.brand),
            height: 24,
            width: 32,
            child: Image(
              image: AssetImage(card.asCardImage(), package: "flutter_payments_stripe_sdk"),
            ),
          );
        });
      }
      if (cvcCount != null && _cardCVVController.text.length < cvcCount) {
        setState(() {
          themeColor = widget.errorColor;
          validityAlpha = 1;
          validityMessage = 'Your card\'s security code is incomplete.';
          _animatedMessageWidget = SizedBox(
            key: ValueKey(1),
            height: 24,
            width: 24,
            child: Icon(
              Icons.cancel,
              color: themeColor,
              size: 16,
            ),
          );
        });
      }
    }
  }

  _onCardZipFocusChanged() {}

  @override
  Widget build(BuildContext context) {
    fullWidth = MediaQuery.of(context).size.width - 48 - 16 - 24;

    if (sizeConfig == 0) {
      _cardNumberWidth = fullWidth * 0.75;
      _cardExpirationWidth = fullWidth * 0.25;
      _cardCVVWidth = fullWidth * 0.00;
      _cardZipWidth = fullWidth * 0.00;
    } else if (sizeConfig == 1) {
      _cardNumberWidth = fullWidth * 0.25;
      _cardExpirationWidth = fullWidth * 0.30;
      _cardCVVWidth = fullWidth * 0.20;
      _cardZipWidth = fullWidth * 0.25;
    } else if (sizeConfig == 2) {
      _cardNumberWidth = fullWidth * 0.33;
      _cardExpirationWidth = fullWidth * 0.34;
      _cardCVVWidth = fullWidth * 0.33;
      _cardZipWidth = fullWidth * 0.0;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: AnimatedContainer(
            constraints: BoxConstraints(maxWidth: 400),
            duration: Duration(milliseconds: 150),
            height: 50,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(color: themeColor, blurRadius: 2, spreadRadius: 1),
              ],
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
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
                SizedBox(
                  width: 8,
                ),
                AnimatedContainer(
                  onEnd: () {
                    if (sizeConfig == 0) {
                      _cardNumberController.text = card.number;
                    }
                  },
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  duration: Duration(milliseconds: 150),
                  width: _cardNumberWidth,
                  child: TextFormField(
                    onChanged: (val) {
                      if (card.number == null ||
                          (card.number.length <= val.length + 1)) {
                        _onCardNumberChanged();
                      }
                    },
                    onEditingComplete: () {
                      _cardNumberFocus.nextFocus();
                    },
                    textInputAction: TextInputAction.next,
                    controller: _cardNumberController,
                    focusNode: _cardNumberFocus,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: widget.textColor),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Card Number',
                      hintStyle: TextStyle(
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
                  //color: Colors.green,
                  width: _cardExpirationWidth,
                  child: TextFormField(
                    onChanged: (val) {
                      _onCardExpirationChanged();
                    },
                    onEditingComplete: () {
                      _cardExpirationFocus.nextFocus();
                    },
                    textInputAction: TextInputAction.next,
                    controller: _cardExpirationController,
                    textAlign: TextAlign.center,
                    focusNode: _cardExpirationFocus,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: widget.textColor),
                    decoration: InputDecoration.collapsed(
                      hintText: 'MM/YY',
                      hintStyle: TextStyle(
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
                  //color: Colors.grey.shade300,
                  width: _cardCVVWidth,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      onChanged: (val) {
                        _onCardCVVChanged();
                      },
                      onEditingComplete: () {
                        if (widget.showZip) {
                          _cardCVVFocus.nextFocus();
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      textInputAction: widget.showZip
                          ? TextInputAction.next
                          : TextInputAction.done,
                      focusNode: _cardCVVFocus,
                      controller: _cardCVVController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: widget.textColor),
                      decoration: InputDecoration.collapsed(
                        hintText: 'CVV',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: widget.hintColor),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  duration: Duration(milliseconds: 150),
                  //color: Colors.yellow,
                  width: _cardZipWidth,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    focusNode: _cardZipFocus,
                    controller: _cardZipController,
                    textAlign: TextAlign.center,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: widget.textColor),
                    decoration: InputDecoration.collapsed(
                      hintText: 'ZIP',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: widget.hintColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8),
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
                SizedBox(width: 2),
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

  int cardLength;
  bool isCardValid = false;
  bool isCardIncomplete = false;
  Color themeColor;
  int numberCount;
  int cvcCount;
  String validityMessage = '';
  double validityAlpha = 0;

  _onCardNumberChanged() {
    card.number = _cardNumberController.text;
    setState(() {
      _animatedCardWidget = SizedBox(
          key: ValueKey(card.brand),
          height: 24,
          width: 32,
          child: Image(
            image: AssetImage(card.asCardImage(), package: "flutter_payments_stripe_sdk"),
          ));
    });
    if (_cardNumberController.text.length < 4) {
      if (numberCount != null &&
          _cardNumberController.text.length > numberCount) {
        _cardNumberController.updateMask(card.asCardMask());
      }
      numberCount = _cardNumberController.text.length;
      cardLength = getLengthForBrand(card.brand);
      cvcCount = getLengthForCVC(card.brand);

      if (cvcCount == 3) {
        _cardCVVController.updateMask('000');
      } else {
        _cardCVVController.updateMask('0000');
      }
    }

    if (card.number.length == cardLength) {
      isCardValid = isValidCardNumber(card.number);
      setState(() {
        validityAlpha = 1;
        themeColor = widget.primaryColor;
        if (isCardValid) {
          validityMessage = 'Card valid';
          _animatedMessageWidget = SizedBox(
            key: ValueKey(1),
            height: 24,
            width: 24,
            child: Icon(
              Icons.check_circle,
              color: themeColor,
              size: 16,
            ),
          );
        } else {
          themeColor = widget.errorColor;
          validityMessage = 'Card not valid';
          _animatedMessageWidget = SizedBox(
            key: ValueKey(2),
            height: 24,
            width: 24,
            child: Icon(
              Icons.cancel,
              color: themeColor,
              size: 16,
            ),
          );
        }
      });
    } else {
      setState(() {
        themeColor = widget.primaryColor;
        validityAlpha = 0;
      });
    }

    if (widget.onCardChanged != null) {
      widget.onCardChanged(card);
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

    if (_cardExpirationController.text.isEmpty) {
      setState(() {
        themeColor = widget.primaryColor;
        validityAlpha = 0;
      });
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

      if (!validateExpiryDate(card.expMonth, card.expYear)) {
        setState(() {
          themeColor = widget.errorColor;
          validityAlpha = 1;
          validityMessage = 'Your card\'s expiration year is in the past.';
          _animatedMessageWidget = SizedBox(
            key: ValueKey(2),
            height: 24,
            width: 24,
            child: Icon(
              Icons.cancel,
              color: themeColor,
              size: 16,
            ),
          );
        });
      } else {
        setState(() {
          validityAlpha = 0;
          themeColor = widget.primaryColor;
        });
      }
    }

    if (widget.onCardChanged != null) {
      widget.onCardChanged(card);
    }
  }

  _onCardCVVChanged() {
    card.cvc = _cardCVVController.text;
    if (_cardCVVController.text.length == cvcCount) {
      if (!card.validateCVC()) {
        setState(() {
          themeColor = widget.errorColor;
          validityAlpha = 1;
          validityMessage = 'Card\'s CVC not valid.';
        });
      }
    }
    if (widget.onCardChanged != null) {
      widget.onCardChanged(card);
    }
  }
}
