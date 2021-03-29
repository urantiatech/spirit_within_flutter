import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_otp_screen.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';

class SignInNumberScreen extends StatefulWidget {
  @override
  _SignInNumberScreenState createState() => _SignInNumberScreenState();
}

class _SignInNumberScreenState extends State<SignInNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: normalTextColor,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Spirit Within',
          style: TextStyle(
            color: normalTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'SourceSerifPro',
          ),
        ),
      ),
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
                IntlPhoneField(
                  // inputFormatters: [
                  //   LengthLimitingTextInputFormatter(10),
                  // ],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: subtleTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    counterText: '',
                  ),
                  maxLength: 10,
                  countryCodeTextColor: normalTextColor,
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                SizedBox(height: 30),
                Container(
                  height: 52,
                  child: Row(
                    children: [
                      ExpandedPrimaryButton(
                        fontSize: 22,
                        buttonTitle: 'Send OTP',
                        onPressedFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInOTPScreen(),
                            ),
                          );
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
