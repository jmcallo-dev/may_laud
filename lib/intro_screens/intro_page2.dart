import 'package:flutter/material.dart';
import 'intro_page3.dart';

// Intro page 2
class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2>
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
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    scaleAnim = Tween(begin: 0.96, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// DOT INDICATOR
  Widget _dot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: active ? 20 : 8,
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
                      /// CONTENT
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),

                              /// IMAGE SECTION
                              Stack(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 600),
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/onboard2.png"),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 20,
                                          offset: const Offset(0, 10),
                                        )
                                      ],
                                    ),
                                  ),

                                  /// GLOW EFFECT
                                  Positioned(
                                    right: -20,
                                    bottom: -20,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        color: Color(0x33643EB5),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 40),

                              /// LABEL
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD7C4FF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "OUR HERITAGE",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF4C229C),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// TITLE
                              const Text(
                                "Towards the Lowland",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C229C),
                                ),
                              ),

                              const SizedBox(height: 16),

                              /// DESCRIPTION
                              const Text(
                                "In the heart of Milaor Camarines Sur.\n"
                                "Its name, \"May-Laud\", is an ancient\n"
                                "orientation—meaning \"towards the\n"
                                "lowland\" or \"towards the sea.\"",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.5,
                                  color: Color(0xFF555555),
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// INFO CARD
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F0FA),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 15,
                                      offset: const Offset(0, 6),
                                    )
                                  ],
                                ),
                                child: const Column(
                                  children: [
                                    Text(
                                      "The Bicol River Pulse",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4C229C),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                      "Flowing through Milaor, the Bicol River has long been the lifeblood of our town—connecting communities, shaping livelihoods, and guiding our journey from the highlands to the sea.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF555555),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 30),

                              /// DOTS
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _dot(false),
                                  const SizedBox(width: 6),
                                  _dot(true),
                                  const SizedBox(width: 6),
                                  _dot(false),
                                ],
                              ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),

                      /// BOTTOM NAV
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Step 2 of 3"),
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const IntroPage3(),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                backgroundColor: Color(0xFF4C229C),
                                child: Icon(Icons.arrow_forward,
                                    color: Colors.white),
                              ),
                            ),
                          ],
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
