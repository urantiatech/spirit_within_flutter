import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/app_settings_screen.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'package:spirit_within_flutter/screens/guest_user_profile_screen.dart';
import 'package:spirit_within_flutter/screens/invite_screen.dart';
import 'package:spirit_within_flutter/screens/manage_blogs_screen.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/edit_picture_widget.dart';
import 'package:spirit_within_flutter/widgets/icon_description_card.dart';
import 'package:spirit_within_flutter/widgets/profile_stats_column.dart';

import '../main.dart';
import 'font_size_screen.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isSignedIn", false);
    isSignedIn = false;
  }

  @override
  void initState() {
    super.initState();
    signInCheck();
  }

  @override
  Widget build(BuildContext context) {
    if (isSignedIn == null) {
      isSignedIn = false;
    }
    return !isSignedIn
        ? GuestUserProfileScreen()
        // ? SignInToContinueScreen()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  EditPictureWidget(
                    imgPath: 'assets/images/author.png',
                    onPressedFunction: () {},
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Adi Saputra',
                        style: TextStyle(
                          fontSize: fontSize28,
                          fontWeight: FontWeight.w400,
                          color: normalTextColor,
                          fontFamily: 'SourceSerifPro',
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 32,
                        width: 32,
                        child: FloatingActionButton(
                          onPressed: () {},
                          splashColor: Color(0xFF4188FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 32,
                      //   width: 32,
                      //   decoration: BoxDecoration(
                      //     color: activeBlue,
                      //     borderRadius: BorderRadius.only(
                      //       topRight: Radius.circular(10),
                      //       topLeft: Radius.circular(10),
                      //       bottomRight: Radius.circular(10),
                      //     ),
                      //   ),
                      //
                      //   child: IconButton(
                      //     splashColor: Color(0x113177E0),
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       Icons.edit,
                      //       color: Colors.white,
                      //       size: 16,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 8),
                  SizedBox(height: 12),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileStatsColumn(
                          number: 890,
                          statsTitle: 'Blogs',
                        ),
                        ProfileStatsColumn(
                          number: 23422,
                          statsTitle: 'Followers',
                        ),
                        ProfileStatsColumn(
                          number: 1601,
                          statsTitle: 'Following',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  DividerLine(),
                  IconDescriptionCard(
                    iconData: Icons.description_outlined,
                    descTitle: 'Manage Blogs',
                    onPressedFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageBlogsScreen(),
                        ),
                      );
                    },
                  ),
                  DividerLine(),
                  IconDescriptionCard(
                    iconData: Icons.settings_outlined,
                    descTitle: 'App Settings',
                    onPressedFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppSettingsScreen(),
                        ),
                      ).then((value) => {setState(() {})});
                    },
                  ),
                  DividerLine(),
                  IconDescriptionCard(
                    iconData: Icons.person_add_alt_1_outlined,
                    descTitle: 'Invite Friends',
                    onPressedFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InviteScreen(),
                        ),
                      );
                    },
                  ),
                  DividerLine(),
                  IconDescriptionCard(
                    iconData: Icons.exit_to_app_rounded,
                    descTitle: 'Sign Out',
                    onPressedFunction: () {
                      signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomBar(navigationIndex: 2),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text('Signed out successfully!'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
  }
}
