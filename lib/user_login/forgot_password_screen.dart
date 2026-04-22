// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_laud/user_login/forgot_password_otp_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// TOP LEFT SHAPE
          Positioned(
            top: -120.h,
            left: -120.w,
            child: Container(
              width: 280.w,
              height: 280.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF3E5F5).withOpacity(0.6),
              ),
            ),
          ),

          /// BOTTOM RIGHT SHAPE
          Positioned(
            bottom: 150.h,
            right: -80.w,
            child: Container(
              width: 200.w,
              height: 200.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE1D5F5).withOpacity(0.5),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),

                  /// BACK BUTTON
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Color(0xFF5E35B1)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// ICON (MATCHED STYLE)
                  Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4C229C), Color(0xFF643EB5)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF643EB5).withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.lock_reset,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),

                  SizedBox(height: 30.h),

                  /// TITLE
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2E0C6D),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// SUBTITLE
                  Text(
                    "Enter your registered phone number and\n"
                    "we’ll send you a verification code to\n"
                    "reset your password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xFF666666),
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 35.h),

                  /// INPUT LABEL
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF555555),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// PHONE FIELD (MATCH REGISTER STYLE)
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFFDDDDDD),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Text("🇵🇭", style: TextStyle(fontSize: 16.sp)),
                              SizedBox(width: 6.w),
                              Text(
                                "+63",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                            width: 1.w,
                            height: 24.h,
                            color: Colors.grey.shade300),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "9123456789",
                              border: InputBorder.none,
                              hintStyle:
                                  const TextStyle(color: Color(0xFFAAAAAA)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 35.h),

                  /// BUTTON (MATCH REGISTER)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OtpVerificationScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4C229C), Color(0xFF643EB5)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF643EB5),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Send Reset Code",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // /// BACK TO LOGIN
                  // TextButton(
                  //   onPressed: () => Navigator.pop(context),
                  //   child: const Text(
                  //     "Contact the admin officials\n"
                  //     "if your sim card lost\n"
                  //     "to reset your password.",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Color(0xFF5E35B1),
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(height: 30.h),

                  // /// FOOTER
                  // Text(
                  //   "Secure civic identity portal for Milaor residents.",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontSize: 13.sp,
                  //     color: Colors.grey[600],
                  //   ),
                  // ),

                  // SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
