import 'dart:ui';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  final bool isGuest;

  const HomeDashboard({super.key, this.isGuest = false});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> fade;
  late Animation<Offset> slide;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    fade = Tween(begin: 0.0, end: 1.0).animate(_controller);
    slide = Tween(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// ================= PREMIUM GLASS =================
  Widget glass({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white,
            border: Border.all(color: Colors.white),
          ),
          child: child,
        ),
      ),
    );
  }

  /// ================= BUILD =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNav(),
      floatingActionButton: _fab(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF7F4FB),
              Color(0xFFEDE7F6),
              Color(0xFFE6E0F8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: fade,
            child: SlideTransition(
              position: slide,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ===== HEADER =====
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 26,
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.isGuest
                                  ? "Guest Mode"
                                  : "Marhay na aga 👋",
                              style: const TextStyle(color: Colors.black54),
                            ),
                            if (!widget.isGuest)
                              const Text(
                                "Juan",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3C0A6B),
                                ),
                              ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.notifications_none,
                            color: Color(0xFF6A4FB6))
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// LOCATION
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: Color(0xFF6A4FB6)),
                        SizedBox(width: 5),
                        Text("Brgy. Del Rosario, Milaor",
                            style: TextStyle(
                                color: Color(0xFF6A4FB6),
                                fontWeight: FontWeight.w500)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// SEARCH BAR
                    glass(
                      child: Row(
                        children: const [
                          Expanded(
                              child: Text("Search Services",
                                  style: TextStyle(color: Colors.black45))),
                          Icon(Icons.search, color: Color(0xFF6A4FB6))
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    /// SERVICES
                    glass(child: _services()),

                    const SizedBox(height: 25),

                    /// MAP
                    _map(),

                    const SizedBox(height: 25),

                    /// TRANSPARENCY
                    const Text("Transparency Board",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(child: _miniCard("Programs")),
                        const SizedBox(width: 10),
                        Expanded(child: _miniCard("Bids")),
                      ],
                    ),

                    const SizedBox(height: 25),

                    /// NEWS
                    glass(child: _news()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ================= SERVICES =================
  Widget _services() {
    final icons = [
      Icons.health_and_safety,
      Icons.directions_bus,
      Icons.devices,
      Icons.warning,
      Icons.water_drop,
      Icons.rocket,
      Icons.business,
      Icons.more_horiz,
    ];

    final names = [
      "Health",
      "Transport",
      "e-Services",
      "Emergency",
      "Utilities",
      "Startup",
      "Business",
      "More"
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: icons.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (_, i) {
        return GestureDetector(
          onTapDown: (_) => setState(() {}),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.transparent,
                  child: Icon(icons[i], color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              Text(names[i], style: const TextStyle(fontSize: 11))
            ],
          ),
        );
      },
    );
  }

  /// ================= MAP =================
  Widget _map() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        children: [
          Image.asset("assets/images/map.png",
              height: 180, width: double.infinity, fit: BoxFit.cover),
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A4FB6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Open Map"),
            ),
          )
        ],
      ),
    );
  }

  /// ================= MINI =================
  Widget _miniCard(String title) {
    return glass(
      child: Center(
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  /// ================= NEWS =================
  Widget _news() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Latest News", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text("New Bicol River Revitalization Project"),
      ],
    );
  }

  /// ================= FAB =================
  Widget _fab() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF6A4FB6),
      onPressed: () {},
      child: const Icon(Icons.notifications),
    );
  }

  /// ================= NAV =================
  Widget _bottomNav() {
    final icons = [
      Icons.home,
      Icons.grid_view,
      Icons.newspaper,
      Icons.description,
      Icons.person
    ];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (i) {
          return GestureDetector(
            onTap: () => setState(() => currentIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: currentIndex == i
                    ? const Color(0xFF6A4FB6)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icons[i],
                color: currentIndex == i ? Colors.white : Colors.black45,
              ),
            ),
          );
        }),
      ),
    );
  }
}
