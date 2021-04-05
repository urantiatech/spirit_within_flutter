import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

AppBar buildCenteredAppBar({String title, List<Widget> actions}) {
  return AppBar(
    iconTheme: IconThemeData(
      color: normalTextColor,
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    actions: actions ?? [],
    title: Text(
      title ?? 'The Spirit Within',
      style: TextStyle(
        color: normalTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        fontFamily: 'SourceSerifPro',
      ),
    ),
  );
}
