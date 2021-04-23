import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  final String text;
  DemoScreen({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Text(text),
        ),
      ),
    );
  }
}
