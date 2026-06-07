import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/injection.dart';
import 'package:progress1_project/src/BlocProviders.dart';
import 'package:progress1_project/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:progress1_project/src/presentation/pages/login/LoginPage.dart';
import 'package:progress1_project/src/presentation/pages/register/RegisterPage.dart';
import 'package:progress1_project/src/presentation/pages/roles/RolesPage.dart';
void main() async {
  await configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => Loginpage(),
          '/register': (BuildContext context) => Registerpage(),
          '/roles': (BuildContext context) => RolesPage(),
          '/client/home': (BuildContext context) => ClientHomePage(),
        },
      ),
    );
  }
}
