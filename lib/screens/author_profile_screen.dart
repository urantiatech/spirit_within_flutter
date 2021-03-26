import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:spirit_within_flutter/widgets/expanded_secondary_button.dart';
import 'package:spirit_within_flutter/widgets/profile_stats_column.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class AuthorProfileScreen extends StatefulWidget {
  @override
  _AuthorProfileScreenState createState() => _AuthorProfileScreenState();
}

class _AuthorProfileScreenState extends State<AuthorProfileScreen> {
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
              fontFamily: 'SourceSerifPro'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14),
                      Text(
                        'Kavin Ardana',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: normalTextColor,
                          fontFamily: 'SourceSerifPro',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Profession',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: subtleTextColor,
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    ],
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
                  ExpandedPrimaryButton(buttonTitle: 'Follow'),
                  SizedBox(width: 12),
                  ExpandedSecondaryButton(buttonTitle: 'Message me'),
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
                      fontSize: 24,
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
}
