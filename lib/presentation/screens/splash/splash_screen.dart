import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.of(context).pushReplacementNamed(AppRouter.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // School Logo
            Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/school_logo.png'), // Changed to AssetImage
                  fit: BoxFit.contain,
                ),
              ),
            )
                .animate()
                .scale(delay: 200.ms, duration: 800.ms, curve: Curves.elasticOut)
                .fade(delay: 200.ms, duration: 600.ms),

            const SizedBox(height: 32),

            // School Name
            Text(
              'Saint Theresa School',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2E7D32),
              ),
              textAlign: TextAlign.center,
            )
                .animate()
                .slideY(delay: 1000.ms, begin: 1, duration: 600.ms)
                .fade(delay: 1000.ms, duration: 600.ms),

            const SizedBox(height: 8),

            Text(
              'Love • Truth • Wisdom',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF4CAF50),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            )
                .animate()
                .slideY(delay: 1200.ms, begin: 1, duration: 600.ms)
                .fade(delay: 1200.ms, duration: 600.ms),
          ],
        ),
      ),
    );
  }
}