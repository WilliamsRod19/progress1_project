import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/presentation/pages/login/LoginBlocCubit.dart';
import 'package:progress1_project/src/presentation/pages/register/RegisterBlocCubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBlocCubit>(
    create: (context) => LoginBlocCubit(),
  ),
  BlocProvider<RegisterBlocCubit>(
    create: (context) => RegisterBlocCubit(),
  ),
];