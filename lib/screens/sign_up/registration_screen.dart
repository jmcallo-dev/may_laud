// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:may_laud/user_login/screens/login_screens/verification_screen.dart';

class PasswordField extends StatefulWidget {
  final Function(String) onChanged;

  const PasswordField({super.key, required this.onChanged});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
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
          const Icon(Icons.lock_outline, color: Color(0xFF666666)),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              obscureText: obscure,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: InputBorder.none,
                hintStyle: TextStyle(color: const Color(0xFFAAAAAA)),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: const Color(0xFF666666),
            ),
            onPressed: () => setState(() => obscure = !obscure),
          ),
        ],
      ),
    );
  }
}

class ConfirmPasswordField extends StatefulWidget {
  final String password;

  const ConfirmPasswordField({super.key, required this.password});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool obscure = true;
  bool match = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
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
              const Icon(Icons.lock_outline, color: Color(0xFF666666)),
              SizedBox(width: 12.w),
              Expanded(
                child: TextField(
                  obscureText: obscure,
                  onChanged: (val) {
                    setState(() {
                      match = val == widget.password;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Re-enter your password",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: const Color(0xFFAAAAAA)),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF666666),
                ),
                onPressed: () => setState(() => obscure = !obscure),
              ),
            ],
          ),
        ),
        if (!match)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              "Passwords do not match",
              style: TextStyle(color: Colors.red, fontSize: 12.sp),
            ),
          ),
      ],
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

String? selectedBarangay;
String passwordValue = "";

final List<String> barangays = [
  "San Roque",
  "Del Rosario",
  "San Jose",
  "Amparado",
  "Lipot",
  "Borongborongan",
  "San Antonio",
  "Capucnasan",
  "Sto Dominggo"
];

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    void showBarangayModal() {
      String? tempSelected = selectedBarangay;
      TextEditingController searchController = TextEditingController();
      List<String> filteredBarangays = List.from(barangays);

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        backgroundColor: Colors.white,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setModalState) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 12.h,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  /// HANDLE
                  Container(
                    width: 50.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// HEADER (Title + Close)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 30.w),
                      Text(
                        "Select Barangay",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A1B9A),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: Color(0xFF6A1B9A)),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  /// SEARCH BAR
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 1.5,
                      ),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setModalState(() {
                          filteredBarangays = barangays
                              .where((b) =>
                                  b.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: Color(0xFF6A1B9A)),
                        hintText: "Search your barangay...",
                        hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  /// LOCATION TEXT
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 18.sp, color: Colors.grey),
                      SizedBox(width: 6.w),
                      Text(
                        "MILAOR, CAMARINES SUR",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),

                  /// LIST
                  SizedBox(
                    height: 300.h,
                    child: ListView.builder(
                      itemCount: filteredBarangays.length,
                      itemBuilder: (context, index) {
                        final item = filteredBarangays[index];

                        return GestureDetector(
                          onTap: () {
                            setModalState(() {
                              tempSelected = item;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: tempSelected == item
                                  ? const Color(0xFFF3E5F5)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: tempSelected == item
                                    ? const Color(0xFF6A1B9A)
                                    : const Color(0xFFE0E0E0),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: tempSelected == item
                                        ? const Color(0xFF6A1B9A)
                                        : Colors.black87,
                                  ),
                                ),
                                Icon(
                                  tempSelected == item
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: tempSelected == item
                                      ? const Color(0xFF6A1B9A)
                                      : Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 10.h),

                  /// CONFIRM BUTTON
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: const Color(0xFF6A1B9A),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6A1B9A).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedBarangay = tempSelected;
                        });
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        child: Text(
                          "Confirm Selection",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ],
                ]),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// TOP LEFT SOFT CIRCLE
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

          /// BOTTOM RIGHT GLOW
          Positioned(
            bottom: 180.h,
            right: -80.w,
            child: Container(
              width: 180.w,
              height: 180.w,
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
                  SizedBox(height: 40.h),

                  /// TITLE
                  Text(
                    "Let's",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E0C6D),
                    ),
                  ),
                  Text(
                    "Register your account",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  /// SUBTEXT
                  Text(
                    "Please provide your details below to\n"
                    "create your account and get started.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 25.h),

                  /// FIRST NAME & LAST NAME
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First Name",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF555555),
                                fontSize: 14.sp,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            _inputField(
                              icon: Icons.person_outline,
                              hint: "Juan",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last Name",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF555555),
                                fontSize: 14.sp,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            _inputField(
                              icon: Icons.person_outline,
                              hint: "Dela Cruz",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  /// PHONE NUMBER
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF555555),
                        fontSize: 14.sp,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "We'll use this for verification and important updates",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF888888),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
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
                                    color: Color(0xFF333333)),
                              ),
                              SizedBox(width: 4.w),
                              Icon(Icons.keyboard_arrow_down,
                                  size: 18.sp, color: Color(0xFF666666)),
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
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Color(0xFFAAAAAA)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Barangay Selection
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Barangay",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF555555),
                        fontSize: 14.sp,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select your barangay to locate your area",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF888888),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  GestureDetector(
                    onTap: showBarangayModal,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xFFDDDDDD),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: Color(0xFF666666)),
                              SizedBox(width: 12.w),
                              Text(
                                selectedBarangay ?? "Select your barangay",
                                style: TextStyle(
                                  color: selectedBarangay == null
                                      ? Color(0xFFAAAAAA)
                                      : Color(0xFF333333),
                                  fontWeight: selectedBarangay == null
                                      ? FontWeight.normal
                                      : FontWeight.w600,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_drop_down, color: Color(0xFF666666)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  /// PASSWORD
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF555555),
                        fontSize: 14.sp,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create a strong password with at least 8 characters, numbers, and letters",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF888888),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  PasswordField(
                    onChanged: (val) {
                      setState(() {
                        passwordValue = val;
                      });
                    },
                  ),

                  SizedBox(height: 20.h),

                  /// CONFIRM PASSWORD
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF555555),
                        fontSize: 14.sp,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Re-enter your password to confirm",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF888888),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  ConfirmPasswordField(password: passwordValue),

                  SizedBox(height: 20.h),

                  /// REGISTER BUTTON
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VerificationScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
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
                          "Register now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static Widget _inputField({
    required IconData icon,
    required String hint,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
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
          Icon(icon, color: const Color(0xFF666666)),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                hintStyle: TextStyle(color: const Color(0xFFAAAAAA)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
