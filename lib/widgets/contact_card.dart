import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class ContactCard extends StatelessWidget {
  final String imgPath;
  final String contactName;
  final String number;
  final bool isInvited;
  final bool isUsing;
  const ContactCard({
    @required this.imgPath,
    @required this.contactName,
    @required this.number,
    @required this.isInvited,
    @required this.isUsing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.green[200],
                backgroundImage: AssetImage(
                  imgPath,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contactName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: normalTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: subtleTextColor,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ],
              ),
            ],
          ),
          isUsing
              ? Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xFF23C133),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: subtleTextColor,
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    ],
                  ),
                )
              : isInvited
                  ? Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Text(
                        'Invited',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: subtleTextColor,
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    )
                  : SecondaryButton(
                      buttonTitle: 'Invite',
                      onPressedFunction: () {
                        debugPrint('Follow Pressed');
                      },
                    ),
        ],
      ),
    );
  }
}
