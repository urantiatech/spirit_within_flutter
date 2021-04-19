import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/font_size_screen.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final onChangedFunction;

  SearchBar({
    @required this.hintText,
    this.onChangedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFEFF3F8),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: moreSubtleTextColor,
                  fontSize: fontSize16,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: normalTextColor,
                fontSize: fontSize16,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.w400,
              ),
              cursorColor: Theme.of(context).accentColor,
              onChanged: onChangedFunction,
            ),
          ),
          Icon(
            Icons.search_rounded,
            color: normalTextColor,
          )
        ],
      ),
    );
  }
}
