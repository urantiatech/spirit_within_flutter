import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_within_flutter/config/theme.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'config/font_size_settings.dart';
import 'core/auth/sign_in_check.dart';
import 'screens/my_profile_screen.dart';
import 'screens/onboarding/onboarding.dart';

bool isIntroShown;
SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  isIntroShown = sharedPreferences.getBool("isIntroShown");
  signInCheck();
  getFontSizeSelection();
  getActiveUserDetails();
  await sharedPreferences.setBool("isIntroShown", true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpiritWithin',
      theme: themeData,
      home: isIntroShown == null ? Onboarding() : BottomBar(),
    );
  }
}
