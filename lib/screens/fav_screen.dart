import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBar(hintText: 'Search favourite blogs'),
          SizedBox(height: 14),
          BlogListItem(
            title: 'Lorem ipsum dolor sit amet',
            description:
                'long text long text long text long text long text long text long text long text long text long text',
            time: '2 hours ago',
            author: 'Peter Parker',
            imgPath: 'assets/images/mona.jpg',
          ),
          BlogListItem(
            title: demoBlog1.title,
            description:
                'long text long text long text long text long text long text',
            time: '2 hours ago',
            author: 'Peter Parker',
            imgPath: 'assets/images/mona.jpg',
          ),
          BlogListItem(
            title: demoBlog1.title,
            description:
                'long text long text long text long text long text long text',
            time: '2 hours ago',
            author: 'Peter Parker',
            imgPath: 'assets/images/mona.jpg',
          ),
        ],
      ),
    );
  }
}
