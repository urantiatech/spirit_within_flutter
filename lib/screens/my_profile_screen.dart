import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/app_settings_screen.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'package:spirit_within_flutter/screens/invite_screen.dart';
import 'package:spirit_within_flutter/screens/manage_blogs_screen.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/icon_description_card.dart';
import 'package:spirit_within_flutter/widgets/profile_stats_column.dart';

import '../main.dart';
import 'font_size_screen.dart';
import 'sign-in/sign_in_to_continue_screen.dart';

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
        ? SignInToContinueScreen()
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Color(0x3F061730),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 59,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.green[200],
                            backgroundImage: AssetImage(
                              'assets/images/author.png',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            color: activeBlue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: IconButton(
                            splashColor: Color(0x113177E0),
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                        decoration: BoxDecoration(
                          color: activeBlue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          splashColor: Color(0x113177E0),
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
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
