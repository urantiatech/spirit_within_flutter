import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class IconDescriptionCard extends StatelessWidget {
  final IconData iconData;
  final String descTitle;
  final Function onPressedFunction;

  const IconDescriptionCard({
    this.iconData,
    this.descTitle,
    this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedFunction,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                iconData,
                color: normalTextColor,
                size: 24,
              ),
            ),
            SizedBox(width: 8),
            Text(
              descTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: normalTextColor,
                fontFamily: 'SourceSansPro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
