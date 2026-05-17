import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/injection.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterEvent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(locator<AuthUsesCases>())..add(InitEvent())
  ),
  BlocProvider<RegisterBloc>(
    create: (context) => RegisterBloc(locator<AuthUsesCases>())..add(registerInitEvent()),
  ),
];