import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller to keep track of which page we are on
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // page view
        PageView(
          controller: _controller,
          children: [
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.purpleAccent,
            ),
            Container(
              color: Colors.deepPurpleAccent,
            ),
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
