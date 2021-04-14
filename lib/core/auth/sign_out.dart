import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_within_flutter/core/auth/sign_in_check.dart';

signOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isSignedIn", false);
  isSignedIn = false;
}
