import 'package:flutter/material.dart';
import 'package:vecul/ui/views/authentication/auth_view.dart';
import 'package:vecul/ui/views/onboarding/onboarding_view.dart';
import 'package:vecul/ui/views/splash/splash_view.dart';

part 'route_constants.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return _materialPageRoute(child: const SplashView());
      case onboardingView:
        return _materialPageRoute(child: const OnboardingView());
      case loginView:
        return _materialPageRoute(child: const AuthView());
      default:
        return _materialPageRoute(
          child: const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute _materialPageRoute({required Widget child}) {
    return MaterialPageRoute(builder: (context) => child);
  }
}
