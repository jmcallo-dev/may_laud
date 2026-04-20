import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

//ANIMATION PAGE
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // controller to keep track of which page we are on
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        // page view
        PageView(
          controller: _controller,
          children: [
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.purpleAccent,
            ),
            Container(
              color: Colors.deepPurpleAccent,
            ),
          ],
        ),

        Container(
          alignment: Alignment(0, 0.75),
          child: SmoothPageIndicator(controller: _controller, count: 3),
        )
      ]),
    );
  }
}
