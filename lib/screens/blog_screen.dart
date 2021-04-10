import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/main.dart';
import 'package:spirit_within_flutter/widgets/centered_appbar.dart';
import 'package:spirit_within_flutter/widgets/divider_line.dart';

import '../constants/app_constants.dart';
import '../widgets/author_card.dart';
import 'font_size_screen.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  bool isFavourite = false;
  Icon starIconOutlined = Icon(
    Icons.star_border_rounded,
    color: normalTextColor,
    // color: Color(0xFFF1B94B),
  );
  Icon starIconFilled = Icon(
    Icons.star_rounded,
    color: Color(0xFFF1B94B),
  );
  @override
  Widget build(BuildContext context) {
    var fullHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildCenteredAppBar(
        actions: isSignedIn
            ? [
                IconButton(
                  icon: isFavourite ? starIconFilled : starIconOutlined,
                  tooltip: 'Add to Favourites',
                  onPressed: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                    isFavourite
                        ? ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Added to Favourites'),
                            ),
                          )
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text('Removed from Favourites'),
                            ),
                          );
                  },
                ),
              ]
            : [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.01, 0.5],
                  colors: [Colors.black, Colors.transparent],
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/blogbg.jpg',
                  fit: BoxFit.fill,
                  // height: fullHeight / 2,
                ),
              ),
            ),
            // ShaderMask(
            //   shaderCallback: (rect) {
            //     return LinearGradient(
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //       colors: [Colors.black, Colors.transparent],
            //     ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            //   },
            //   blendMode: BlendMode.dstIn,
            //   child: Image.asset(
            //     'assets/images/blogbg.jpg',
            //     fit: BoxFit.fill,
            //     height: fullHeight / 2,
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   child: Image.asset(
            //     'assets/images/blogbg.jpg',
            //     fit: BoxFit.fill,
            //     height: fullHeight / 2,
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
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
                            fontSize: fontSize16,
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
                      'How to Build a Succesful Design System',
                      style: TextStyle(
                        fontSize: fontSize24,
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
                        fontSize: fontSize18,
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
                        fontSize: fontSize20,
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
                        fontSize: fontSize18,
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
                        fontSize: fontSize20,
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
                          fontSize: fontSize14,
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
                        fontSize: fontSize20,
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
                        fontSize: fontSize18,
                        fontWeight: FontWeight.w400,
                        color: blogTextColor,
                        fontFamily: 'Rasa',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DividerLine(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  AuthorCard(
                    authorName: 'Robert Downey Jr.',
                    imgPath: 'assets/images/author.png',
                    followersCount: 33,
                    following: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: Stack(
      //   children: [
      //     Container(
      //       width: double.infinity,
      //       child: Image.asset(
      //         'assets/images/blogbg.jpg',
      //         fit: BoxFit.fill,
      //         height: fullHeight / 2,
      //       ),
      //     ),
      //     DraggableScrollableSheet(
      //       maxChildSize: 1.0,
      //       minChildSize: 0.5,
      //       builder: (BuildContext context, ScrollController scrollController) {
      //         return Container(
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             // borderRadius: BorderRadius.only(
      //             //   topLeft: Radius.circular(40),
      //             //   topRight: Radius.circular(40),
      //             // ),
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
