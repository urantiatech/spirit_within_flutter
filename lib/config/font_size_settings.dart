import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_within_flutter/screens/font_size_screen.dart';

enum FontSizeOption { Small, Normal, Large, Largest }

Future<void> getFontSizeSelection() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  fontSizeSliderValue = prefs.getDouble("fontSizeOption");
  if (fontSizeSliderValue == null) {
    fontSizeSliderValue = 1;
  }
  changeFontSize(newValue: fontSizeSliderValue);
}
