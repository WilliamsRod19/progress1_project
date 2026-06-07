import 'package:progress1_project/src/data/repository/AuthRepositoryImpl.dart';
import 'package:progress1_project/src/data/dataSource/remote/service/AuthService.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:progress1_project/src/domain/useCases/auth/SaveUserSessionCase.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:progress1_project/src/data/dataSource/local/SharedReference.dart';

@module
abstract class Appmodules {
  @injectable
  Authservice get authService => Authservice();
  @injectable
  SharedReference get sharedPref => SharedReference(); //
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref); //
  @injectable
  RegisterBloc get registerBloc => RegisterBloc(authUsesCases);
  @injectable
  AuthUsesCases get authUsesCases => AuthUsesCases(
    login: LoginAuthUseCase(authRepository), 
    register: Registerusescases(authRepository),
    saveUserSession: SaveUserSessionCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logoutUseCase: LogoutUseCase(authRepository)
  );
}