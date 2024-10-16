import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/services/session_manager/session_controller.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserInPreference('isLogin').then((value) {
      if (value == "true") {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(context,
                RoutesNames.homeScreen, (Route<dynamic> route) => false));
      } else {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushNamedAndRemoveUntil(context,
                RoutesNames.signupScreen, (Route<dynamic> route) => false));
      }
    });
  }
}
