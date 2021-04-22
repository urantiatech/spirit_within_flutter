import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/chat/new_chat_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
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
      appBar: buildCenteredAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(hintText: 'Search Conversations'),
            SizedBox(height: 15),
            ChatListItem(
              imgPath: 'assets/images/author.png',
              authorName: 'Andrew Rash',
              lastMessage:
                  'Maybe you should try to install AC (Air Conditioning), so that the temperature is more comfortable',
              time: '10:00 PM',
              numberOfUnread: 2,
            ),
            DividerLine(),
            ChatListItem(
              imgPath: 'assets/images/author.png',
              authorName: 'Kamayel Alpha',
              lastMessage:
                  'Maybe you should try to install AC (Air Conditioning), so that the temperature is more comfortable',
              time: '03:00 PM',
              numberOfUnread: 0,
            ),
            DividerLine(),
            ChatListItem(
              imgPath: 'assets/images/author.png',
              authorName: 'Andrew Rash',
              lastMessage:
                  'Maybe you should try to install AC (Air Conditioning), so that the temperature is more comfortable',
              time: 'Yesterday',
              numberOfUnread: 0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: activeBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewChatScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
