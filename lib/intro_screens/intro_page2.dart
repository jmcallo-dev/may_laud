// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            height: 0.62.sh, // 62% of screen height
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/intro_page/intro_page2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 BOTTOM CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),

                  /// TITLE
                  Text(
                    "Stay Connected\nwith Your Barangay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C229C),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// DESCRIPTION
                  Text(
                    "Get real-time announcements,\n"
                    "emergency alerts, local events\n"
                    "and important barangay updates\n"
                    "anytime anywhere.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
