import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/config/theme.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding/onboarding.dart';

bool onboardingScreenShown;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  onboardingScreenShown = prefs.getBool("initScreen");
  await prefs.setBool("initScreen", true);
  print('initScreen $onboardingScreenShown');
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
