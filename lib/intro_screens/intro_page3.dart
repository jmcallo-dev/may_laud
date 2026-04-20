import 'package:flutter/material.dart';
import '../user_login/login_number.dart';

// Intro page 3
class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> fadeAnim;
  late Animation<Offset> slideAnim;
  late Animation<double> scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    fadeAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);

    slideAnim = Tween(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    scaleAnim = Tween(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget dot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF4C229C) : const Color(0xFFCBC3D5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Removed OnboardBackground() since it doesn't exist
          SafeArea(
            child: FadeTransition(
              opacity: fadeAnim,
              child: SlideTransition(
                position: slideAnim,
                child: ScaleTransition(
                  scale: scaleAnim,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const SizedBox(height: 40),

                              /// IMAGE
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/onboard3.png",
                                      height: 280,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),

                                    /// DARK GRADIENT
                                    Container(
                                      height: 280,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),

                                    /// TOP BADGE
                                    Positioned(
                                      top: 14,
                                      right: 14,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Row(
                                          children: [
                                            Icon(Icons.verified,
                                                color: Colors.orange, size: 16),
                                            SizedBox(width: 6),
                                            Text(
                                              "Confirmed",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF4C229C),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    /// BOTTOM BADGE
                                    Positioned(
                                      bottom: 14,
                                      left: 14,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 6),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF6A4BC4),
                                              Color(0xFF8A6BFF)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          "⚠ Priority Resolution",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// TITLE
                              const Text(
                                "Para sa Milaor\n Para sa Tawo.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C229C),
                                ),
                              ),

                              const SizedBox(height: 16),

                              /// DESCRIPTION
                              const Text(
                                "Report concerns, access services, and stay updated—May-Laud brings your barangay closer, faster, and more transparent than ever.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.6,
                                  color: Color(0xFF7A6F9B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(height: 10),

                              /// SLOGAN
                              const Text(
                                "Oragon kita! Let's build Milaor together.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF6A4BC4),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// DOTS
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  dot(false),
                                  const SizedBox(width: 6),
                                  dot(false),
                                  const SizedBox(width: 6),
                                  dot(true),
                                ],
                              ),

                              const SizedBox(height: 20),

                              const Text("Step 3 of 3"),

                              const SizedBox(height: 30),

                              /// START BUTTON
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) =>
                                          const LoginScreen(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF4C229C),
                                        Color(0xFF643EB5),
                                      ],
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Start Exploring",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(Icons.arrow_forward,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
