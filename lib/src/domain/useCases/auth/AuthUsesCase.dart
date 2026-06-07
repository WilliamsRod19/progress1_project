import 'package:progress1_project/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:progress1_project/src/domain/useCases/auth/SaveUserSessionCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/LogoutUseCase.dart';

class AuthUsesCases {
  
  LoginAuthUseCase login;
  Registerusescases register;
  SaveUserSessionCase saveUserSession;
  GetUserSessionUseCase getUserSession;
  LogoutUseCase logoutUseCase;
  
  AuthUsesCases({
    required this.login,
    required this.register,
    required this.saveUserSession,
    required this.getUserSession,
    required this.logoutUseCase,
  });
}