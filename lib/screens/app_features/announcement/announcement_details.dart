import 'package:flutter/material.dart';

// ===================== ANNOUNCEMENTS FEED SCREEN (PIXEL-MATCH STYLE) =====================
class AnnouncementsFeedScreen extends StatelessWidget {
  const AnnouncementsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF6F1FA);
    // ignore: unused_local_variable
    const purple = Color(0xFF5B21B6);
    const dark = Color(0xFF2D145F);
    const muted = Color(0xFF7C7487);

    return Scaffold(
      backgroundColor: bg,
      bottomNavigationBar: Container(
        height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _BottomNavItem(icon: Icons.home_outlined, label: 'HOME'),
            _BottomNavItem(icon: Icons.newspaper, label: 'NEWS', active: true),
            _BottomNavItem(icon: Icons.event_note_outlined, label: 'EVENTS'),
            _BottomNavItem(icon: Icons.person_outline, label: 'PROFILE'),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.menu, color: dark),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Civic Square',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: dark,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 18,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const Text(
                'THE DAILY FLOW',
                style: TextStyle(
                  color: Color(0xFF7A5BC8),
                  fontSize: 14,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Announcements',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  color: dark,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Your digital porch for everything happening in Milaor, from emergency alerts to local festivities.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: muted,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0EAF5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: muted),
                    SizedBox(width: 10),
                    Text('Find specific updates...',
                        style: TextStyle(color: Color(0xFFB0A9BA))),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  _FilterChip(label: 'All', active: true),
                  _FilterChip(label: 'Emergency'),
                  _FilterChip(label: 'Events'),
                  _FilterChip(label: 'Public Notices'),
                ],
              ),
              const SizedBox(height: 28),
              _announcementCard(
                image:
                    'https://images.unsplash.com/photo-1500375592092-40eb2168fd21?q=80&w=1200&auto=format&fit=crop',
                tag: 'EMERGENCY',
                time: '2 hours ago',
                title: 'Bicol River Level Warning: Precautionary Measures',
                desc:
                    'Local authorities advise residents near the riverbank to remain vigilant as water levels rise due to monsoon rains.',
                footer: 'Read Full Alert  ➜',
                footerPurple: true,
              ),
              const SizedBox(height: 22),
              _textOnlyCard(),
              const SizedBox(height: 22),
              _recyclingCard(),
              const SizedBox(height: 22),
              _spotlightCard(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _announcementCard(
      {required String image,
      required String tag,
      required String time,
      required String title,
      required String desc,
      required String footer,
      bool footerPurple = false}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(34)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
            child: Image.network(image,
                height: 220, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFE2E2),
                        borderRadius: BorderRadius.circular(14)),
                    child: Text(tag,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFFD14A4A),
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(width: 10),
                  Text(time, style: const TextStyle(color: Color(0xFF9B94A5))),
                ]),
                const SizedBox(height: 18),
                Text(title,
                    style: const TextStyle(
                        fontSize: 22, height: 1.15, color: Color(0xFF2D145F))),
                const SizedBox(height: 14),
                Text(desc,
                    style:
                        const TextStyle(height: 1.7, color: Color(0xFF6D6678))),
                const SizedBox(height: 18),
                Text(footer,
                    style: TextStyle(
                        color: footerPurple
                            ? const Color(0xFF5B21B6)
                            : const Color(0xFF6D6678),
                        fontWeight: FontWeight.w700)),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget _textOnlyCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                _MiniTag(label: 'EVENTS'),
                Spacer(),
                Text('5 hours ago', style: TextStyle(color: Color(0xFF9B94A5)))
              ]),
              SizedBox(height: 18),
              Text('Upcoming Town Hall Meeting',
                  style: TextStyle(fontSize: 20, color: Color(0xFF2D145F))),
              SizedBox(height: 12),
              Text(
                  'Join us this Saturday at the Civic Plaza to discuss the new urban gardening initiative and heritage preservation projects.',
                  style: TextStyle(height: 1.7, color: Color(0xFF6D6678))),
            ]),
      );

  static Widget _recyclingCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            _MiniTag(label: 'PUBLIC NOTICES'),
            Spacer(),
            Text('Yesterday', style: TextStyle(color: Color(0xFF9B94A5)))
          ]),
          const SizedBox(height: 18),
          const Text('New Recycling Schedule',
              style: TextStyle(fontSize: 20, color: Color(0xFF2D145F))),
          const SizedBox(height: 12),
          const Text(
              'Starting next Monday, plastic and paper collection will move to bi-weekly intervals.',
              style: TextStyle(height: 1.7, color: Color(0xFF6D6678))),
          const SizedBox(height: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
                'https://images.unsplash.com/photo-1532996122724-e3c354a0b15b?q=80&w=1200&auto=format&fit=crop',
                height: 130,
                width: double.infinity,
                fit: BoxFit.cover),
          )
        ]),
      );

  static Widget _spotlightCard() => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: const Color(0xFFE9DDFC),
            borderRadius: BorderRadius.circular(34)),
        child: Column(children: [
          const Text('CIVIC SPOTLIGHT',
              style: TextStyle(
                  letterSpacing: 2,
                  color: Color(0xFF6A47BF),
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          const Text('Milaor Heritage Festival: Vendor Applications Open',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2D145F))),
          const SizedBox(height: 14),
          const Text(
              "Celebrate our roots! We're inviting local artisans and food vendors to showcase their craft.",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.7, color: Color(0xFF6D6678))),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B21B6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28))),
              child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                  child: Text('Apply Now',
                      style: TextStyle(color: Colors.white)))),
          const SizedBox(height: 22),
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFFF2EAFB),
                borderRadius: BorderRadius.circular(28)),
            child: const Icon(Icons.storefront_outlined,
                size: 56, color: Color(0xFF2D145F)),
          )
        ]),
      );
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool active;
  const _FilterChip({required this.label, this.active = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF5B21B6) : const Color(0xFFEFE8F4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: TextStyle(
              color: active ? Colors.white : const Color(0xFF625B6D),
              fontWeight: FontWeight.w600)),
    );
  }
}

class _MiniTag extends StatelessWidget {
  final String label;
  const _MiniTag({required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFE9DDFC),
          borderRadius: BorderRadius.circular(14)),
      child: Text(label,
          style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF6A47BF),
              fontWeight: FontWeight.w700)),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _BottomNavItem(
      {required this.icon, required this.label, this.active = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: active ? const Color(0xFFE9DDFC) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: const Color(0xFF2D145F), size: 20),
        ),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
