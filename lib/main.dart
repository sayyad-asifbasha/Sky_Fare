import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sky_fare/config/routes/routes.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/pages/Signup.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_fare/respository/auth/signup_repository.dart';

GetIt getIt = GetIt.instance;

void main() {
  servicesLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SignupBloc(signupRepository: getIt()))
    ],
    child: const MyApp(),
  ));
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
      initialRoute: RoutesNames.homeScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void servicesLocator() {
  getIt.registerLazySingleton<SignupRepository>(() => SignupRepository());
}
