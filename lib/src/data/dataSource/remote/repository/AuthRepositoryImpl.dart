import 'package:progress1_project/src/data/dataSource/remote/service/AuthService.dart';
import 'package:progress1_project/src/domain/models/CreateUserResponse.dart';
import 'package:progress1_project/src/domain/models/User.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  Authservice authservice;
  AuthRepositoryImpl(this.authservice);

  @override
  Future<Resource> login(String email, String password) {
    return authservice.login(email, password);
  }

  @override
  Future<Resource<CreateUserResponse>> register(User user) {
    return authservice.register(user);
  } 
  
}