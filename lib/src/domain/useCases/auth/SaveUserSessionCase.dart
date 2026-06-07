import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';

class SaveUserSessionCase {
  AuthRepository authRepository;
  SaveUserSessionCase(this.authRepository);
  run(AuthResponse authResponse) => authRepository.saveUserSession(authResponse);
}