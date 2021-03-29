import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class ExpandedSecondaryButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressedFunction;
  final bool isAlertButton;
  final bool isDisabled;
  final double fontSize;
  ExpandedSecondaryButton({
    @required this.buttonTitle,
    this.onPressedFunction,
    this.isAlertButton = false,
    this.fontSize,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressedFunction,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
            isAlertButton ? Color(0x11E05031) : Color(0x113177E0),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                  color: isAlertButton
                      ? Color(0xFFE05031)
                      : isDisabled
                          ? Color(0xFF9DC2FA)
                          : activeBlue),
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 4,
          ),
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontSize: fontSize ?? 16,
                fontWeight: FontWeight.w400,
                color: isAlertButton
                    ? Color(0xFFE05031)
                    : isDisabled
                        ? Color(0xFF9DC2FA)
                        : activeBlue,
                fontFamily: 'SourceSansPro',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
