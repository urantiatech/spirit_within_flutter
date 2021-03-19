import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/widgets/quote_box.dart';
import 'package:spirit_within_flutter/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(hintText: "Search blogs"),
        SizedBox(
          height: 24,
        ),
        QuoteBox(
          quoteText: 'Design is not just what it looks like and feels like.'
              ' Design is how it works.',
          quoteAuthor: 'Steve Jobs',
        ),
      ],
    );
  }
}
