import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/config/urantia_icons_icons.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/add_blog_screen.dart';
import 'package:spirit_within_flutter/screens/chat/chat_list_screen.dart';
import 'package:spirit_within_flutter/screens/favourites_screen.dart';

AppBar buildLeftAlignedAppBar(BuildContext context) {
  double appBarFontSize = 20;
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: false,
    iconTheme: IconThemeData(
      color: normalTextColor,
    ),
    actions: [
      IconButton(
        icon: const Icon(
          UrantiaIcons.mail_all_regular,
        ),
        // icon: const Icon(Icons.mark_email_unread_outlined),
        tooltip: 'Conversations',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatListScreen(),
            ),
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.star_border_rounded),
        tooltip: 'Favourites',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavouritesScreen(),
            ),
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Write a Blog',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBlogScreen(),
            ),
          );
        },
      ),
    ],
    title: Text(
      'The Spirit Within',
      style: TextStyle(
        color: normalTextColor,
        fontWeight: FontWeight.w600,
        fontSize: appBarFontSize,
        fontFamily: 'SourceSerifPro',
      ),
    ),
  );
}
