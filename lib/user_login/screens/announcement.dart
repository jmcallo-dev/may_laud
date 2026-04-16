import 'package:flutter/material.dart';

// void openChatbotScreen(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const ConciergeChatScreen(),
//     ),
//   );
// }

// ===================== ANNOUNCEMENT SCREEN =====================
class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF5F0F8);
    const purple = Color(0xFF5B2BBF);
    const cardBg = Colors.white;
    // ignore: unused_local_variable
    const softurple = Color(0xFFF2EAFB);
    const textDark = Color(0xFF2E2438);
    const textMuted = Color(0xFF6F6878);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new, size: 18, color: textDark),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Civic Square',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF311B6B),
                      ),
                    ),
                  ),
                  Icon(Icons.bookmark_border),
                  SizedBox(width: 12),
                  Icon(Icons.share_outlined),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 260,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?q=80&w=1200&auto=format&fit=crop',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -28),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: cardBg,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 18,
                              offset: const Offset(0, 8),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              decoration: BoxDecoration(
                                color: purple,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'PUBLIC NOTICE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Row(
                              children: [
                                Icon(Icons.calendar_today_outlined,
                                    size: 14, color: textMuted),
                                SizedBox(width: 6),
                                Text('Published Oct 25, 2023',
                                    style: TextStyle(color: textMuted)),
                              ],
                            ),
                            const SizedBox(height: 22),
                            const Text(
                              'New Water Utility Maintenance Schedule',
                              style: TextStyle(
                                fontSize: 28,
                                height: 1.1,
                                fontWeight: FontWeight.w500,
                                color: textDark,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'The Municipal Engineering Office has announced the upcoming water utility upgrade cycle for the Milaor residential clusters. To ensure the continued reliability of our municipal water supply and improve pressure in higher-elevation zones, the Milaor Water District will be conducting essential maintenance and infrastructure upgrades over the next two weeks.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.9,
                                color: textMuted,
                              ),
                            ),
                            const SizedBox(height: 24),
                            _infoBox(
                              icon: Icons.access_time,
                              title: 'TIMEFRAME',
                              content: 'Oct 30 — Nov 12, 2023',
                              subtitle:
                                  'Intermittent interruptions daily between 1:00 PM and 4:00 PM.',
                            ),
                            const SizedBox(height: 16),
                            _infoBox(
                              icon: Icons.location_on_outlined,
                              title: 'AFFECTED AREAS',
                              content: 'Central Square & Riverbank District',
                              subtitle:
                                  'All residential and commercial blocks within the historic center.',
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'We advise all residents to store adequate water supplies during the morning hours. The upgrades include the installation of high-efficiency filtration nodes and the replacement of heritage piping sections that have served the community since the late 1980s.',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.9,
                                color: textMuted,
                              ),
                            ),
                            const SizedBox(height: 26),
                            const Text(
                              'What to Expect',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: textDark,
                              ),
                            ),
                            const SizedBox(height: 14),
                            ...[
                              'Temporary pressure reductions during peak heat hours (2 PM).',
                              'Minimal sediment appearance immediately following restoration (run faucets for 2 minutes).',
                              'On-site crews working along the North Heritage Corridor.'
                            ].map((item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 14),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Icon(Icons.check_circle_outline,
                                            size: 18, color: purple),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              height: 1.6,
                                              color: textMuted),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(height: 18),
                            Container(
                              padding: const EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEADCFB),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Community Support',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xFF3D2484)),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Have specific questions about your street's schedule? Connect with the Civic Concierge team.",
                                    style: TextStyle(
                                        height: 1.7, color: textMuted),
                                  ),
                                  const SizedBox(height: 18),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: purple,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                          'Contact Engineering Office',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.print_outlined),
                              label: const Text('Print Notice',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.report_problem_outlined),
                              label: const Text('Report Issue',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _infoBox(
      {required IconData icon,
      required String title,
      required String content,
      required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF4ECFA),
        borderRadius: BorderRadius.circular(22),
        border:
            const Border(left: BorderSide(color: Color(0xFF5B2BBF), width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: const Color(0xFF5B2BBF)),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 11,
                      letterSpacing: 1,
                      color: Color(0xFF7A6C90))),
            ],
          ),
          const SizedBox(height: 10),
          Text(content,
              style: const TextStyle(fontSize: 18, color: Color(0xFF2E2438))),
          const SizedBox(height: 10),
          Text(subtitle,
              style: const TextStyle(height: 1.6, color: Color(0xFF6F6878))),
        ],
      ),
    );
  }
}
