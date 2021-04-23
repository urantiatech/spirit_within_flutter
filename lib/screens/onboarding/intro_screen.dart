import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final String imgPath;

  const IntroScreen({
    @required this.imgPath,
  });

  final double instructionsFontSize = 24;
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: totalHeight / 4.5,
          ),
          Container(
            height: totalHeight / 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imgPath,
                fit: BoxFit.fill,
              ),
            ),
            // child: Image.asset('assets/images/img1.jpg'),
            // child: Placeholder(
            //   strokeWidth: 1,
            // ),
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
                fontSize: instructionsFontSize,
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
