import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator({this.currentIndex, this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      child: positionIndex == currentIndex
          ? Container(
              height: 1,
              width: 1,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).accentColor,
              ),
            )
          : SizedBox(),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).accentColor, width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
