import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Spirit Within',
            style: TextStyle(
              color: Theme.of(context).textTheme.headline6.color,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('Nothing to see here yet'),
      ),
    );
  }
}
