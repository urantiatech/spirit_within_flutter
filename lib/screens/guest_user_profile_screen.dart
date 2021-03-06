import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/core/location/get_country_code.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_number_screen.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:spirit_within_flutter/widgets/icon_description_card.dart';

import 'app_settings_screen.dart';
import 'font_size_screen.dart';

class GuestUserProfileScreen extends StatefulWidget {
  @override
  _GuestUserProfileScreenState createState() => _GuestUserProfileScreenState();
}

class _GuestUserProfileScreenState extends State<GuestUserProfileScreen> {
  @override
  void initState() {
    super.initState();
    getCountryCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.01, 0.5],
                  colors: [Color(0xFFFAFAFA), Colors.transparent],
                ),
              ),
              child: Image.asset(
                'assets/images/img6.jpg',
                fit: BoxFit.fill,
              ),
            ),
            // child: Placeholder(
            //   color: moreSubtleTextColor,
            // ),
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please sign in to continue',
                      style: TextStyle(
                        fontSize: fontSize18,
                        fontWeight: FontWeight.w400,
                        color: subtleTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    // Text(
                    //   'Please sign in to continue',
                    //   style: TextStyle(
                    //     fontSize: fontSize24,
                    //     fontWeight: FontWeight.w300,
                    //     color: normalTextColor,
                    //     fontFamily: 'SourceSansPro',
                    //   ),
                    // ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        ExpandedPrimaryButton(
                          buttonTitle: 'Sign In',
                          fontSize: fontSize22,
                          onPressedFunction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInNumberScreen(
                                  countryCode: currentCountryCode,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Divider(
                      height: 0,
                      thickness: 2,
                      color: subtleTextColor,
                    ),
                    // SizedBox(height: 10),
                  ],
                ),
              ),
              IconDescriptionCard(
                iconData: Icons.settings_outlined,
                descTitle: 'App Settings',
                onPressedFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppSettingsScreen(),
                    ),
                  ).then((value) => {setState(() {})});
                },
              ),
              DividerLine(),
              IconDescriptionCard(
                iconData: Icons.person_add_alt_1_outlined,
                descTitle: 'Invite Friends',
                onPressedFunction: () {
                  Share.share(
                    'Hey,\nCheck out TheSpiritWithin app, a secure and reliable blogging app.\n\nGet it for free at https://play.google.com/store/apps/',
                    subject: 'TheSpiritWithin App Invite',
                  );
                },
              ),
              SizedBox(height: 12),
            ],
          ),
        ],
      ),
    );
  }
}
