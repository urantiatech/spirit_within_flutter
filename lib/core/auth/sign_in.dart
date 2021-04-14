import 'package:spirit_within_flutter/core/auth/sign_in_check.dart';

import '../../main.dart';

signIn() async {
  sharedPreferences.setBool("isSignedIn", true);
  isSignedIn = true;
}
