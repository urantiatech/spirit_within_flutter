import 'package:flutter/material.dart';

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
              style: TextStyle(
                color: Color(0xFF061730),
                fontSize: 24,
                fontWeight: FontWeight.w300,
                fontFamily: 'SourceSerifPro',
              ),
            ),
          )
        ],
      ),
    );
  }
}
