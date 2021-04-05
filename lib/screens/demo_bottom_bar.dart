import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/author_list_screen.dart';
import 'package:spirit_within_flutter/screens/chat/chat_list_screen.dart';
import 'package:spirit_within_flutter/screens/favourites_screen.dart';
import 'package:spirit_within_flutter/screens/homescreen.dart';
import 'package:spirit_within_flutter/screens/my_profile_screen.dart';
import 'package:spirit_within_flutter/screens/add_blog_screen.dart';

import '../main.dart';

class DemoBottomBar extends StatefulWidget {
  final int navigationIndex;
  DemoBottomBar({this.navigationIndex});
  @override
  _DemoBottomBarState createState() => new _DemoBottomBarState();
}

class _DemoBottomBarState extends State<DemoBottomBar> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                  // IconButton(
                  //   icon: Image.asset('assets/images/mona.jpg'),
                  //   onPressed: () {},
                  // ),
                ]
              : [],
          title: Text(
            'DEMO MODE - SWITCH',
            style: TextStyle(
              color: normalTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: 'SourceSerifPro',
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black26,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicatorPadding: EdgeInsets.all(5.0),
            // indicatorColor: Colors.blue,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                // text: "Transactions",
                // icon: Icon(Icons.euro_symbol),
                child: Image.asset('assets/images/author.png'),
              ),
              Tab(
                text: "Bills",
                icon: Icon(Icons.assignment),
              ),
              Tab(
                text: "Balance",
                icon: Icon(Icons.account_balance_wallet),
              ),
            ],
          ),
        ),
        body: PageView(
          children: tabPages,
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
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
