// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

// Intro page 2
class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //TOP IMAGE (same as IntroPage1)
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.62,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/intro_page2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 BOTTOM CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  /// TITLE
                  const Text(
                    "Stay Connected\nwith Your Barangay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C229C),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  const Text(
                    "Get real-time announcements,\n"
                    "emergency alerts, local events\n"
                    "and important barangay updates\n"
                    "anytime anywhere.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black,
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
