import 'package:spirit_within_flutter/screens/font_size_screen.dart';

import '../main.dart';

enum FontSizeOption { Small, Normal, Large, Largest }

Future<void> getFontSizeSelection() async {
  fontSizeSliderValue = sharedPreferences.getDouble("fontSizeOption");
  if (fontSizeSliderValue == null) {
    fontSizeSliderValue = 1;
  }
  changeFontSize(newValue: fontSizeSliderValue);
}
