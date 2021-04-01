import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressedFunction;

  const SecondaryButton({
    @required this.buttonTitle,
    this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedFunction,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: activeBlue),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 4,
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: activeBlue,
            fontFamily: 'SourceSansPro',
          ),
        ),
      ),
    );
  }
}
