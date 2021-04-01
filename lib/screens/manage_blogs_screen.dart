import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
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
            fontFamily: 'SourceSerifPro',
          ),
        ),
      ),
      body: Column(
        children: [
          SearchBar(hintText: 'Search your blogs'),
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
                      caption: 'Delete',
                      color: Colors.red,
                      icon: Icons.delete,
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
                    deletable: true,
                    deleteBlogFunction: () {
                      showDeleteDialog(context, index);
                    },
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
