import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:image_picker/image_picker.dart';

class EditPictureWidget extends StatefulWidget {
  final String imgPath;
  final Function onPressedFunction;

  const EditPictureWidget({
    @required this.imgPath,
    @required this.onPressedFunction,
  });

  @override
  _EditPictureWidgetState createState() => _EditPictureWidgetState();
}

class _EditPictureWidgetState extends State<EditPictureWidget> {
  File _image;
  final picker = ImagePicker();

  Future _imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  _imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              backgroundImage: _image == null
                  ? AssetImage(
                      widget.imgPath,
                    )
                  : FileImage(_image),
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
              tooltip: 'Pick Image',
              heroTag: "ChangePictureButton",
              onPressed: _imgFromCamera,
              // onPressed: widget.onPressedFunction,
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
