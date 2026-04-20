import 'package:flutter/material.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              color: const Color(0xFFF8F4FB),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        AssetImage('assets/images/chatbotavatar.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'May-Laud Concierge',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D0B74),
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xFF22C55E),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'ALWAYS ONLINE',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF77727F),
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Icon(Icons.close, size: 34, color: Color(0xFF4B4453)),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE7F2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'TODAY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Concierge',
                      style: TextStyle(
                        color: Color(0xFF5B21B6),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 14),
                    _chatBubble(
                      text:
                          'Marhay na aga! I am your May-Laud Assistant. How can I help you today?',
                      isUser: false,
                    ),
                    const SizedBox(height: 28),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'You',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF57515E),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    _chatBubble(
                      text:
                          'How do I report a clogged drainage in Del Rosario?',
                      isUser: true,
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Assistant',
                      style: TextStyle(
                        color: Color(0xFF5B21B6),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3EDF7),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'You can use the "Report Issue" feature on the home dashboard. Would you like me to open it for you?',
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.6,
                              color: Color(0xFF222222),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE4F6),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF6D28D9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.priority_high,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Report Issue',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF2D0B74),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Infrastructure &\nSanitation',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF5B21B6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF5B21B6),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Text(
                                    'Open\nNow',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        '•••',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFFA8A0AE),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom input area
            Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EAF4),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.sentiment_satisfied_alt,
                            color: Color(0xFF9A93A3), size: 28),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Text(
                            'Type your message...',
                            style: TextStyle(
                              color: Color(0xFF9A93A3),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: Color(0xFF5B21B6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 28,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      _chip('Emergency Contacts'),
                      const SizedBox(width: 12),
                      _chip('Business Permits'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _chatBubble({required String text, required bool isUser}) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: isUser ? 560 : 520,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF5B21B6) : const Color(0xFFF3EDF7),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            height: 1.6,
            color: isUser ? Colors.white : const Color(0xFF222222),
          ),
        ),
      ),
    );
  }

  static Widget _chip(String text) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD8D0DE)),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF514A58),
            ),
          ),
        ),
      ),
    );
  }
}
