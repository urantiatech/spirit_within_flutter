import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:spirit_within_flutter/screens/bottom_bar.dart';
import 'package:spirit_within_flutter/screens/my_profile_screen.dart';

import '../main.dart';

class ProfilePictureWidget extends StatefulWidget {
  @override
  _ProfilePictureWidgetState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  File _profilePictureImage;
  final picker = ImagePicker();

  Future _getImage({@required ImageSource imageSource}) async {
    final pickedFile = await picker.getImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _profilePictureImage = File(pickedFile.path);
      });
      _saveImage();
    } else {
      print('No image selected.');
    }
  }

  Future _saveImage() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String path = appDocumentsDirectory.path;
    var fileName = basename(_profilePictureImage.path);
    await _profilePictureImage.copy('$path/$fileName');
    setState(() {
      activeProfilePicturePath = '$path/$fileName';
    });
    setStateBottomBar();
    sharedPreferences.setString("profilePicturePath", activeProfilePicturePath);
    // await _profilePictureImage.copy(activeProfilePicturePath);
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('Camera'),
                onTap: () {
                  _getImage(imageSource: ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
              new ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text('Gallery'),
                onTap: () {
                  _getImage(imageSource: ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (activeProfilePicturePath != null) {
      _profilePictureImage = File(activeProfilePicturePath);
    }
    return Stack(
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
              backgroundColor: Colors.white38,
              backgroundImage: _profilePictureImage == null
                  ? AssetImage("assets/images/user.png")
                  : FileImage(_profilePictureImage),
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
            child: FloatingActionButton(
              backgroundColor: activeBlue,
              // tooltip: 'Pick Image',
              heroTag: "ChangePictureButton",
              onPressed: () {
                _showPicker(context);
              },
              splashColor: Color(0xFF4188FF),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
