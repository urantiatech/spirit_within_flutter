import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/author_list_screen.dart';
import 'package:spirit_within_flutter/screens/chat/chat_list_screen.dart';
import 'package:spirit_within_flutter/screens/favourites_screen.dart';
import 'package:spirit_within_flutter/screens/homescreen.dart';
import 'package:spirit_within_flutter/screens/my_profile_screen.dart';
import 'package:spirit_within_flutter/screens/add_blog_screen.dart';

import '../main.dart';

class BottomBar extends StatefulWidget {
  final int navigationIndex;
  BottomBar({this.navigationIndex});
  @override
  _BottomBarState createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    HomeScreen(),
    AuthorsScreen(),
    // FavScreen(),
    MyProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageIndex = widget.navigationIndex ?? 0;
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: isSignedIn ? false : true,
        iconTheme: IconThemeData(
          color: normalTextColor,
        ),
        actions: isSignedIn
            ? [
                IconButton(
                  icon: const Icon(Icons.mark_email_unread_outlined),
                  tooltip: 'Conversations',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatListScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.star_border_rounded),
                  tooltip: 'Favourites',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavouritesScreen(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  tooltip: 'Add Blog',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddBlogScreen(),
                      ),
                    );
                  },
                ),
              ]
            : [],
        title: Text(
          'The Spirit Within',
          style: TextStyle(
            color: normalTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            fontFamily: 'SourceSerifPro',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt,
              size: 24,
            ),
            label: 'Authors',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.bookmark_rounded,
          //     size: 24,
          //   ),
          //   label: 'Favourites',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 24,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: normalTextColor,
        unselectedItemColor: inactiveBlue,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: onTabTapped,
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
