import 'package:progress1_project/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository authRepository;
  LogoutUseCase(this.authRepository);

  Future<void> run() => authRepository.logout();
}