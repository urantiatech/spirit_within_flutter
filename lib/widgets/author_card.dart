import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/author_profile_screen.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class AuthorCard extends StatelessWidget {
  final String imgPath;
  final String authorName;
  final int followersCount;
  final bool following;
  const AuthorCard({
    @required this.imgPath,
    @required this.authorName,
    @required this.followersCount,
    @required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AuthorProfileScreen(),
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
                    imgPath,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
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
                    Text(
                      '$followersCount followers',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: subtleTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            following
                ? Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: subtleTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  )
                : SecondaryButton(
                    buttonTitle: 'Follow',
                    onPressedFunction: () {
                      debugPrint('Follow Pressed');
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
