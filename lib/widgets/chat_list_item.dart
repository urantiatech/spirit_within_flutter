import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/author_profile_screen.dart';
import 'package:spirit_within_flutter/screens/chat/chat_screen.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class ChatListItem extends StatelessWidget {
  final String imgPath;
  final String authorName;
  final String lastMessage;
  final int numberOfUnread;
  final String time;
  const ChatListItem(
      {@required this.imgPath,
      @required this.authorName,
      @required this.lastMessage,
      @required this.numberOfUnread,
      @required this.time});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              authorName: authorName,
            ),
          ),
        );
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.green[200],
              backgroundImage: AssetImage(
                imgPath,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: normalTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Text(
                      lastMessage,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: numberOfUnread > 0
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: subtleTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: numberOfUnread > 0 ? activeBlue : subtleTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 4),
                numberOfUnread > 0
                    ? Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: activeBlue,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            numberOfUnread.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 24,
                        width: 24,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
