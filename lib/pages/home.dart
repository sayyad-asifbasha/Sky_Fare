import 'package:flutter/material.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/services/session_manager/session_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: IconButton(
          onPressed: () async {
            await SessionController().removeuserPerference();
            Navigator.pushNamedAndRemoveUntil(context, RoutesNames.splashscreen,
                (Route<dynamic> route) => false);
          },
          icon: Icon(Icons.logout_outlined),
        ),
      )),
    );
  }
}
