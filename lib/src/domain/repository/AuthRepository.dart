import 'package:progress1_project/src/domain/models/CreateUserResponse.dart';
import 'package:progress1_project/src/domain/models/User.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource> login(String email, String password);
  Future<Resource<CreateUserResponse>> register(User user);
}