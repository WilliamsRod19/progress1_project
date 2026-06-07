import 'package:progress1_project/src/data/dataSource/local/SharedReference.dart';
import 'package:progress1_project/src/data/dataSource/remote/service/AuthService.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:progress1_project/src/domain/models/CreateUserResponse.dart';
import 'package:progress1_project/src/domain/models/User.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  Authservice authservice;
  SharedReference sharePref;
  AuthRepositoryImpl(this.authservice, this.sharePref);

  @override
  Future<Resource> login(String email, String password) {
    return authservice.login(email, password);
  }

  @override
  Future<Resource<CreateUserResponse>> register(User user) {
    return authservice.register(user);
  }

  @override
  Future<AuthResponse?> getUserSession() async {
    final data = await sharePref.read('user');
    if (data == null) return null;
    return AuthResponse.fromJson(data);
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    await sharePref.save('user', authResponse.toJson());
  }
  
  @override
  Future<void> logout() async {
    await sharePref.remove('user');
  }
  
}