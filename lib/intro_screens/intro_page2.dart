import 'package:flutter/material.dart';
import 'intro_page3.dart';

// Intro page 2
class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
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
                                  image:
                                      AssetImage("assets/images/onboard2.png"),
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
                        // Removed dot row
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                /// BOTTOM NAV
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
