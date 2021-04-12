import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_otp_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:country_list_pick/country_list_pick.dart';

import '../font_size_screen.dart';

class SignInNumberScreen extends StatefulWidget {
  final String countryCode;
  SignInNumberScreen({
    @required this.countryCode,
  });
  @override
  _SignInNumberScreenState createState() => _SignInNumberScreenState();
}

class _SignInNumberScreenState extends State<SignInNumberScreen> {
  TextEditingController _numberController = new TextEditingController();
  String number;
  bool _validationEmptyError = false;

  @override
  void initState() {
    super.initState();
    _numberController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign in using OTP',
                  style: TextStyle(
                    fontSize: fontSize28,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSerifPro',
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: fontSize20,
                    fontWeight: FontWeight.w400,
                    color: subtleTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _validationEmptyError
                            ? Color(0xFFE05031)
                            : moreSubtleTextColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CountryListPick(
                      appBar: buildCenteredAppBar(title: 'Select Country'),
                      pickerBuilder: (context, CountryCode countryCode) {
                        return Row(
                          children: [
                            Image.asset(
                              countryCode.flagUri,
                              package: 'country_list_pick',
                              height: 24,
                              width: 50,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: normalTextColor,
                            ),
                            SizedBox(width: 8),
                            Container(
                              width: 1,
                              height: 24,
                              color: moreSubtleTextColor,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter Number',
                                  prefixText: countryCode.dialCode + " ",
                                  prefixStyle: TextStyle(
                                    color: normalTextColor,
                                    fontSize: fontSize22,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintStyle: TextStyle(
                                    color: moreSubtleTextColor,
                                    fontSize: fontSize22,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: normalTextColor,
                                  fontSize: fontSize22,
                                  fontFamily: 'SourceSansPro',
                                  fontWeight: FontWeight.w400,
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                controller: _numberController,
                                cursorColor: Theme.of(context).accentColor,
                                autofocus: true,
                                onChanged: (String keyword) {
                                  setState(() {
                                    _validationEmptyError = false;
                                  });
                                  number = countryCode.dialCode + " " + keyword;
                                  debugPrint(number);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      initialSelection: widget.countryCode ?? 'US',
                      onChanged: (CountryCode code) {
                        print(code.name);
                        print(code.dialCode);
                      },
                      // Whether to allow the widget to set a custom UI overlay
                      useUiOverlay: true,
                      // Whether the country list should be wrapped in a SafeArea
                      useSafeArea: false),
                ),
                SizedBox(height: 8),
                _validationEmptyError
                    ? Text(
                        'Phone Number can\'t be empty',
                        style: TextStyle(
                          fontSize: fontSize18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFE05031),
                          fontFamily: 'SourceSansPro',
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 22),
                Container(
                  height: 52,
                  child: Row(
                    children: [
                      ExpandedPrimaryButton(
                        fontSize: fontSize22,
                        buttonTitle: 'Send OTP',
                        onPressedFunction: () {
                          setState(() {
                            _numberController.text.isEmpty
                                ? _validationEmptyError = true
                                : _validationEmptyError = false;
                          });
                          debugPrint("Number Entered: $number");
                          if (_numberController.text.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInOTPScreen(
                                  number: number,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
