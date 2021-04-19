import '../../main.dart';

bool isSignedIn;

signInCheck() {
  isSignedIn = sharedPreferences.getBool("isSignedIn");
  if (isSignedIn == null) {
    isSignedIn = false;
  }
}
