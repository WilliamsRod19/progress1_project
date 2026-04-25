import 'package:progress1_project/src/data/dataSource/remote/service/AuthService.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  Authservice authservice = Authservice();

  @override
  Future<Resource> login(String email, String password) {
    return authservice.login(email, password);
  } 
  
}