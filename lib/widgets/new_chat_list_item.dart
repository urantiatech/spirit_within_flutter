import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/chat/chat_screen.dart';
import 'package:spirit_within_flutter/screens/font_size_screen.dart';

class NewChatListItem extends StatelessWidget {
  final String imgPath;
  final String authorName;

  const NewChatListItem({
    @required this.imgPath,
    @required this.authorName,
  });

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
              radius: 24,
              backgroundColor: Colors.green[200],
              backgroundImage: AssetImage(
                imgPath,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Text(
              authorName,
              style: TextStyle(
                fontSize: fontSize18,
                fontWeight: FontWeight.w600,
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
