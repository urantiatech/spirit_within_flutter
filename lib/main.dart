import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/config/theme.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'config/font_size_settings.dart';
import 'core/auth/sign_in_check.dart';
import 'core/onboarding/onboarding_done_check.dart';
import 'screens/onboarding/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // onboardingDone = prefs.getBool("initScreen");
  onboardingDoneCheck();
  signInCheck();
  getFontSizeSelection();
  // await prefs.setBool("initScreen", true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpiritWithin',
      theme: themeData,
      home: onboardingDone != true ? Onboarding() : BottomBar(),
    );
  }
}
