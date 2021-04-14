import '../../main.dart';

bool isSignedIn;

signInCheck() async {
  isSignedIn = sharedPreferences.getBool("isSignedIn");
  if (isSignedIn == null) {
    isSignedIn = false;
  }
}
