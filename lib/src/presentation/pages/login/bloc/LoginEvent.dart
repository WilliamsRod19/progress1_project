import 'package:equatable/equatable.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class InitEvent extends LoginEvent {
  const InitEvent();
}

class EmailChanged extends LoginEvent {
  final BlocFormItem email;
  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final BlocFormItem password;
  const PasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}