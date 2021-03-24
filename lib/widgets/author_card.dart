import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class AuthorCard extends StatelessWidget {
  final String imgPath;
  final String authorName;
  final int followersCount;
  final bool following;
  const AuthorCard({
    this.imgPath,
    @required this.authorName,
    @required this.followersCount,
    this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
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
                ),
        ],
      ),
    );
  }
}
