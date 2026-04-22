// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:may_laud/user_login/welcome_back.dart';
import 'package:may_laud/user_login/register.dart';
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

/// ---------------- WELCOME SCREEN ----------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void handleSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeBackScreen()),
    );
  }

  void handleRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),

              // App Logo/Icon with glow effect
              Container(
                width: 120.w,
                height: 120.h,
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
                  child: Image.asset(
                    'assets/images/milaud_logo.png',
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              // Welcome Title
              Text(
                "Welcome to MiLaud",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),

              SizedBox(height: 16.h),

              // Subtitle
              Text(
                "Please sign in to your account or register\nif you are new to the app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),

              SizedBox(height: 60.h),

              // Sign In Button
              GestureDetector(
                onTap: handleSignIn,
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
                        color: const Color(0xFF7B2CBF).withOpacity(0.6),
                        blurRadius: 15.r,
                        offset: Offset(0, 5.h),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
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

              SizedBox(height: 30.h),

              // Register Button
              GestureDetector(
                onTap: handleRegister,
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
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
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
                style:
                    TextStyle(color: const Color(0xFF6A6A8A), fontSize: 12.sp),
              ),
              SizedBox(height: 10.h),
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
                  SizedBox(width: 15.w),
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
            ],
          ),
        ),
      ),
    );
  }
}
