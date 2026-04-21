import 'dart:ui';

import 'package:flutter/material.dart';

// Intro page 1
class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
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
                                'assets/images/intro_page1.png',
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
                                  filter:
                                      ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          0, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Row(
                                      children: const [
                                        CircleAvatar(
                                          backgroundColor: Color(0xFFEADDFF),
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
                                child:
                                    const Icon(Icons.edit, color: Colors.white),
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
                          "Serving all 20 barangays of Milaor (May-Laud) connects every resident to faster services, clearer communication, and a community that listens and responds.",
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
                        // Removed dot row
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text("Step 1 of 3"),
                //       GestureDetector(
                //         onTap: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (_) => const IntroPage2(),
                //             ),
                //           );
                //         },
                //         child: const CircleAvatar(
                //           backgroundColor: Color(0xFF4C229C),
                //           child: Icon(Icons.arrow_forward, color: Colors.white),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
