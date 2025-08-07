import 'package:flutter/material.dart';
import '../../presentation/screens/auth/login_screen.dart';
import '../../presentation/screens/auth/success_screen.dart';
import '../../presentation/screens/dashboard/dashboard_screen.dart';
import '../../presentation/screens/explore/explore_screen.dart';
import '../../presentation/screens/multimedia/multimedia_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String success = '/success';
  static const String dashboard = '/dashboard';
  static const String explore = '/explore';
  static const String multimedia = '/multimedia';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _createRoute(const SplashScreen());
      case login:
        return _createRoute(const LoginScreen());
      case success:
        return _createRoute(const SuccessScreen());
      case dashboard:
        return _createRoute(const DashboardScreen());
      case explore:
        return _createRoute(const ExploreScreen());
      case multimedia:
        return _createRoute(const MultimediaScreen());
      default:
        return _createRoute(
          const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        var offsetAnimation = animation.drive(tween);
        var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: curve),
        );

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}