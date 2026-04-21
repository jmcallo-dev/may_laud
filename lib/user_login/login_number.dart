// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:may_laud/user_login/home.dart';
import 'package:may_laud/user_login/screens/login_screens/account_not_found_screen.dart';
import 'package:may_laud/user_login/welcome_back.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

/// ---------------- PHONE NUMBER CHECKING LOGIN SCREEN ----------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

  /// Fake registered numbers (replace with API/database later)
  final List<String> registeredNumbers = [
    "9987654321",
    "9123456789",
  ];

  void handleContinue() {
    String phone = phoneController.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (registeredNumbers.contains(phone)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const WelcomeBackScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AccountNotFoundScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A1A),
      body: Stack(
        children: [
          // Premium background with gradient and subtle patterns
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0A0A1A),
                  Color(0xFF1A1A2E),
                  Color(0xFF16213E),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: CustomPaint(
              painter: _DotsPainter(),
            ),
          ),

          // Animated floating elements
          Positioned(
            top: 0.1.sh,
            right: 0.1.sw,
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF7B2CBF).withOpacity(0.3),
                    const Color(0xFF7B2CBF).withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0.15.sh,
            left: 0.05.sw,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF3A86FF).withOpacity(0.2),
                    const Color(0xFF3A86FF).withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),

                  // App Logo/Icon with glow effect
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF7B2CBF),
                          Color(0xFF3A0CA3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF7B2CBF).withOpacity(0.5),
                          blurRadius: 20.r,
                          spreadRadius: 5.r,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.phone_iphone,
                        size: 50.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Title
                  Text(
                    "Welcome to\nMay‑Laud",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Subtitle
                  Text(
                    "Please provide your phone number\nbelow to check if you have an account\nor if not please create your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFFA0A0C0),
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 50.h),

                  // Phone input card
                  Container(
                    padding: EdgeInsets.all(24.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E3A),
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20.r,
                          offset: Offset(0, 10.h),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PHONE NUMBER",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF8A8AC4),
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFF252547),
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: const Color(0xFF3A3A6A),
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text("🇵🇭",
                                      style: TextStyle(fontSize: 18.sp)),
                                  SizedBox(width: 8.w),
                                  Text(
                                    "+63",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white70,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                width: 1.w,
                                height: 24.h,
                                color: const Color(0xFF3A3A6A),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  maxLength: 10,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "9987654321",
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF6A6A8A),
                                      fontSize: 16.sp,
                                    ),
                                    border: InputBorder.none,
                                    counterText: '',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        // Continue button
                        GestureDetector(
                          onTap: handleContinue,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 18.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF7B2CBF),
                                  Color(0xFF3A0CA3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xFF7B2CBF).withOpacity(0.6),
                                  blurRadius: 15.r,
                                  offset: Offset(0, 5.h),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Secondary options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                            color: const Color(0xFFA0A0C0), fontSize: 14.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const WelcomeBackScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: const Color(0xFF7B2CBF),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.1)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: const Color(0xFF6A6A8A), fontSize: 14.sp),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.1)),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  // Guest button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeDashboard(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: const Color(0xFF1E1E3A),
                        border: Border.all(
                          color: const Color(0xFF3A3A6A),
                          width: 1.w,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Continue as Guest",
                          style: TextStyle(
                            color: const Color(0xFF8A8AC4),
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // Footer
                  Text(
                    "By continuing, you agree to our",
                    style: TextStyle(
                        color: const Color(0xFF6A6A8A), fontSize: 12.sp),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: const Color(0xFF8A8AC4),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text("•",
                          style: TextStyle(
                              color: const Color(0xFF6A6A8A), fontSize: 12.sp)),
                      SizedBox(width: 12.w),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: const Color(0xFF8A8AC4),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
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

/// Custom painter for background dots
class _DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2A2A4A).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final double spacing =
        size.width * 0.07; // Responsive spacing based on screen width
    final double dotRadius = size.width * 0.0035; // Responsive dot radius

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
