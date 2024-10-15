import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
class SplashServices{
  void isLogin(BuildContext context)
  {
    Timer(const Duration(seconds: 3),
        ()=>
            Navigator.pushAndRemoveUntil(context, RoutesNames.signupScreen as Route<Object?>, (route)=>false));
  }
}