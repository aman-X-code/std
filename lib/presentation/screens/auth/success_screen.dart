import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:confetti/confetti.dart'; // Removed confetti import
import '../../../core/router/app_router.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  // late ConfettiController _confettiController; // Removed confetti controller

  @override
  void initState() {
    super.initState();
    // _confettiController = ConfettiController(duration: const Duration(seconds: 3)); // Removed confetti controller initialization

    // Start confetti animation
    // Future.delayed(const Duration(milliseconds: 500), () { // Removed confetti play
    //   _confettiController.play();
    // });

    // Navigate to dashboard after 4 seconds
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRouter.dashboard);
      }
    });
  }

  @override
  void dispose() {
    // _confettiController.dispose(); // Removed confetti controller disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Confetti
          // Align( // Removed ConfettiWidget
          //   alignment: Alignment.topCenter,
          //   child: ConfettiWidget(
          //     confettiController: _confettiController,
          //     blastDirectionality: BlastDirectionality.explosive,
          //     shouldLoop: false,
          //     colors: const [
          //       Colors.red,
          //       Colors.blue,
          //       Colors.green,
          //       Colors.yellow,
          //       Colors.orange,
          //       Colors.purple,
          //       Colors.pink,
          //       Colors.cyan,
          //     ],
          //     numberOfParticles: 50,
          //     gravity: 0.3,
          //   ),
          // ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Success Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4CAF50),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 60,
                    color: Colors.white,
                  ),
                )
                    .animate()
                    .scale(delay: 200.ms, duration: 800.ms, curve: Curves.elasticOut)
                    .fade(delay: 200.ms, duration: 600.ms),

                const SizedBox(height: 40),

                // Success Text
                Text(
                  'Account synced!',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .slideY(delay: 800.ms, begin: 0.5, duration: 600.ms)
                    .fade(delay: 800.ms, duration: 600.ms),

                const SizedBox(height: 16),

                Text(
                  'Your account has successfully synced\nwith DigiSchool.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .slideY(delay: 1000.ms, begin: 0.5, duration: 600.ms)
                    .fade(delay: 1000.ms, duration: 600.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}