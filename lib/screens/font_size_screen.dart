import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/config/font_size_settings.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/constants/sample_long_text.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';

import '../main.dart';

class FontSizeScreen extends StatefulWidget {
  @override
  _FontSizeScreenState createState() => _FontSizeScreenState();
}

const double defaultFontSize28 = 28;
const double defaultFontSize26 = 26;
const double defaultFontSize24 = 24;
const double defaultFontSize22 = 22;
const double defaultFontSize20 = 20;
const double defaultFontSize18 = 18;
const double defaultFontSize16 = 16;
const double defaultFontSize14 = 14;
const double defaultFontSize12 = 12;

double fontSize28 = 28;
double fontSize26 = 26;
double fontSize24 = 24;
double fontSize22 = 22;
double fontSize20 = 20;
double fontSize18 = 18;
double fontSize16 = 16;
double fontSize14 = 14;
double fontSize12 = 12;

double fontSizeSliderValue = 1;
FontSizeOption selectedFontSizeOption = FontSizeOption.Normal;

changeFontSize({newValue}) {
  fontSize12 = defaultFontSize12;
  fontSize14 = defaultFontSize14;
  fontSize16 = defaultFontSize16;
  fontSize18 = defaultFontSize18;
  fontSize20 = defaultFontSize20;
  fontSize22 = defaultFontSize22;
  fontSize24 = defaultFontSize24;
  fontSize26 = defaultFontSize26;
  fontSize28 = defaultFontSize28;
  if (newValue == 0) {
    fontSize12 -= 2;
    fontSize14 -= 2;
    fontSize16 -= 2;
    fontSize18 -= 2;
    fontSize20 -= 2;
    fontSize22 -= 2;
    fontSize24 -= 2;
    fontSize26 -= 2;
    fontSize28 -= 2;
  }
  if (newValue == 2) {
    fontSize12 += 2;
    fontSize14 += 2;
    fontSize16 += 2;
    fontSize18 += 2;
    fontSize20 += 2;
    fontSize22 += 2;
    fontSize24 += 2;
    fontSize26 += 2;
    fontSize28 += 2;
  }
  if (newValue == 3) {
    fontSize12 += 4;
    fontSize14 += 4;
    fontSize16 += 4;
    fontSize18 += 4;
    fontSize20 += 4;
    fontSize22 += 4;
    fontSize24 += 4;
    fontSize26 += 4;
    fontSize28 += 4;
  }
}

class _FontSizeScreenState extends State<FontSizeScreen> {
  static const double fixedFontSize20 = 20;
  static const double fixedFontSize18 = 18;
  static const double fixedFontSize26 = 26;

  setFontSizeSelection({value}) {
    sharedPreferences.setDouble("fontSizeOption", value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'Sample Text',
                      style: TextStyle(
                        color: Color(0xFF061730),
                        fontSize: fontSize28,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Spirit Within',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF061730),
                        fontSize: fontSize26,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SourceSerifPro',
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '13:42, December 13, 2020',
                      style: TextStyle(
                        fontSize: fontSize16,
                        fontWeight: FontWeight.w400,
                        color: normalTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      sampleLongText,
                      style: TextStyle(
                        fontSize: fontSize16,
                        fontWeight: FontWeight.w400,
                        color: blogTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  'Preview',
                  style: TextStyle(
                    fontSize: fixedFontSize20,
                    fontWeight: FontWeight.w600,
                    color: normalTextColor,
                    fontFamily: 'SourceSerifPro',
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    selectedFontSizeOption.toString().split('.')[1],
                    style: TextStyle(
                      fontSize: fixedFontSize18,
                      fontWeight: FontWeight.w400,
                      color: normalTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'A',
                      style: TextStyle(
                        fontSize: fixedFontSize18,
                        fontWeight: FontWeight.w600,
                        color: normalTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: fontSizeSliderValue,
                        max: 3,
                        min: 0,
                        onChanged: (newSize) {
                          setState(() {
                            selectedFontSizeOption = FontSizeOption.values
                                .elementAt(newSize.toInt());
                            fontSizeSliderValue = newSize;
                            changeFontSize(newValue: newSize);
                          });
                          setFontSizeSelection(value: newSize);
                        },
                        divisions: 3,
                        activeColor: activeBlue,
                      ),
                    ),
                    Text(
                      'A',
                      style: TextStyle(
                        fontSize: fixedFontSize26,
                        fontWeight: FontWeight.w600,
                        color: normalTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Make the text on the screen smaller or larger',
                  style: TextStyle(
                    fontSize: fixedFontSize18,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
