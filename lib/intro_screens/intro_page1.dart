import 'package:flutter/material.dart';

// Intro page 1
class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //TOP IMAGE (BACKGROUND STYLE)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/intro_page1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          // BOTTOM CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome to Milaud",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C229C),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Serving all 20 barangays of Milaor\n"
                    "connects every resident to faster services,\n"
                    "clearer communication, and a community\n"
                    "updates, with essentials local services\n"
                    "all in one app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
