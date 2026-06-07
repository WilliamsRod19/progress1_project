import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';

class GetUserSessionUseCase {
  AuthRepository authRepository;
  GetUserSessionUseCase(this.authRepository);
  Future<AuthResponse?> run() => authRepository.getUserSession();
}