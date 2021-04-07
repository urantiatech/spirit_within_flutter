import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_otp_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:country_list_pick/country_list_pick.dart';

class SignInNumberScreen extends StatefulWidget {
  final String countryCode;
  SignInNumberScreen({@required this.countryCode});
  @override
  _SignInNumberScreenState createState() => _SignInNumberScreenState();
}

class _SignInNumberScreenState extends State<SignInNumberScreen> {
  TextEditingController _numberController = new TextEditingController();
  String number;

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
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSerifPro',
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: subtleTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: moreSubtleTextColor),
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
                                    fontSize: 22,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintStyle: TextStyle(
                                    color: moreSubtleTextColor,
                                    fontSize: 22,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: normalTextColor,
                                  fontSize: 22,
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
                                  number = countryCode.dialCode + keyword;
                                  debugPrint(number);
                                },
                              ),
                            ),
                            // Text(
                            //   countryCode.name,
                            //   style: TextStyle(
                            //     fontSize: 20,
                            //     fontWeight: FontWeight.w400,
                            //     color: normalTextColor,
                            //     fontFamily: 'SourceSansPro',
                            //   ),
                            // ),
                            // Text(countryCode.dialCode),
                          ],
                        );
                      },

                      // To disable option set to false
                      // theme: CountryTheme(
                      //   isShowFlag: true,
                      //   isShowTitle: true,
                      //   isShowCode: true,
                      //   isDownIcon: true,
                      //   showEnglishName: true,
                      // ),
                      // Set default value
                      // initialSelection: '+91',
                      // or
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
                // Container(
                //   height: 50,
                //   width: double.infinity,
                //   color: Colors.red[100],
                //   child: Row(
                //     children: [
                //       Text(selectedCountry == null ? '' : selectedCountry.name),
                //     ],
                //   ),
                // ),
                // CountryCodePicker(
                //   // Issue: Can't search all country names in English as it displays in local language
                //   onChanged: print,
                //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                //   initialSelection: 'IT',
                //   favorite: ['+39', 'FR'],
                //   // optional. Shows only country name and flag
                //   showCountryOnly: false,
                //   // optional. Shows only country name and flag when popup is closed.
                //   showOnlyCountryWhenClosed: false,
                //   // optional. aligns the flag and the Text left
                //   alignLeft: false,
                // ),
                // IntlPhoneField(
                //   inputFormatters: [
                //     LengthLimitingTextInputFormatter(10),
                //     FilteringTextInputFormatter.digitsOnly,
                //   ],
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.w400,
                //     color: normalTextColor,
                //     fontFamily: 'SourceSansPro',
                //   ),
                //   decoration: InputDecoration(
                //     hintText: 'Phone Number',
                //     hintStyle: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.w400,
                //       color: subtleTextColor,
                //       fontFamily: 'SourceSansPro',
                //     ),
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide(),
                //     ),
                //     counterText: '',
                //   ),
                //   enabled: true,
                //   keyboardType: TextInputType.number,
                //   maxLength: 10,
                //   countryCodeTextColor: normalTextColor,
                //   initialCountryCode: 'IN',
                //   onChanged: (phone) {
                //     print(phone.completeNumber);
                //   },
                // ),
                SizedBox(height: 30),
                Container(
                  height: 52,
                  child: Row(
                    children: [
                      ExpandedPrimaryButton(
                        fontSize: 22,
                        buttonTitle: 'Send OTP',
                        onPressedFunction: () {
                          debugPrint("Number Entered: $number");
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
