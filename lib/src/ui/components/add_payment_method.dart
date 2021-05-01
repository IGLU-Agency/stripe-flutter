import 'package:flutter/material.dart';
import 'package:flutter_payments_stripe_sdk/src/ui/components/payment_card_text_field.dart';

class AddPaymentMethod extends StatefulWidget {
  final bool showBillingAddressBox;

  AddPaymentMethod({
    this.showBillingAddressBox = false,
  });

  @override
  _AddPaymentMethodState createState() => _AddPaymentMethodState();
}

class _AddPaymentMethodState extends State<AddPaymentMethod> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameAddressController = TextEditingController();
  TextEditingController _streetAddressController = TextEditingController();
  TextEditingController _aptAddressController = TextEditingController();
  TextEditingController _zipAddressController = TextEditingController();
  TextEditingController _cityAddressController = TextEditingController();
  TextEditingController _stateAddressController = TextEditingController();
  TextEditingController _countryAddressController = TextEditingController();

  Widget? _cardAnimatedWidget;

  @override
  void initState() {
    super.initState();
    _cardAnimatedWidget = SizedBox(
      key: ValueKey(3),
      width: 160,
      height: 100,
      child: Image.asset(
        'assets/images/stp_card_form_front.png',
        color: Colors.blueAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return //Material(
        //type: MaterialType.transparency,
        //color: Colors.black26,
        Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.grey.shade800),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Add Card',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.grey.shade800,
          ),
        ),
        actions: <Widget>[
          Container(
            height: 40,
            width: 100,
            child: TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Builder(
            builder: (ctx) => Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // body: Column(
                    // mainAxisSize: MainAxisSize.min,
                    // children: <Widget>[

                    _buildCardIimageContainer(),
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 12),
                      child: PaymentCardTextField(
                        showZip: !widget.showBillingAddressBox,
                      ),
                    ),
                    SizedBox(height: 30),
                    if (widget.showBillingAddressBox)
                      _returnFieldHeader('Billing Address'),
                    SizedBox(height: 8),
                    if (widget.showBillingAddressBox) _buildAddressBox()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /* */

  /*_animateCardImageTo({bool front}) {
    if (front) {
      setState(() {
        _cardAnimatedWidget = SizedBox(
          key: ValueKey(3),
          width: 160,
          height: 100,
          child: Image.asset(
            'assets/images/stp_card_form_front.png',
            color: Colors.blueAccent,
          ),
        );
      });
    } else {
      setState(() {
        _cardAnimatedWidget = SizedBox(
          key: ValueKey(4),
          width: 160,
          height: 100,
          child: Image.asset(
            'assets/images/stp_card_form_back.png',
            color: Colors.blueAccent,
          ),
        );
      });
    }
  }*/

  _buildAddressBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        //borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          _buildTextField(
            hint: 'Name',
            controller: _nameAddressController,
          ),
          _buildTextField(
            hint: 'Address',
            controller: _streetAddressController,
          ),
          _buildTextField(
            hint: 'Apt.',
            controller: _aptAddressController,
          ),
          _buildTextField(
            hint: 'ZIP Code',
            controller: _zipAddressController,
          ),
          _buildTextField(
            hint: 'City',
            controller: _cityAddressController,
          ),
          _buildTextField(
            hint: 'State',
            controller: _stateAddressController,
          ),
          _buildTextField(
            hint: 'Country',
            controller: _countryAddressController,
          )
        ],
      ),
    );
  }

  Widget _buildCardIimageContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 54.0, bottom: 54),
      child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200), child: _cardAnimatedWidget),
    );
  }

  Widget _returnFieldHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Colors.grey.shade600),
      ),
    );
  }

  Widget _buildTextField({
    String? hint,
    TextEditingController? controller,
    Function(String)? onChanged,
  }) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: -11),
              hintText: hint,
              hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        Divider(
          height: 0.5,
        )
      ],
    );
  }
}
