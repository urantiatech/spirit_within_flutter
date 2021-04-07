import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'package:spirit_within_flutter/screens/my_profile_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:spirit_within_flutter/widgets/expanded_secondary_button.dart';

import '../../main.dart';

class SignInOTPScreen extends StatefulWidget {
  @override
  _SignInOTPScreenState createState() => _SignInOTPScreenState();
}

class _SignInOTPScreenState extends State<SignInOTPScreen> {
  // TextEditingController textEditingController = TextEditingController();
  // StreamController<ErrorAnimationType> errorController;
  String currentText = "";

  signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isSignedIn", true);
    isSignedIn = true;
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
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSerifPro',
                  ),
                ),
                SizedBox(height: 30),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  // animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: moreSubtleTextColor,
                    disabledColor: moreSubtleTextColor,
                    inactiveColor: moreSubtleTextColor,
                    selectedColor: moreSubtleTextColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    // activeFillColor: Colors.white,
                  ),
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                  animationDuration: Duration(milliseconds: 50),
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  autoDisposeControllers: true,
                  // backgroundColor: Colors.blue.shade50,
                  // enableActiveFill: true,
                  // errorAnimationController: errorController,
                  // controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return false;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Re-send the OTP in 00:30',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: activeBlue,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 22),
                Container(
                  height: 52,
                  child: Row(
                    children: [
                      ExpandedPrimaryButton(
                        fontSize: 22,
                        buttonTitle: 'Verify and Proceed',
                        onPressedFunction: () {
                          signIn();
                          // Navigator.popUntil(context, (route) => false);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BottomBar(navigationIndex: 2),
                              ),
                              (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Signed in successfully!'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  height: 52,
                  child: Row(
                    children: [
                      ExpandedSecondaryButton(
                        fontSize: 22,
                        buttonTitle: 'Resend the OTP',
                        onPressedFunction: null,
                        isDisabled: true,
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
