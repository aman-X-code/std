import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/router/app_router.dart'; // Assuming you have this router setup

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  // Handles the Google Sign-In logic
  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);

    try {
      // Simulate a network call for the sign-in process
      await Future.delayed(const Duration(seconds: 2));

      // In a real app, you would integrate with your authentication backend here.
      // For example: await yourAuthService.signInWithGoogle();

      if (mounted) {
        // On successful sign-in, navigate to the home or success screen
        Navigator.of(context).pushReplacementNamed(AppRouter.success);
      }
    } catch (error) {
      // If sign-in fails, show an error message to the user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in failed: $error')),
        );
      }
    } finally {
      // Ensure the loading state is reset, even if an error occurs
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Header: This is the logo section with adjusted dimensions.
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 55, // Slightly adjusted for balance
                    height: 55,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/school_logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 2,
                    height: 40,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 16),
                  Image.asset(
                    'assets/images/DiGiSchool_logo.png',
                    height: 40, // Increased height for better visibility
                  ),
                ],
              )
                  .animate()
                  .slideY(delay: 200.ms, begin: -0.5, duration: 600.ms)
                  .fade(delay: 200.ms, duration: 600.ms),

              const SizedBox(height: 80),

              // Welcome Text: This is the welcome message from your earlier code.
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              )
                  .animate()
                  .slideY(delay: 600.ms, begin: 0.5, duration: 600.ms)
                  .fade(delay: 600.ms, duration: 600.ms),

              const SizedBox(height: 8),

              Text(
                'continue with your registered\nGoogle ID',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              )
                  .animate()
                  .slideY(delay: 800.ms, begin: 0.5, duration: 600.ms)
                  .fade(delay: 800.ms, duration: 600.ms),

              // Google Sign In Button, shifted up from the center
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 220.0), // This pushes the button up
                  child: Center(
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _isLoading ? null : _handleGoogleSignIn,
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_isLoading)
                                  const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.black54,
                                    ),
                                  )
                                else
                                  Image.network(
                                    'https://developers.google.com/identity/images/g-logo.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                const SizedBox(width: 16),
                                Text(
                                  _isLoading
                                      ? 'Signing in...'
                                      : 'Continue with Google',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ).animate().slideY(delay: 1000.ms, begin: 0.5, duration: 600.ms).fade(delay: 1000.ms, duration: 600.ms),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
