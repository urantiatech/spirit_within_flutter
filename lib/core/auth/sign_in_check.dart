import 'package:shared_preferences/shared_preferences.dart';

bool isSignedIn;

signInCheck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isSignedIn = prefs.getBool("isSignedIn");
  if (isSignedIn == null) {
    isSignedIn = false;
  }
}
