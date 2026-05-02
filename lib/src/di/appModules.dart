import 'package:progress1_project/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';
import 'package:progress1_project/src/data/dataSource/remote/service/AuthService.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/RegisterUsesCases.dart';

@module
abstract class Appmodules {
  @injectable
  Authservice get authService => Authservice();
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);
  @injectable
  AuthUsesCases get authUsesCases => AuthUsesCases(
    login: LoginAuthUseCase(authRepository), 
    register: Registerusescases(authRepository)
  );
}