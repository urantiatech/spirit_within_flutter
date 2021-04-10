import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_number_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';

import '../../main.dart';
import '../font_size_screen.dart';

String returnRoute;

class SignInToContinueScreen extends StatefulWidget {
  @override
  _SignInToContinueScreenState createState() => _SignInToContinueScreenState();
}

class _SignInToContinueScreenState extends State<SignInToContinueScreen> {
  @override
  void initState() {
    super.initState();
    getCountryCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: SignInToContinueModal(),
    );
  }
}

class SignInToContinueModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'You’re not signed in.\nPlease sign in to continue',
              textAlign: TextAlign.center,
              // style: TextStyle(
              //   fontSize: fontSize18,
              //   fontWeight: FontWeight.w400,
              //   color: subtleTextColor,
              //   fontFamily: 'SourceSansPro',
              // ),
              style: TextStyle(
                fontSize: fontSize24,
                fontWeight: FontWeight.w300,
                color: normalTextColor,
                fontFamily: 'SourceSansPro',
              ),
            ),
          ),
          SizedBox(height: 24),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInNumberScreen(
                    countryCode: currentCountryCode,
                  ),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                activeBlue,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 4,
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: fontSize22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
