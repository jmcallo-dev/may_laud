import 'dart:ui';
import 'package:flutter/material.dart';
import 'user_login/login_number.dart';

// Onboard background with gradient + glows
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
      home: OnboardingScreen(),
    );
  }
}

// ONBOARDING SCREEN WITH SWIPE ANIMATION
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnim = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _slideAnim = Tween(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _scaleAnim = Tween(begin: 0.96, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildDot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: active ? 28 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF4C229C) : const Color(0xFFD1C9E0),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildPage1() {
    return SingleChildScrollView(
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
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(0, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Color(0xFFEADDFF),
                            child: Icon(Icons.groups, color: Color(0xFF4C229C)),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "COMMUNITY HUB",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
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
                  child: const Icon(Icons.edit, color: Colors.white),
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
                colors: [Color(0xFF4C229C), Color(0xFF643EB5)],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Column(
              children: [
                Icon(Icons.history, color: Colors.white, size: 30),
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
                  "From the meaning of May-Laud—'towards the lowland'—our town's story flows through the Bicol River, shaping a community connected by culture, history, and resilience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD7C4FF),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 60), // Extra space for dots
        ],
      ),
    );
  }

  Widget _buildPage2() {
    return SingleChildScrollView(
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
                    image: AssetImage("assets/images/onboard2.png"),
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
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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

          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildPage3() {
    return SingleChildScrollView(
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
                      colors: [Colors.black, Colors.transparent],
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.verified, color: Colors.orange, size: 16),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6A4BC4), Color(0xFF8A6BFF)],
                      ),
                      borderRadius: BorderRadius.circular(20),
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

          const SizedBox(height: 60),
        ],
      ),
    );
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const OnboardBackground(),
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: SlideTransition(
                position: _slideAnim,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          children: [
                            _buildPage1(),
                            _buildPage2(),
                            _buildPage3(),
                          ],
                        ),
                      ),

                      // DOT INDICATORS
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildDot(_currentPage == 0),
                            const SizedBox(width: 8),
                            _buildDot(_currentPage == 1),
                            const SizedBox(width: 8),
                            _buildDot(_currentPage == 2),
                          ],
                        ),
                      ),

                      // BOTTOM NAVIGATION
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Step ${_currentPage + 1} of 3",
                              style: const TextStyle(
                                color: Color(0xFF6E6A75),
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            // NEXT BUTTON / GET STARTED BUTTON
                            if (_currentPage < 2)
                              GestureDetector(
                                onTap: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xFF4C229C),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            else
                              GestureDetector(
                                onTap: _navigateToLogin,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
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
                                    children: [
                                      Text(
                                        "Get Started",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
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
