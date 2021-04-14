import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spirit_within_flutter/screens/sign-in/userdata_input_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/expanded_secondary_button.dart';

import '../font_size_screen.dart';

class SignInOTPScreen extends StatefulWidget {
  final String number;
  SignInOTPScreen({@required this.number});

  @override
  _SignInOTPScreenState createState() => _SignInOTPScreenState();
}

class _SignInOTPScreenState extends State<SignInOTPScreen> {
  TextEditingController _otpController = TextEditingController();
  int _counter = 30;
  Timer _timer;
  String enteredOTP = "";
  bool isResendEnabled = false;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // check if mounted before calling setState() otherwise there will be a
      // memory leak caused by calling setState() after dispose()
      if (this.mounted) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            isResendEnabled = true;
            _timer.cancel();
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
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
                  'Enter OTP sent to ${widget.number}',
                  style: TextStyle(
                    fontSize: fontSize20,
                    fontWeight: FontWeight.w400,
                    color: subtleTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 16),
                PinCodeTextField(
                  controller: _otpController,
                  // errorAnimationController: errorController,
                  appContext: context,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.none,
                  pinTheme: PinTheme(
                    activeColor: moreSubtleTextColor,
                    disabledColor: moreSubtleTextColor,
                    inactiveColor: moreSubtleTextColor,
                    selectedColor: moreSubtleTextColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 60,
                  ),
                  textStyle: TextStyle(
                    fontSize: fontSize24,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                  animationDuration: Duration(milliseconds: 1),
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  autoDisposeControllers: true,
                  onCompleted: (v) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDataInputScreen(),
                      ),
                    );
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      enteredOTP = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return false;
                  },
                ),
                SizedBox(height: 12),
                Text(
                  'You may re-send the OTP in $_counter seconds',
                  style: TextStyle(
                    fontSize: fontSize18,
                    fontWeight: FontWeight.w400,
                    color: activeBlue,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  child: Row(
                    children: [
                      ExpandedSecondaryButton(
                        fontSize: fontSize22,
                        buttonTitle: 'Resend the OTP',
                        onPressedFunction: isResendEnabled ? () {} : null,
                        isDisabled: isResendEnabled ? false : true,
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
