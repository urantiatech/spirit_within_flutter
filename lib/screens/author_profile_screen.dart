import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/core/auth/sign_in_check.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/screens/chat/chat_screen.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_to_continue_screen.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:spirit_within_flutter/widgets/expanded_secondary_button.dart';
import 'package:spirit_within_flutter/widgets/profile_stats_column.dart';

import 'font_size_screen.dart';

class AuthorProfileScreen extends StatefulWidget {
  @override
  _AuthorProfileScreenState createState() => _AuthorProfileScreenState();
}

class _AuthorProfileScreenState extends State<AuthorProfileScreen> {
  bottomSheetCircularCorners() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SignInToContinueModal(returnRoutePath: '/author_profile_screen');
      },
    );
  }

  bool following = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Kavin Ardana',
                    style: TextStyle(
                      fontSize: fontSize28,
                      fontWeight: FontWeight.w400,
                      color: normalTextColor,
                      fontFamily: 'SourceSerifPro',
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Color(0x3F061730),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.green[200],
                        backgroundImage: AssetImage(
                          'assets/images/author.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileStatsColumn(
                    number: 89,
                    statsTitle: 'Blogs',
                  ),
                  ProfileStatsColumn(
                    number: 234,
                    statsTitle: 'Followers',
                  ),
                  ProfileStatsColumn(
                    number: 160,
                    statsTitle: 'Following',
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  following
                      ? ExpandedSecondaryButton(
                          buttonTitle: 'Unfollow',
                          isAlertButton: true,
                          onPressedFunction: () {
                            showAlertDialog(context);
                          },
                        )
                      : ExpandedPrimaryButton(
                          buttonTitle: 'Follow',
                          onPressedFunction: () {
                            isSignedIn
                                ? setState(() {
                                    following = true;
                                  })
                                : bottomSheetCircularCorners();
                          },
                        ),
                  SizedBox(width: 12),
                  ExpandedSecondaryButton(
                    buttonTitle: 'Message me',
                    onPressedFunction: () {
                      isSignedIn
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(authorName: 'Default Author'),
                              ),
                            )
                          : bottomSheetCircularCorners();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            DividerLine(),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Blogs by Kavin',
                    style: TextStyle(
                      fontSize: fontSize24,
                      fontWeight: FontWeight.w600,
                      color: normalTextColor,
                      fontFamily: 'SourceSerifPro',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                BlogListItem(
                  title: demoBlog1.title,
                  description:
                      'long text long text long text long text long text long text',
                  time: '2 hours ago',
                  // author: 'Peter Parker',
                  imgPath: 'assets/images/mona.jpg',
                ),
                BlogListItem(
                  title: demoBlog1.title,
                  description:
                      'long text long text long text long text long text long text',
                  time: '2 hours ago',
                  // author: 'Peter Parker',
                  imgPath: 'assets/images/mona.jpg',
                ),
                BlogListItem(
                  title: demoBlog1.title,
                  description:
                      'long text long text long text long text long text long text',
                  time: '2 hours ago',
                  // author: 'Peter Parker',
                  imgPath: 'assets/images/mona.jpg',
                ),
                BlogListItem(
                  title: demoBlog1.title,
                  description:
                      'long text long text long text long text long text long text',
                  time: '2 hours ago',
                  // author: 'Peter Parker',
                  imgPath: 'assets/images/mona.jpg',
                ),
                BlogListItem(
                  title: demoBlog1.title,
                  description:
                      'long text long text long text long text long text long text',
                  time: '2 hours ago',
                  // author: 'Peter Parker',
                  imgPath: 'assets/images/mona.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: fontSize20,
                fontWeight: FontWeight.w400,
                color: normalTextColor,
                fontFamily: 'SourceSerifPro',
              ),
              children: [
                TextSpan(text: 'Are you sure you want to unfollow '),
                TextSpan(
                  text: 'Kavin Ardana?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ExpandedPrimaryButton(
                buttonTitle: 'Yes',
                onPressedFunction: () {
                  setState(() {
                    following = false;
                    Navigator.of(context).pop();
                  });
                },
              ),
              SizedBox(width: 12),
              ExpandedSecondaryButton(
                buttonTitle: 'No',
                onPressedFunction: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
