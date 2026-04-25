import 'package:progress1_project/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<Resource> login(String email, String password);
  //Future<Resource> register();
}