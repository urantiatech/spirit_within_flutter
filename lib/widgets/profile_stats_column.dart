import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';

class ProfileStatsColumn extends StatelessWidget {
  final int number;
  final String statsTitle;
  const ProfileStatsColumn({
    @required this.number,
    @required this.statsTitle,
  });

  @override
  Widget build(BuildContext context) {
    var fullWidth = MediaQuery.of(context).size.width;
    return Container(
      width: fullWidth * 0.3,
      // color: Colors.red[100],
      child: Column(
        children: [
          Text(
            number.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: normalTextColor,
              fontFamily: 'SourceSansPro',
            ),
          ),
          Text(
            statsTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: subtleTextColor,
              fontFamily: 'SourceSansPro',
            ),
          ),
        ],
      ),
    );
  }
}
