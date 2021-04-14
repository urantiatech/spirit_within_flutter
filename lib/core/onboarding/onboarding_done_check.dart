import 'package:shared_preferences/shared_preferences.dart';

bool onboardingDone;

Future<void> onboardingDoneCheck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  onboardingDone = prefs.getBool("initScreen");
  await prefs.setBool("initScreen", true);
}
