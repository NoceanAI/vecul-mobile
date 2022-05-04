import 'package:flutter/material.dart';
import 'package:vecul/ui/views/authentication/auth_view.dart';
import 'package:vecul/ui/views/chat/chat_view.dart';
import 'package:vecul/ui/views/dashboard/dashboard_view.dart';
import 'package:vecul/ui/views/index/index_view.dart';
import 'package:vecul/ui/views/messages/messages_view.dart';
import 'package:vecul/ui/views/onboarding/onboarding_view.dart';
import 'package:vecul/ui/views/profile/profile_view.dart';
import 'package:vecul/ui/views/splash/splash_view.dart';
import 'package:vecul/ui/views/verify_email/verify_email_view.dart';
import 'package:vecul/ui/widgets/route_animations/slide_page_route.dart';

part 'route_constants.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashView:
        return _materialPageRoute(child: const SplashView());
      case onboardingView:
        return _materialPageRoute(child: const OnboardingView());
      case authView:
        final index = settings.arguments as int;
        return _materialPageRoute(
          child: AuthView(
            tabIndex: index,
          ),
        );
      case verifyEmailView:
        final email = settings.arguments as String;
        return SlidePageRoute(
          page:  VerifyEmailView(emailAddress: email,)
        );
      case indexView:
        return _materialPageRoute(child: const IndexView());
      case profileView:
        return _materialPageRoute(child: const ProfileView());
      case messagesView:
        return _materialPageRoute(child: const MessagesView());
      case chatView:
        return _materialPageRoute(child: const ChatView());

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
