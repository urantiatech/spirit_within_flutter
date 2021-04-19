import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/core/auth/sign_in_check.dart';
import 'package:spirit_within_flutter/core/auth/sign_out.dart';
import 'package:spirit_within_flutter/screens/app_settings_screen.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'package:spirit_within_flutter/screens/guest_user_profile_screen.dart';
import 'package:spirit_within_flutter/screens/invite_screen.dart';
import 'package:spirit_within_flutter/screens/manage_blogs_screen.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';
import 'package:spirit_within_flutter/widgets/expanded_secondary_button.dart';
import 'package:spirit_within_flutter/widgets/profile_picture_widget.dart';
import 'package:spirit_within_flutter/widgets/icon_description_card.dart';
import 'package:spirit_within_flutter/widgets/profile_stats_column.dart';

import '../main.dart';
import 'font_size_screen.dart';

String activeUserName;
String activeProfilePicturePath;

setActiveUserDetails({
  @required String activeUserName,
  String activeProfilePicturePath,
}) {
  sharedPreferences.setString("activeUserName", activeUserName);
  if (activeProfilePicturePath != "") {
    sharedPreferences.setString("profilePicturePath", activeProfilePicturePath);
  }
}

getActiveUserDetails() {
  activeUserName = sharedPreferences.getString("activeUserName");
  activeProfilePicturePath = sharedPreferences.getString("profilePicturePath");
}

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
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
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  ProfilePictureWidget(),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: 32,
                        //   width: 32,
                        // ),
                        // SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            activeUserName,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: fontSize28,
                              fontWeight: FontWeight.w400,
                              color: normalTextColor,
                              fontFamily: 'SourceSerifPro',
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          height: 32,
                          width: 32,
                          margin: EdgeInsets.only(bottom: 6),
                          child: FloatingActionButton(
                            backgroundColor: activeBlue,
                            // tooltip: "Edit Name",
                            heroTag: "ChangeNameButton",
                            onPressed: () async {
                              await showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.0),
                                  ),
                                ),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return SingleChildScrollView(
                                    child: BottomEditNameSheet(),
                                  );
                                },
                              );
                              setState(() {});
                            },
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
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
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

class BottomEditNameSheet extends StatefulWidget {
  @override
  _BottomEditNameSheetState createState() => _BottomEditNameSheetState();
}

class _BottomEditNameSheetState extends State<BottomEditNameSheet> {
  bool _validationEmptyError = false;
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (activeUserName != null) {
      _nameController.text = activeUserName + " ";
      _nameController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _nameController.text.length,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
            'Name',
            style: TextStyle(
              fontSize: fontSize20,
              fontWeight: FontWeight.w400,
              color: subtleTextColor,
              fontFamily: 'SourceSansPro',
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: _validationEmptyError
                      ? Color(0xFFE05031)
                      : moreSubtleTextColor),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Name',
                hintStyle: TextStyle(
                  color: moreSubtleTextColor,
                  fontSize: fontSize22,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: normalTextColor,
                fontSize: fontSize22,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.w400,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(30),
                // FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              controller: _nameController,
              textCapitalization: TextCapitalization.words,
              cursorColor: Theme.of(context).accentColor,
              autofocus: true,
              onChanged: (String keyword) {
                setState(() {
                  _validationEmptyError = false;
                });
              },
            ),
          ),
          SizedBox(height: 8),
          _validationEmptyError
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Name can\'t be empty',
                    style: TextStyle(
                      fontSize: fontSize18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFE05031),
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(height: 12),
          Row(
            children: [
              ExpandedPrimaryButton(
                buttonTitle: 'Save',
                fontSize: fontSize18,
                onPressedFunction: () {
                  setState(() {
                    _nameController.text.trim().isEmpty
                        ? _validationEmptyError = true
                        : _validationEmptyError = false;
                  });
                  if (_nameController.text.trim().isNotEmpty) {
                    activeUserName = _nameController.text.trim();
                    setActiveUserDetails(
                      activeUserName: activeUserName,
                      activeProfilePicturePath: activeProfilePicturePath ?? "",
                    );
                    Navigator.pop(context);
                  }
                },
              ),
              SizedBox(width: 12),
              ExpandedSecondaryButton(
                buttonTitle: 'Cancel',
                fontSize: fontSize18,
                onPressedFunction: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
