// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:may_laud/user_login/home.dart';
import 'package:may_laud/user_login/screens/login_screens/account_not_found_screen.dart';
import 'package:may_laud/user_login/welcome_back.dart';

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

/// ---------------- PREMIUM LOGIN SCREEN ----------------
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
    final size = MediaQuery.of(context).size;

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
            top: size.height * 0.1,
            right: size.width * 0.1,
            child: Container(
              width: 80,
              height: 80,
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
            bottom: size.height * 0.15,
            left: size.width * 0.05,
            child: Container(
              width: 60,
              height: 60,
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
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // App Logo/Icon with glow effect
                  Container(
                    width: 100,
                    height: 100,
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
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.phone_iphone,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Title
                  const Text(
                    "Welcome to\nMay‑Laud",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Subtitle
                  const Text(
                    "Enter your phone number to access your civic dashboard or create a new account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFA0A0C0),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Phone input card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E3A),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PHONE NUMBER",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8A8AC4),
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF252547),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFF3A3A6A),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: const [
                                  Text("🇵🇭", style: TextStyle(fontSize: 18)),
                                  SizedBox(width: 8),
                                  Text(
                                    "+63",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white70,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 12),
                              Container(
                                width: 1,
                                height: 24,
                                color: const Color(0xFF3A3A6A),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: "9987654321",
                                    hintStyle: TextStyle(
                                      color: Color(0xFF6A6A8A),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Continue button
                        GestureDetector(
                          onTap: handleContinue,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
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
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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

                  const SizedBox(height: 30),

                  // Secondary options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Color(0xFFA0A0C0)),
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
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            color: Color(0xFF7B2CBF),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.1)),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Color(0xFF6A6A8A)),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: Colors.white.withOpacity(0.1)),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

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
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFF1E1E3A),
                        border: Border.all(
                          color: const Color(0xFF3A3A6A),
                          width: 1,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Continue as Guest",
                          style: TextStyle(
                            color: Color(0xFF8A8AC4),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Footer
                  const Text(
                    "By continuing, you agree to our",
                    style: TextStyle(color: Color(0xFF6A6A8A)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Color(0xFF8A8AC4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text("•", style: TextStyle(color: Color(0xFF6A6A8A))),
                      SizedBox(width: 12),
                      Text(
                        "Privacy Policy",
                        style: TextStyle(
                          color: Color(0xFF8A8AC4),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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

/// Custom painter for background dots
class _DotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2A2A4A).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    const double spacing = 30;
    final double dotRadius = 1.5;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
