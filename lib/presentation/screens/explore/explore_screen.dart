import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../multimedia/multimedia_screen.dart';
import '../../widgets/explore_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> exploreItems = [
      {
        'title': 'Attendance',
        'icon': Icons.how_to_reg_rounded,
        'gradient': [const Color(0xFF667EEA), const Color(0xFF764BA2)],
        'onTap': () {},
      },
      {
        'title': 'Calendar',
        'icon': Icons.calendar_month_rounded,
        'gradient': [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
        'onTap': () {},
      },
      {
        'title': 'Fees',
        'icon': Icons.payment_rounded,
        'gradient': [const Color(0xFF667EEA), const Color(0xFF764BA2)],
        'onTap': () {},
      },
      {
        'title': 'Homework',
        'icon': Icons.assignment_rounded,
        'gradient': [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
        'onTap': () {},
      },
      {
        'title': 'Multimedia',
        'icon': Icons.play_circle_rounded,
        'gradient': [const Color(0xFF667EEA), const Color(0xFF764BA2)],
        'onTap': () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const MultimediaScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        },
      },
      {
        'title': 'Notice Board',
        'icon': Icons.campaign_rounded,
        'gradient': [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
        'onTap': () {},
      },
      {
        'title': 'Support',
        'icon': Icons.support_agent_rounded,
        'gradient': [const Color(0xFF667EEA), const Color(0xFF764BA2)],
        'onTap': () {},
      },
      {
        'title': 'My Account',
        'icon': Icons.person_rounded,
        'gradient': [const Color(0xFF4FACFE), const Color(0xFF00F2FE)],
        'onTap': () {},
      },
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Explore',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
                .animate()
                .slideX(delay: 200.ms, begin: -0.2, duration: 400.ms)
                .fade(delay: 200.ms, duration: 400.ms),

            const SizedBox(height: 8),

            Text(
              'Discover all the features available to you',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            )
                .animate()
                .slideX(delay: 400.ms, begin: -0.2, duration: 400.ms)
                .fade(delay: 400.ms, duration: 400.ms),

            const SizedBox(height: 32),

            // Grid of explore items
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemCount: exploreItems.length,
              itemBuilder: (context, index) {
                final item = exploreItems[index];
                return ExploreCard(
                  title: item['title'],
                  icon: item['icon'],
                  gradient: item['gradient'],
                  onTap: item['onTap'],
                )
                    .animate()
                    .scale(
                  delay: (600 + index * 100).ms,
                  duration: 400.ms,
                  curve: Curves.easeOutBack,
                )
                    .fade(delay: (600 + index * 100).ms, duration: 400.ms);
              },
            ),
          ],
        ),
      ),
    );
  }
}