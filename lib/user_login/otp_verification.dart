import 'package:flutter/material.dart';
import 'create_new_password.dart';

// ---------------- FORGOT PASSWORD FLOW (OTP VERIFICATION + NEW PASSWORD CREATION) ----------------
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());

  int seconds = 59;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (seconds > 0) {
        setState(() => seconds--);
        startTimer();
      }
    });
  }

  Widget otpBox(int index) {
    return Container(
      width: 50,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEAF3),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: index == 0 ? const Color(0xFF5E35B1) : Colors.transparent,
          width: 2,
        ),
      ),
      child: TextField(
        controller: controllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEF8),
      body: SafeArea(
        child: Column(
          children: [
            /// TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios, color: Color(0xFF5E35B1)),
                  SizedBox(width: 10),
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    /// ICON CIRCLE
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCD2F5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.verified_user_outlined,
                        color: Color(0xFF5E35B1),
                        size: 40,
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// TITLE
                    const Text(
                      "Verify Your Identity",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// SUBTEXT
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "We've sent a 6-digit verification code to your registered phone number +63 912 *** 6789",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// OTP BOXES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) => otpBox(index)),
                    ),

                    const SizedBox(height: 40),

                    /// BUTTON
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CreateNewPasswordScreen(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF4C229C), Color(0xFF643EB5)],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.purple,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Verify & Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// RESEND
                    Text.rich(
                      TextSpan(
                        text: "Didn't receive the code? ",
                        style: const TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text:
                                seconds > 0 ? "Resend (${seconds}s)" : "Resend",
                            style: const TextStyle(
                              color: Color(0xFF4C229C),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// FOOTER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.lock_outline, size: 16, color: Colors.grey),
                        SizedBox(width: 6),
                        Text(
                          "END-TO-END ENCRYPTED",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            letterSpacing: 1.2,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
