import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/invite_screen.dart';
import 'package:spirit_within_flutter/screens/manage_blogs_screen.dart';
import 'package:spirit_within_flutter/screens/text_editor_screen.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/profile_stats_column.dart';
import 'package:launch_review/launch_review.dart';

import 'guest_profile.dart';

bool isSignedIn;

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  signInCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSignedIn = await prefs.getBool("isSignedIn");
    if (isSignedIn == null) {
      isSignedIn = false;
    }
    print('isSignedIn $isSignedIn');
  }

  signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isSignedIn", false);
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
        ? GuestProfile()
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
                          fontSize: 28,
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
                  // Text(
                  //   'Profession',
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w400,
                  //     color: subtleTextColor,
                  //     fontFamily: 'SourceSansPro',
                  //   ),
                  // ),
                  SizedBox(height: 12),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 30),
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
                    iconData: Icons.star_border_rounded,
                    descTitle: 'Rate us',
                    onPressedFunction: () {
                      LaunchReview.launch();
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
                      setState(() {
                        signOut();
                        isSignedIn = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextEditorScreen(),
                  ),
                );
              },
              label: Text(
                'New Blog',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontFamily: 'SourceSansPro',
                ),
              ),
              icon: Icon(Icons.edit_outlined),
            ),
          );
  }
}

class IconDescriptionCard extends StatelessWidget {
  final IconData iconData;
  final String descTitle;
  final Function onPressedFunction;

  const IconDescriptionCard({
    this.iconData,
    this.descTitle,
    this.onPressedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedFunction,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            IconButton(
              splashColor: Color(0x113177E0),
              onPressed: () {},
              icon: Icon(
                iconData,
                color: normalTextColor,
                size: 24,
              ),
            ),
            SizedBox(width: 8),
            Text(
              descTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: normalTextColor,
                fontFamily: 'SourceSansPro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
