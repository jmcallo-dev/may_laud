import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            height: 0.6.sh, // 60% of screen height
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/intro_page/intro_page1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          // BOTTOM CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "Welcome to Milaud",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C229C),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Serving all 20 barangays of Milaor\n"
                    "connects every resident to faster services,\n"
                    "clearer communication, and a community\n"
                    "updates, with essentials local services\n"
                    "all in one app.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
