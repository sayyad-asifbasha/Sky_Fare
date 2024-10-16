import 'package:flutter/material.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/pages/home.dart';
import 'package:sky_fare/pages/views.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => const Login());
      case RoutesNames.signupScreen:
        return MaterialPageRoute(builder: (context) => const Signup());
      case RoutesNames.splashscreen:
        return MaterialPageRoute(builder: (context) => const splash_screen());
      case RoutesNames.OTPscreen:
        return MaterialPageRoute(builder: (context) => const OtpVerification());
      case RoutesNames.homeScreen:
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text(" Route unavailable"),
            ),
          );
        });
    }
  }
}
