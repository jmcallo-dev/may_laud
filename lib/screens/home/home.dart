import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:may_laud/screens/app_features/chatbot/chatbot.dart';
import 'package:may_laud/screens/app_features/announcement/announcement_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primary = Color(0xFF6A3CC3);
  static const Color background = Color(0xFFF8F9FC);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF7A7A7A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        elevation: 4,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatBot(),
            ),
          );
        },
        child: SvgPicture.asset(
          'assets/images/svg/chatbot.svg',
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 28),
              _buildWelcomeCard(),
              const SizedBox(height: 28),
              _buildQuickActions(context),
              const SizedBox(height: 28),
              _buildCommunityStatus(),
              const SizedBox(height: 28),
              _buildNearbyReports(),
              const SizedBox(height: 28),
              _buildAnnouncements(context),
              const SizedBox(height: 28),
              _buildPolls(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(
                'assets/images/avatar.png',
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "May-Laud",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: textPrimary,
                  ),
                ),
                Text(
                  "Smart City Milaor",
                  style: TextStyle(
                    fontSize: 13,
                    color: textSecondary,
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.notifications_none,
            color: primary,
          ),
        )
      ],
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Marhay na aga, Rafael!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.white70,
              ),
              SizedBox(width: 4),
              Text(
                "Brgy. Del Rosario, Milaor",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Services",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 1.15,
          children: [
            _ServiceCard(
              icon: Icons.report_problem_outlined,
              title: "Report Issue",
            ),
            _ServiceCard(
              icon: Icons.water_drop_outlined,
              title: "Flood Alert",
            ),
            _ServiceCard(
              icon: Icons.how_to_vote_outlined,
              title: "Vote / Poll",
            ),
            _ServiceCard(
              icon: Icons.campaign_outlined,
              title: "Announcements",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AnnouncementsFeedScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCommunityStatus() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Community Impact",
                style: TextStyle(
                  color: textSecondary,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "12 Reports Submitted",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: textPrimary,
                ),
              ),
            ],
          ),
          Icon(
            Icons.bar_chart_rounded,
            size: 38,
            color: primary,
          )
        ],
      ),
    );
  }

  Widget _buildNearbyReports() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Nearby Reports",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 16),
        _ListTileCard(
          icon: Icons.lightbulb_outline,
          title: "Broken Streetlight",
          subtitle: "200m away",
        ),
        SizedBox(height: 12),
        _ListTileCard(
          icon: Icons.warning_amber_rounded,
          title: "Clogged Drainage",
          subtitle: "450m away",
          danger: true,
        ),
      ],
    );
  }

  Widget _buildAnnouncements(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LGU Announcement",
            style: TextStyle(
              color: primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Riverbank Restoration Begins Monday",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Flood mitigation and green space improvement project.",
            style: TextStyle(
              color: textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Upcoming Town Polls",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 16),
        _PollCard(
          title: "Rename Community Park?",
          subtitle: "154 votes",
          progress: 0.75,
        ),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home_filled, color: primary),
          Icon(Icons.campaign_outlined, color: textSecondary),
          Icon(Icons.warning_amber_rounded, color: textSecondary),
          Icon(Icons.person_outline, color: textSecondary),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const _ServiceCard({
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: HomeScreen.surface,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: HomeScreen.primary,
              size: 30,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool danger;

  const _ListTileCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.danger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HomeScreen.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: danger ? Colors.red : HomeScreen.primary,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: HomeScreen.textSecondary,
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

  const _PollCard({
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: HomeScreen.surface,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: HomeScreen.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Color(0xFFE9E3F3),
              valueColor: AlwaysStoppedAnimation(
                HomeScreen.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
