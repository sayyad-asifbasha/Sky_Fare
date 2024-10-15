import 'package:flutter/material.dart';
import 'package:sky_fare/services/splash/splash_screen.dart';
class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  SplashServices _splashServices=SplashServices();
  @override
  void initState()
  {
    super.initState();
    _splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen",
          style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
