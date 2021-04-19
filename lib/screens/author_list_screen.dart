import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/author_card.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

import 'font_size_screen.dart';

class AuthorListScreen extends StatefulWidget {
  @override
  _AuthorListScreenState createState() => _AuthorListScreenState();
}

class _AuthorListScreenState extends State<AuthorListScreen> {
  bool isPopularSelected = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBar(hintText: 'Search Authors'),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 24),
            child: Row(
              children: [
                TopTabButton(
                    title: 'Popular Authors',
                    isActive: isPopularSelected,
                    onPressedFunction: () {
                      setState(() {
                        isPopularSelected = true;
                      });
                    }),
                SizedBox(
                  width: 12,
                ),
                TopTabButton(
                  title: 'New Authors',
                  isActive: !isPopularSelected,
                  onPressedFunction: () {
                    setState(() {
                      isPopularSelected = false;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9,
          ),
          isPopularSelected ? PopularAuthorsColumn() : NewAuthorsColumn(),
        ],
      ),
    );
  }
}

class TopTabButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onPressedFunction;

  TopTabButton({
    @required this.title,
    @required this.isActive,
    @required this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(
          Color(0xFFE0E9F5),
        ),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 18),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Color(0xFFEFF3F8),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 4,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize16,
            fontWeight: FontWeight.w600,
            color: isActive ? normalTextColor : subtleTextColor,
            fontFamily: 'SourceSansPro',
          ),
        ),
      ),
      onPressed: onPressedFunction,
    );
  }
}

class PopularAuthorsColumn extends StatefulWidget {
  @override
  _PopularAuthorsColumnState createState() => _PopularAuthorsColumnState();
}

class _PopularAuthorsColumnState extends State<PopularAuthorsColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}

class NewAuthorsColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthorCard(
          imgPath: 'assets/images/author.png',
          authorName: 'Supriatna Richard',
          followersCount: 12,
          following: false,
        ),
        AuthorCard(
          imgPath: 'assets/images/author.png',
          authorName: 'Supriatna Richard',
          followersCount: 14,
          following: false,
        ),
        AuthorCard(
          imgPath: 'assets/images/author.png',
          authorName: 'Supriatna Richard',
          followersCount: 4,
          following: false,
        ),
      ],
    );
  }
}
