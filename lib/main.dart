import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spirit_within_flutter/config/theme.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/api_paths.dart';
import 'screens/onboarding/onboarding.dart';

bool onboardingScreenShown;
bool isSignedIn;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  onboardingScreenShown = prefs.getBool("initScreen");
  signInCheck();
  await prefs.setBool("initScreen", true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpiritWithin',
      theme: themeData,
      home: onboardingScreenShown != true ? Onboarding() : BottomBar(),
    );
  }
}

signInCheck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isSignedIn = prefs.getBool("isSignedIn");
  if (isSignedIn == null) {
    isSignedIn = false;
  }
}

String currentCountryCode;
Future<void> getCountryCode() async {
  Response res = await get(Uri.parse(locationAPI));
  Map data = jsonDecode(res.body);
  currentCountryCode = data['countryCode'];
}
