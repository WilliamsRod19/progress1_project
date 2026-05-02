import 'package:progress1_project/src/domain/repository/AuthRepository.dart';

class LoginAuthUseCase {

  AuthRepository repository;
  LoginAuthUseCase(this.repository);

  run(String email, String password)=> repository.login(email, password);
  
}