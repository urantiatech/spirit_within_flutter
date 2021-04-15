import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/core/auth/sign_in.dart';
import 'package:spirit_within_flutter/screens/sign-in/sign_in_to_continue_screen.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/profile_picture_widget.dart';
import 'package:spirit_within_flutter/widgets/expanded_primary_button.dart';

import '../bottom_bar.dart';
import '../font_size_screen.dart';
import '../my_profile_screen.dart';

class UserDataInputScreen extends StatefulWidget {
  @override
  _UserDataInputScreenState createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  bool _validationEmptyError = false;
  TextEditingController _nameController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = activeUserName + " ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProfilePictureWidget(
                    imgPath: activeProfilePicturePath,
                  ),
                ),
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
                Text(
                  'Your name will be visible to anyone using this app',
                  style: TextStyle(
                    fontSize: fontSize16,
                    fontWeight: FontWeight.w400,
                    color: subtleTextColor,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
                SizedBox(height: 22),
                Row(
                  children: [
                    ExpandedPrimaryButton(
                      buttonTitle: 'Let\'s Go!',
                      fontSize: fontSize22,
                      onPressedFunction: () {
                        setState(() {
                          _nameController.text.isEmpty
                              ? _validationEmptyError = true
                              : _validationEmptyError = false;
                        });
                        if (_nameController.text.isNotEmpty) {
                          activeUserName = _nameController.text;
                          setActiveUserDetails(
                            activeUserName: activeUserName,
                            activeProfilePicturePath:
                                activeProfilePicturePath ?? "",
                          );
                          signIn();
                          if (returnRoute != null) {
                            Navigator.popUntil(
                                context, ModalRoute.withName(returnRoute));
                            returnRoute = null;
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BottomBar(navigationIndex: 2),
                                ),
                                (route) => false);
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Signed in successfully!'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
