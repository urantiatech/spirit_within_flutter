import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class QuoteBox extends StatelessWidget {
  final String quoteText;
  final String quoteAuthor;

  QuoteBox({
    @required this.quoteText,
    @required this.quoteAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
        color: Color(0xFF225FBA),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  top: 20,
                ),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    '“',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).accentColor,
                      fontFamily: 'SourceSerifPro',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 30,
                  top: 20,
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Color(0xFF225FBA),
                    child: Icon(
                      Icons.clear_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 14, left: 30, right: 30),
            child: Text(
              quoteText,
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: 'SourceSerifPro',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, top: 25, bottom: 24),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 18),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xFFF1B94B),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Share Quote',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: normalTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  onPressed: () {},
                ),
                // child: FlatButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   color: Color(0xFFF1B94B),
                //   child: Text(
                //     'Share Quote',
                //     style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.w600,
                //       color: normalTextColor,
                //       fontFamily: 'SourceSansPro',
                //     ),
                //   ),
                //   onPressed: () {},
                // ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: 30,
                  top: 25,
                  bottom: 28,
                ),
                child: Text(
                  '~ $quoteAuthor',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
