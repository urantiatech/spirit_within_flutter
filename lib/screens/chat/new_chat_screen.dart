import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/new_chat_list_item.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class NewChatScreen extends StatefulWidget {
  @override
  _NewChatScreenState createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(hintText: 'Search Authors you follow'),
            SizedBox(height: 15),
            NewChatListItem(
              authorName: 'Andrew Rash',
              imgPath: 'assets/images/author.png',
            ),
            DividerLine(),
            NewChatListItem(
              authorName: 'Madalyn Zimmerman',
              imgPath: 'assets/images/author.png',
            ),
            DividerLine(),
            NewChatListItem(
              authorName: 'Charity R. Ware ',
              imgPath: 'assets/images/author.png',
            ),
            DividerLine(),
            NewChatListItem(
              authorName: 'Robert Downy Jr.',
              imgPath: 'assets/images/author.png',
            ),
          ],
        ),
      ),
    );
  }
}
