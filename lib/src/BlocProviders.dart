import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/injection.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/presentation/pages/login/LoginBlocCubit.dart';
import 'package:progress1_project/src/presentation/pages/register/RegisterBlocCubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBlocCubit>(
    create: (context) => LoginBlocCubit(locator<AuthUsesCases>()),
  ),
  BlocProvider<RegisterBlocCubit>(
    create: (context) => RegisterBlocCubit(locator<AuthUsesCases>()),
  ),
];