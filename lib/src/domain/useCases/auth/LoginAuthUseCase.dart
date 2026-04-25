import 'package:progress1_project/src/data/dataSource/remote/repository/AuthRepositoryImpl.dart';

class LoginAuthUseCase {

  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl();

  run(String email, String password)=> authRepositoryImpl.login(email, password);
  
}