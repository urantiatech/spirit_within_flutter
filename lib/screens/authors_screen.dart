import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/author_card.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class AuthorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBar(hintText: 'Search authors'),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 24),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF3F8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(
                    'Popular Authors',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: normalTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEFF3F8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(
                    'New Authors',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: subtleTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Andrew Rash',
            followersCount: 283,
            following: true,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Andrew Rash',
            followersCount: 283,
            following: true,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Andrew Rash',
            followersCount: 283,
            following: true,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
          AuthorCard(
            imgPath: 'assets/images/author.png',
            authorName: 'Supriatna Richard',
            followersCount: 34,
            following: false,
          ),
        ],
      ),
    );
  }
}
