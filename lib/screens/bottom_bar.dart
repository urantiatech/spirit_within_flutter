import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/author_list_screen.dart';
import 'package:spirit_within_flutter/screens/font_size_screen.dart';
import 'package:spirit_within_flutter/screens/homescreen.dart';
import 'package:spirit_within_flutter/screens/my_profile_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/left_aligned_app_bar.dart';

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
  double appBarFontSize = 20;

  List<Widget> tabPages = [
    HomeScreen(),
    AuthorsScreen(),
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
      appBar:
          isSignedIn ? buildLeftAlignedAppBar(context) : buildCenteredAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
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
          BottomNavigationBarItem(
            label: 'Profile',
            icon: isSignedIn
                ? Container(
                    height: 24,
                    width: 24,
                    foregroundDecoration: _pageIndex == 2
                        ? BoxDecoration()
                        : BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/dp.jpg'),
                      ),
                    ),
                  )
                : Icon(
                    Icons.person,
                    size: 24,
                  ),
          ),
        ],
        currentIndex: _pageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: normalTextColor,
        unselectedItemColor: inactiveBlue,
        selectedFontSize: fontSize12,
        unselectedFontSize: fontSize12,
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
