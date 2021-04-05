import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

bool showQuote = true;

class QuoteBox extends StatefulWidget {
  final String quoteText;
  final String quoteAuthor;

  QuoteBox({
    @required this.quoteText,
    @required this.quoteAuthor,
  });

  @override
  _QuoteBoxState createState() => _QuoteBoxState();
}

class _QuoteBoxState extends State<QuoteBox> {
  @override
  Widget build(BuildContext context) {
    return !showQuote
        ? SizedBox()
        : Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 30, bottom: 24, top: 10),
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
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: MaterialButton(
                        splashColor: activeBlue,
                        onPressed: () {
                          setState(() {
                            debugPrint(showQuote.toString());
                            showQuote = !showQuote;
                            debugPrint(showQuote.toString());
                          });
                        },
                        textColor: Colors.white,
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
                        padding: EdgeInsets.only(top: 10, right: 0, bottom: 10),
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Text(
                    widget.quoteText,
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 30,
                        top: 25,
                        bottom: 28,
                      ),
                      child: Text(
                        '~ ${widget.quoteAuthor}',
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
