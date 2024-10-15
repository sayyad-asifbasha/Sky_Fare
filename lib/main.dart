import 'package:flutter/material.dart';
import 'package:sky_fare/config/routes/routes.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/pages/Signup.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>SignupBloc())
        ],
        child:  const MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesNames.signupScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
