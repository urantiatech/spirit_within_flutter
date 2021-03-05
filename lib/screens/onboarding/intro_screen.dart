import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    @required this.totalHeight,
  });

  final double totalHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: totalHeight / 4.5,
          ),
          Container(
            height: totalHeight / 2.5,
            width: totalHeight / 2.5,
            child: Placeholder(
              strokeWidth: 1,
            ),
          ),
          SizedBox(
            height: totalHeight / 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'App introduction & usage instructions',
              textAlign: TextAlign.center,
              style: introDescStyle,
            ),
          )
        ],
      ),
    );
  }
}
