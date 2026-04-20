import 'dart:ui';
import 'package:flutter/material.dart';
import 'user_login/login_number.dart';

// onboard background with gradient + glows
class OnboardBackground extends StatelessWidget {
  const OnboardBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// MAIN GRADIENT
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF4F0FA),
                Color(0xFFEDE7F6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        /// TOP RIGHT GLOW
        Positioned(
          top: -60,
          right: -40,
          child: Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
              color: Color(0x33643EB5),
              shape: BoxShape.circle,
            ),
          ),
        ),

        /// BOTTOM LEFT GLOW
        Positioned(
          bottom: -80,
          left: -50,
          child: Container(
            width: 220,
            height: 220,
            decoration: const BoxDecoration(
              color: Color(0x224C229C),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningScreen(),
    );
  }
}

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  double progress = 0;
  bool isNavigated = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnim = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
    startLoading();
  }

  void startLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 40)); // speed control

      if (!mounted) return;

      setState(() {
        progress = i / 100;
      });
    }

    //Delay opening to onboard screen1
    await Future.delayed(const Duration(milliseconds: 500)); // pause on READY

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get loadingText {
    if (progress < 0.3) return "INITIALIZING...";
    if (progress < 0.7) return "CONNECTING...";
    if (progress < 0.9) return "SECURING DATA...";
    return "READY!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: FadeTransition(
              opacity: _fadeAnim,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(-0.32, 0.14),
                    end: Alignment(1.32, 0.86),
                    colors: [
                      Color(0xFF4C229C),
                      Color(0xFF643EB5),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),

                      // CENTER SECTION (IMAGE + TEXT TOGETHER)
                      Column(
                        children: [
                          //IMAGE (TRANSPARENT)
                          ScaleTransition(
                            scale: _scaleAnim,
                            child: Image.asset(
                              'assets/images/openinglogo.png',
                              width: 140,
                              height: 140,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // 🟣 TEXT
                          const Text(
                            'MAY-LAUD',
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans', // ✅ APPLY FONT
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'MILAOR, CAMARINES SUR',
                            style: TextStyle(
                              color: Color(0xCCEADDFF),
                              fontSize: 12,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),

                      //LOADING SECTION
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 4,
                                backgroundColor: Colors.white24,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              loadingText,
                              style: const TextStyle(
                                fontSize: 12,
                                letterSpacing: 2,
                                color: Colors.white70,
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
          );
        },
      ),
    );
  }
}

// ONBOARDING 1 SCREEN
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
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

  static Widget _dot() {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: const Color(0xFFD1C9E0),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static Widget _activeDot() {
    return Container(
      width: 28,
      height: 8,
      decoration: BoxDecoration(
        color: const Color(0xFF4C229C),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnboardBackground(), // ✅ ADDED BACKGROUND
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

                              // IMAGE + GLASS CARD
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Image.asset(
                                      'assets/images/onboard1.png',
                                      height: 320,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 20,
                                    right: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 15, sigmaY: 15),
                                        child: Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                0, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Row(
                                            children: const [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Color(0xFFEADDFF),
                                                child: Icon(Icons.groups,
                                                    color: Color(0xFF4C229C)),
                                              ),
                                              SizedBox(width: 12),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "COMMUNITY HUB",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Connected & Resilient",
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF4C229C),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.edit,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 30),

                              const Text(
                                "Your Digital Town Hall\nof Milaor",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C229C),
                                ),
                              ),

                              const SizedBox(height: 16),

                              const Text(
                                "Serving all 20 barangays of Milaor—May-Laud connects every resident to faster services, clearer communication, and a community that listens and responds.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF6E6A75),
                                  height: 1.5,
                                ),
                              ),

                              const SizedBox(height: 30),

                              AnimatedContainer(
                                duration: const Duration(milliseconds: 600),
                                width: double.infinity,
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF4C229C),
                                      Color(0xFF643EB5)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                child: const Column(
                                  children: [
                                    Icon(Icons.history,
                                        color: Colors.white, size: 30),
                                    SizedBox(height: 16),
                                    Text(
                                      "Rooted in Milaor",
                                      style: TextStyle(
                                        color: Color(0xFFD7C4FF),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "From the meaning of May-Laud—'towards the lowland'—our town’s story flows through the Bicol River, shaping a community connected by culture, history, and resilience.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFD7C4FF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _activeDot(),
                                  const SizedBox(width: 8),
                                  _dot(),
                                  const SizedBox(width: 8),
                                  _dot(),
                                ],
                              ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Step 1 of 3"),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const OnboardingScreen2(),
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

// ONBOARDING 2 SCREEN
class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2>
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
          const OnboardBackground(), // ✅ BACKGROUND APPLIED
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
                                    builder: (_) => const OnboardingScreen3(),
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

/// ONBOARDING 3 SCREEN
class OnboardingScreen3 extends StatefulWidget {
  const OnboardingScreen3({super.key});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3>
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
          const OnboardBackground(), // ✅ background applied
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
                                "Oragon kita! Let’s build Milaor together.",
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
