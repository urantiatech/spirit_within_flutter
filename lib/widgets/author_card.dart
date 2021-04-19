import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/core/auth/sign_in_check.dart';
import 'package:spirit_within_flutter/screens/author_profile_screen.dart';
import 'package:spirit_within_flutter/screens/font_size_screen.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class AuthorCard extends StatefulWidget {
  final String imgPath;
  final String authorName;
  final int followersCount;
  bool following;
  AuthorCard({
    @required this.imgPath,
    @required this.authorName,
    @required this.followersCount,
    @required this.following,
  });

  @override
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Navigator.of(context).pushNamed('/author_profile_screen');
        Navigator.of(context).push(
          // context,
          MaterialPageRoute(
            builder: (context) => AuthorProfileScreen(),
            settings: RouteSettings(name: '/author_profile_screen'),
          ),
        );
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.green[200],
                  backgroundImage: AssetImage(
                    widget.imgPath,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.authorName,
                      style: TextStyle(
                        fontSize: fontSize16,
                        fontWeight: FontWeight.w600,
                        color: normalTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '${widget.followersCount} followers',
                      style: TextStyle(
                        fontSize: fontSize14,
                        fontWeight: FontWeight.w400,
                        color: subtleTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isSignedIn
                ? widget.following
                    ? Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Text(
                          'Following',
                          style: TextStyle(
                            fontSize: fontSize16,
                            fontWeight: FontWeight.w400,
                            color: subtleTextColor,
                            fontFamily: 'SourceSansPro',
                          ),
                        ),
                      )
                    : SecondaryButton(
                        buttonTitle: 'Follow',
                        onPressedFunction: () {
                          setState(() {
                            widget.following = true;
                          });
                          debugPrint('Follow Pressed');
                        },
                      )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
