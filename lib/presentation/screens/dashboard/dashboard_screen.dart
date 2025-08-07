import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:confetti/confetti.dart';
import '../explore/explore_screen.dart';
import '../multimedia/multimedia_screen.dart';
import '../../widgets/glassmorphism_card.dart';
import '../../widgets/live_update_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 2));

    // Start confetti when entering home screen
    Future.delayed(const Duration(milliseconds: 500), () {
      _confettiController.play();
    });
  }

  final List<Widget> _screens = [
    const DashboardHomeScreen(),
    const ExploreScreen(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _screens,
          ),

          // Confetti for home screen
          if (_currentIndex == 0)
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                colors: const [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.yellow,
                  Colors.orange,
                  Colors.purple,
                ],
                numberOfParticles: 30,
                gravity: 0.2,
              ),
            ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

class DashboardHomeScreen extends StatelessWidget {
  const DashboardHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good morning,',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        'John Doe',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  child: Icon(
                    Icons.person_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            )
                .animate()
                .slideX(delay: 200.ms, begin: -0.2, duration: 400.ms)
                .fade(delay: 200.ms, duration: 400.ms),

            const SizedBox(height: 32),

            // Main Announcement Card
            GlassmorphismCard(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'UPCOMING EVENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Science Fair 2024',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'December 15, 2024 • 10:00 AM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
                .animate()
                .slideY(delay: 400.ms, begin: 0.3, duration: 500.ms)
                .fade(delay: 400.ms, duration: 500.ms),

            const SizedBox(height: 32),

            // Live Updates Section
            Row(
              children: [
                Text(
                  'Live Updates',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            )
                .animate()
                .slideX(delay: 600.ms, begin: -0.2, duration: 400.ms)
                .fade(delay: 600.ms, duration: 400.ms),

            const SizedBox(height: 16),

            // Live Update Items
            ...List.generate(4, (index) {
              final items = [
                {'title': 'New homework assigned', 'subtitle': 'Mathematics • Due tomorrow', 'icon': Icons.assignment_outlined, 'hasNew': true},
                {'title': 'Fee payment reminder', 'subtitle': 'Monthly fee due in 3 days', 'icon': Icons.payment_rounded, 'hasNew': true},
                {'title': 'New multimedia content', 'subtitle': '5 new videos available', 'icon': Icons.play_circle_outline, 'hasNew': false},
                {'title': 'Notice board update', 'subtitle': 'School holiday schedule', 'icon': Icons.notifications_outlined, 'hasNew': false},
              ];

              return LiveUpdateItem(
                title: items[index]['title'] as String,
                subtitle: items[index]['subtitle'] as String,
                icon: items[index]['icon'] as IconData,
                hasNewIndicator: items[index]['hasNew'] as bool,
                onTap: () {},
              )
                  .animate()
                  .slideX(
                delay: (800 + index * 100).ms,
                begin: 0.3,
                duration: 400.ms,
              )
                  .fade(
                delay: (800 + index * 100).ms,
                duration: 400.ms,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}