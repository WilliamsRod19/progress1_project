import 'package:progress1_project/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/RegisterUsesCases.dart';

class AuthUsesCases {
  
  LoginAuthUseCase login;
  Registerusescases register;
  
  AuthUsesCases({
    required this.login,
    required this.register
  });
}