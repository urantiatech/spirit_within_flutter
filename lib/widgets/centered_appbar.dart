import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

AppBar buildCenteredAppBar(
    {String title, List<Widget> actions, Widget leading}) {
  double appBarFontSize = 20;
  return AppBar(
    iconTheme: IconThemeData(
      color: normalTextColor,
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    leading: leading ?? null,
    actions: actions ?? [],
    title: Text(
      title ?? 'The Spirit Within',
      style: TextStyle(
        color: normalTextColor,
        fontWeight: FontWeight.w600,
        fontSize: appBarFontSize,
        fontFamily: 'SourceSerifPro',
      ),
    ),
  );
}
