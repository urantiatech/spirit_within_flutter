import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:spirit_within_flutter/widgets/expanded_secondary_button.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class ManageBlogsScreen extends StatefulWidget {
  @override
  _ManageBlogsScreenState createState() => _ManageBlogsScreenState();
}

class _ManageBlogsScreenState extends State<ManageBlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: Column(
        children: [
          SearchBar(hintText: 'Search Your Blogs'),
          SizedBox(height: 14),
          Expanded(
            child: ListView.builder(
              itemCount: blogList.length,
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.25,
                  secondaryActions: [
                    IconSlideAction(
                      // caption:
                      //     blogList[index].isPublished ? 'Unpublish' : 'Publish',
                      color: activeBlue,
                      iconWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            blogList[index].isPublished
                                ? Icons.public_off_rounded
                                : Icons.public_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(height: 4),
                          Text(
                            blogList[index].isPublished
                                ? 'Unpublish'
                                : 'Publish',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'SourceSansPro',
                            ),
                          )
                        ],
                      ),
                      // icon: blogList[index].isPublished
                      //     ? Icons.public_off_rounded
                      //     : Icons.public_rounded,
                      onTap: () {
                        setState(() {
                          blogList[index].isPublished =
                              !blogList[index].isPublished;
                        });
                      },
                    ),
                    IconSlideAction(
                      // caption: 'Delete',
                      color: Colors.red,
                      iconWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontFamily: 'SourceSansPro',
                            ),
                          )
                        ],
                      ),
                      // icon: Icons.delete,
                      onTap: () {
                        showDeleteDialog(context, index);
                      },
                    ),
                  ],
                  child: BlogListItem(
                    title: blogList[index].title,
                    description: blogList[index].title + blogList[index].title,
                    time: blogList[index].dateTime,
                    author: blogList[index].author,
                    imgPath: 'assets/images/mona.jpg',
                    disabled: !blogList[index].isPublished,
                    // deleteBlogFunction: () {
                    //   showDeleteDialog(context, index);
                    // },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  showDeleteDialog(BuildContext context, index) {
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
          Text(
            'Are you sure you want to delete this blog?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: normalTextColor,
              fontFamily: 'SourceSerifPro',
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
                    blogList.removeAt(index);
                  });
                  Navigator.of(context).pop();
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
