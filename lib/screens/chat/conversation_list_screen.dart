import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/chat_list_item.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: normalTextColor,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Spirit Within',
          style: TextStyle(
            color: normalTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'SourceSerifPro',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(hintText: 'Search Conversations'),
            SizedBox(height: 15),
            ChatListItem(
              imgPath: 'assets/images/author.png',
              authorName: 'Andrew Rash',
              lastMessage:
                  'Maybe you should try to install AC (Air Conditioning), so that the temprature is more comfortable',
              time: '10:00 PM',
              numberOfUnread: 2,
            ),
            DividerLine(),
            ChatListItem(
              imgPath: 'assets/images/author.png',
              authorName: 'Kamayel Alpha',
              lastMessage:
                  'Maybe you should try to install AC (Air Conditioning), so that the temprature is more comfortable',
              time: '03:00 PM',
              numberOfUnread: 0,
            ),
            DividerLine(),
            ChatListItem(
              imgPath: 'assets/images/author.png',
              authorName: 'Andrew Rash',
              lastMessage:
                  'Maybe you should try to install AC (Air Conditioning), so that the temprature is more comfortable',
              time: 'Yesterday',
              numberOfUnread: 0,
            ),
          ],
        ),
      ),
    );
  }
}
