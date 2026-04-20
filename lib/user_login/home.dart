import 'package:flutter/material.dart';
import 'package:may_laud/user_login/screens/chatbot.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF6F1FA);
    const purple = Color(0xFF6A3CC3);
    const lightPurple = Color(0xFFEFE7FB);
    const textDark = Color(0xFF2D1B57);

    ///Chatbot navigation example
    return Scaffold(
      backgroundColor: bg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatBot(),
            ),
          );
        }, //end of onPressed
        child: SvgPicture.asset(
          'assets/images/chatbot.svg',
          width: 28,
          height: 28,
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 20,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _navItem(Icons.home_outlined, 'Home', true),
            _navItem(Icons.person_outline, 'Announcements', false),
            _navItem(Icons.account_balance_outlined, 'Civic Hub', false),
            _navItem(Icons.campaign_outlined, 'Report', false),
            _navItem(Icons.person_outline, 'Profile', false),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'May-Laud',
                        style: TextStyle(
                          color: purple,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.notifications_none, color: purple),
                ],
              ),
              const SizedBox(height: 28),
              const Text(
                'Marhay na aga, Rafael!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: textDark,
                ),
              ),
              const SizedBox(height: 6),
              const Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 16, color: Colors.black54),
                  SizedBox(width: 4),
                  Text(
                    'Brgy. Del Rosario, Milaor',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                children: const [
                  _ActionCard(
                      icon: Icons.campaign_outlined, title: 'Report Issue'),
                  _ActionCard(icon: Icons.water, title: 'Flood Alert'),
                  _ActionCard(
                      icon: Icons.how_to_vote_outlined, title: 'Vote / Poll'),
                  _ActionCard(
                      icon: Icons.notifications_active_outlined,
                      title: 'Announcements'),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YOUR CIVIC IMPACT',
                      style: TextStyle(
                        color: Color(0xFFBFA9F2),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '12',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Reports Submitted',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _sectionCard(
                title: 'Active Near You',
                badge: '3 Nearby',
                child: Column(
                  children: const [
                    _NearbyItem(
                      icon: Icons.lightbulb_outline,
                      title: 'Broken Streetlight',
                      subtitle: 'Del Rosario Road • 200m away',
                    ),
                    SizedBox(height: 14),
                    _NearbyItem(
                      icon: Icons.warning_amber_rounded,
                      title: 'Clogged Drainage',
                      subtitle: 'Riverview Drive • 450m away',
                      danger: true,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'View Map Presence',
                      style: TextStyle(
                        color: purple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: lightPurple,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(28)),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1517457373958-b7bdd4587205?q=80&w=1200&auto=format&fit=crop',
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Milaor LGU Update',
                            style: TextStyle(
                              color: purple,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'New Riverbank\nRestoration Project\nBegins Monday',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 14),
                          Text(
                            'Join us as we revitalize the Bicol River ecosystem. This project will improve flood mitigation and create new public green spaces for all residents.',
                            style: TextStyle(height: 1.6, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: purple,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Read Full Story'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const CircleAvatar(
                              radius: 16, backgroundColor: Colors.white),
                          const SizedBox(width: 6),
                          const CircleAvatar(
                              radius: 16, backgroundColor: Colors.white),
                          const SizedBox(width: 6),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: purple,
                            child: const Text('+12',
                                style: TextStyle(fontSize: 11)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Upcoming Town Polls',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 18),
              const _PollCard(
                title: 'Rename Community\nPark?',
                subtitle: 'Ends in 2 days • 154 votes',
                progress: 0.75,
              ),
              const SizedBox(height: 16),
              const _PollCard(
                title: 'Zoning Ordinance\n2024',
                subtitle: 'Ends in 5 days • 89 votes',
                progress: 0.25,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionCard(
      {required String title, required String badge, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEFE7FB),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w800)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9C7FA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(badge),
              ),
            ],
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? const Color(0xFF6A3CC3) : Colors.black54),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                color: active ? const Color(0xFF6A3CC3) : Colors.black54)),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  const _ActionCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFE7FB),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: const Color(0xFF6A3CC3), size: 28),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _NearbyItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool danger;
  const _NearbyItem(
      {required this.icon,
      required this.title,
      required this.subtitle,
      this.danger = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                danger ? const Color(0xFFFDEAEA) : const Color(0xFFE8DDFB),
            child: Icon(icon,
                color: danger ? Colors.red : const Color(0xFF6A3CC3)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PollCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  const _PollCard(
      {required this.title, required this.subtitle, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE8DDFB),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.park_outlined, color: Color(0xFF6A3CC3)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(subtitle, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Color(0xFFE9E3F3),
                    valueColor: AlwaysStoppedAnimation(Color(0xFF6A3CC3)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ===================== NAVIGATION TO CHATBOT SCREEN =====================
// Use this on your button / icon / card tap

void openChatbotScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ChatBot(),
    ),
  );
}
