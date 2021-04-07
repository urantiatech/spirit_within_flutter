import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_number_screen.dart';

import '../main.dart';

class GuestProfile extends StatefulWidget {
  @override
  _GuestProfileState createState() => _GuestProfileState();
}

class _GuestProfileState extends State<GuestProfile> {
  @override
  void initState() {
    super.initState();
    getCountryCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'You’re not signed in.\nPlease sign in to continue',
                // 'You’re not signed in.\nPlease sign in to start writing blogs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
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
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
