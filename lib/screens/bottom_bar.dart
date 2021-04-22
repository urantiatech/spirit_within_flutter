import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/config/urantia_icons_icons.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/core/auth/sign_in_check.dart';
import 'package:spirit_within_flutter/screens/author_list_screen.dart';
import 'package:spirit_within_flutter/screens/font_size_screen.dart';
import 'package:spirit_within_flutter/screens/homescreen.dart';
import 'package:spirit_within_flutter/screens/my_profile_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/left_aligned_app_bar.dart';

import 'dart:io';

class BottomBar extends StatefulWidget {
  final int navigationIndex;
  BottomBar({this.navigationIndex});
  @override
  _BottomBarState createState() => new _BottomBarState();
}

Function setStateBottomBar;

class _BottomBarState extends State<BottomBar> {
  File _profilePictureImage;
  int _pageIndex = 0;
  PageController _pageController;
  double appBarFontSize = 20;

  List<Widget> tabPages = [
    HomeScreen(),
    AuthorListScreen(),
    MyProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    setStateBottomBar = updateBottomBar;
    _pageIndex = widget.navigationIndex ?? 0;
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void updateBottomBar() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (activeProfilePicturePath != null) {
      _profilePictureImage = File(activeProfilePicturePath);
    }

    return Scaffold(
      appBar:
          isSignedIn ? buildLeftAlignedAppBar(context) : buildCenteredAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              UrantiaIcons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // Icons.people_alt,
              UrantiaIcons.people_audience_filled,
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
                        image: _profilePictureImage == null
                            ? AssetImage('assets/images/user.png')
                            : FileImage(_profilePictureImage),
                      ),
                    ),
                  )
                : Icon(
                    UrantiaIcons.profile,
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
