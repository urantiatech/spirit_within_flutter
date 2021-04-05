import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/models/blog.dart';
import 'package:spirit_within_flutter/widgets/blog_list_item.dart';
import 'package:spirit_within_flutter/widgets/quote_box.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBar(hintText: "Search Blogs"),
          SizedBox(height: 14),
          QuoteBox(
            quoteText: 'Design is not just what it looks like and feels like.'
                ' Design is how it works.',
            quoteAuthor: 'Steve Jobs',
          ),
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
