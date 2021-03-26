import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class ExpandedPrimaryButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressedFunction;
  const ExpandedPrimaryButton(
      {@required this.buttonTitle, this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressedFunction,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            activeBlue,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
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
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontFamily: 'SourceSansPro',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
