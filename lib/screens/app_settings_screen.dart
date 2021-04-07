import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/icon_description_card.dart';

class AppSettingsScreen extends StatefulWidget {
  @override
  _AppSettingsScreenState createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCenteredAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconDescriptionCard(
              iconData: Icons.star_border_rounded,
              descTitle: 'Rate us',
              onPressedFunction: () {
                LaunchReview.launch();
              },
            ),
          ],
        ),
      ),
    );
  }
}
