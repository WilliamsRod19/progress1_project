import 'package:progress1_project/src/domain/models/CreateUserResponse.dart';
import 'package:progress1_project/src/domain/models/User.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';


abstract class AuthRepository {
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<void> logout();
  Future<AuthResponse?> getUserSession();
  Future<Resource> login(String email, String password);
  Future<Resource<CreateUserResponse>> register(User user);
}