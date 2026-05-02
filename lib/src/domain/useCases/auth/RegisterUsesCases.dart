import 'package:progress1_project/src/domain/models/User.dart';
import 'package:progress1_project/src/domain/repository/AuthRepository.dart';

class Registerusescases {
  AuthRepository repository;
  Registerusescases(this.repository);

  run(User user)=> repository.register(user);
}