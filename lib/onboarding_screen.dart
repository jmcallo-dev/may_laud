import 'package:flutter/material.dart';
import 'package:may_laud/intro_screens/intro_page1.dart';
import 'package:may_laud/intro_screens/intro_page2.dart';
import 'package:may_laud/intro_screens/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

//ANIMATION PAGE
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller to keep track of which page we are on
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // page view
        PageView(
          controller: _controller,
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),

        Container(
          alignment: Alignment(0, 0.75),
          child: SmoothPageIndicator(controller: _controller, count: 3),
        )
      ]),
    );
  }
}
