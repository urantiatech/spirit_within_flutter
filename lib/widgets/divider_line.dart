import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Divider(
        color: Color(0xFFAEBED4),
      ),
    );
  }
}
