import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class ChatBubble extends StatelessWidget {
  final String messageText;
  final bool isMe;
  final String time;
  ChatBubble({
    @required this.messageText,
    @required this.isMe,
    @required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return isMe
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                margin: EdgeInsets.only(right: 30, left: 70, bottom: 8),
                decoration: BoxDecoration(
                  color: activeBlue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Text(
                  messageText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'SourceSerifPro',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30, bottom: 16),
                child: Text(
                  time,
                  style: TextStyle(
                    color: subtleTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                margin: EdgeInsets.only(right: 70, left: 30, bottom: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFEFF3F8),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Text(
                  messageText,
                  style: TextStyle(
                    color: normalTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'SourceSerifPro',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, bottom: 16),
                child: Text(
                  time,
                  style: TextStyle(
                    color: subtleTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ),
            ],
          );
  }
}
