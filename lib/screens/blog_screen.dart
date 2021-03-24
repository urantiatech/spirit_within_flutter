import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/widgets/secondary_button.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: normalTextColor,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Spirit Within',
          style: TextStyle(
            color: normalTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/blogbg.jpg',
              fit: BoxFit.fill,
              height: 400,
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 1.0,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30,
                          right: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: subtleTextColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '13:42, December 13, 2020',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: subtleTextColor,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'How to Building a Succesful Design System',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: normalTextColor,
                            fontFamily: 'SourceSerifPro',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'The designers did their work primarily in Sketch. They translated their vision of the product into static designs. The developers then wrote HTML, CSS, Javascript and PHP to convert these static designs into a working product.\n\n'
                          'One of the biggest ambitions inside the company was to find a way to make this process less time consuming as the work was basically done twice.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: blogTextColor,
                            fontFamily: 'Rasa',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'System-ception: a system within a system',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: normalTextColor,
                            fontFamily: 'SourceSerifPro',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'When we started to tackle creating our system in Figma, we took a step back to re-evaluate what we’d done in Sketch, questioning the decisions we’d made about layout, visual hierarchy, and naming convention, to name a few. We realized that in order to create a strong foundation in these new libraries.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: blogTextColor,
                            fontFamily: 'Rasa',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'The next big thing is the one that makes the last big thing usable.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: subtleTextColor,
                            fontFamily: 'SourceSerifPro',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Blake Ross, Co-creator of Mozilla Firefox',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: subtleTextColor,
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Conclusion',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: normalTextColor,
                            fontFamily: 'SourceSerifPro',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'A product is only ever as good as its UX. You can have the most innovative technology, but if it isn’t user-friendly, it wileam adoption. Products like the iPod and the iPhone would never have become so popular based on the technology alone; what really sealed the deal is the fact that they have great UX. ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: blogTextColor,
                            fontFamily: 'Rasa',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          color: Color(0xFFAEBED4),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 8,
                                        color: Color(0x5F061730),
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 23,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.green[200],
                                      backgroundImage: AssetImage(
                                        'assets/images/author.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Supriatna Richard',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: normalTextColor,
                                        fontFamily: 'SourceSansPro',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      '34 followers',
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
                            SecondaryButton(
                              buttonTitle: 'Follow',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
