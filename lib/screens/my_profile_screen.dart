import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';
import 'package:spirit_within_flutter/widgets/profile_stats_column.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            Stack(
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
                      backgroundColor: Colors.green[200],
                      backgroundImage: AssetImage(
                        'assets/images/author.png',
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
                    child: IconButton(
                      splashColor: Color(0x113177E0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Adi Saputra',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: normalTextColor,
                    fontFamily: 'SourceSerifPro',
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: activeBlue,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: IconButton(
                    splashColor: Color(0x113177E0),
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Profession',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: subtleTextColor,
                fontFamily: 'SourceSansPro',
              ),
            ),
            SizedBox(height: 12),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileStatsColumn(
                    number: 89,
                    statsTitle: 'Blogs',
                  ),
                  ProfileStatsColumn(
                    number: 234,
                    statsTitle: 'Followers',
                  ),
                  ProfileStatsColumn(
                    number: 160,
                    statsTitle: 'Following',
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            DividerLine(),
            IconDescriptionCard(
              iconData: Icons.description_outlined,
              descTitle: 'Manage Blogs',
            ),
            DividerLine(),
            IconDescriptionCard(
              iconData: Icons.star_border_rounded,
              descTitle: 'Rate us',
            ),
            DividerLine(),
            IconDescriptionCard(
              iconData: Icons.person_add_alt_1_outlined,
              descTitle: 'Invite Friends',
            ),
            DividerLine(),
            IconDescriptionCard(
              iconData: Icons.exit_to_app_rounded,
              descTitle: 'Sign Out',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('New Blog'),
        icon: Icon(Icons.edit_outlined),
      ),
    );
  }
}

class IconDescriptionCard extends StatelessWidget {
  final IconData iconData;
  final String descTitle;
  const IconDescriptionCard({
    this.iconData,
    this.descTitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            IconButton(
              splashColor: Color(0x113177E0),
              onPressed: () {},
              icon: Icon(
                iconData,
                color: normalTextColor,
                size: 24,
              ),
            ),
            SizedBox(width: 8),
            Text(
              descTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: normalTextColor,
                fontFamily: 'SourceSansPro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
