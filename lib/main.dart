import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/presentation/pages/login/LoginPage.dart';
import 'package:progress1_project/src/presentation/pages/register/RegisterPage.dart';
import 'src/presentation/pages/login/LoginBlocCubit.dart';
import 'src/presentation/pages/register/RegisterBlocCubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBlocCubit>(
          create: (BuildContext context) => LoginBlocCubit(),
        ),
        BlocProvider<RegisterBlocCubit>(
          create: (BuildContext context) => RegisterBlocCubit(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => Loginpage(),
          '/register': (BuildContext context) => Registerpage(),
        },
      ),
    );
  }
}
