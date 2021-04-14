import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class EditPictureWidget extends StatelessWidget {
  final String imgPath;
  final Function onPressedFunction;

  const EditPictureWidget({
    @required this.imgPath,
    @required this.onPressedFunction,
  });

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
              backgroundImage: AssetImage(
                imgPath,
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
            child: FloatingActionButton(
              onPressed: onPressedFunction,
              splashColor: Color(0x9A3080FF),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
            // child: IconButton(
            //   splashColor: Color(0x113177E0),
            //   onPressed: onPressedFunction,
            //   icon: Icon(
            //     Icons.camera_alt,
            //     color: Colors.white,
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
