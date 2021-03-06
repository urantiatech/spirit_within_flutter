import 'package:flutter/material.dart';

import '../bottom_bar.dart';
import 'indicator.dart';
import 'intro_screen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int currentIndex = 0;
  double titleFontSize = 26;

  nextFunction() {
    if (currentIndex == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      );
    }
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: totalHeight / 10,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Spirit Within',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF061730),
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SourceSerifPro',
                    ),
                  ),
                ),
              ],
            ),
            PageView(
              controller: _pageController,
              children: [
                IntroScreen(
                  imgPath: 'assets/images/img1.jpg',
                ),
                IntroScreen(
                  imgPath: 'assets/images/img3.jpg',
                ),
                IntroScreen(
                  imgPath: 'assets/images/img4.jpg',
                ),
              ],
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            Positioned(
              bottom: 66,
              left: 30,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Indicator(
                    positionIndex: 0,
                    currentIndex: currentIndex,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 1,
                    currentIndex: currentIndex,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Indicator(
                    positionIndex: 2,
                    currentIndex: currentIndex,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 54,
              right: 30,
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: () => nextFunction(),
                  icon: Icon(
                    Icons.arrow_forward_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
