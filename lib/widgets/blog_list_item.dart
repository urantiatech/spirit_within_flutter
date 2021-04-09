import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/blog_screen.dart';
import 'package:spirit_within_flutter/screens/font_size_screen.dart';

class BlogListItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String author;
  final String imgPath;
  final bool disabled;
  // final Function deleteBlogFunction;

  const BlogListItem({
    this.title,
    this.description,
    this.time,
    this.author,
    this.imgPath,
    this.disabled = false,
    // this.deleteBlogFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(),
          ),
        );
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
      child: Container(
        // color: disabled ? Colors.red[50] : Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        // margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red[100],
                    // width: fullWidth * 0.58,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: fontSize20,
                        fontWeight: FontWeight.w600,
                        color: disabled ? subtleTextColor : normalTextColor,
                        fontFamily: 'SourceSerifPro',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    // width: fullWidth * 0.58,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize14,
                        fontWeight: FontWeight.w400,
                        color: subtleTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 12,
                            color: moreSubtleTextColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: fontSize12,
                              fontWeight: FontWeight.w400,
                              color: moreSubtleTextColor,
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                        ],
                      ),
                      author == null
                          ? SizedBox()
                          : Row(
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  size: 12,
                                  color: moreSubtleTextColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  author,
                                  style: TextStyle(
                                    fontSize: fontSize12,
                                    fontWeight: FontWeight.w400,
                                    color: moreSubtleTextColor,
                                    fontFamily: 'SourceSansPro',
                                  ),
                                ),
                              ],
                            ),
                    ],
                  )
                ],
              ),
            ),
            imgPath == null
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imgPath,
                        height: 96,
                        width: 96,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
