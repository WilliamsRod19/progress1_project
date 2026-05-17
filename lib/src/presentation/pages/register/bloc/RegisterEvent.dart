import 'package:equatable/equatable.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

// inicializar nuestro register init cuando la pantalla aparece
class registerInitEvent extends RegisterEvent {
  const registerInitEvent();
}

// evento cuando el usuario escriba el nombre
class NameChangedEvent extends RegisterEvent {
  final BlocFormItem name;
  const NameChangedEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class LastNameChangedEvent extends RegisterEvent {
  final BlocFormItem lastName;
  const LastNameChangedEvent({required this.lastName});

  @override
  List<Object?> get props => [lastName];
}

class EmailChangedEvent extends RegisterEvent {
  final BlocFormItem email;
  const EmailChangedEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class PhoneChangedEvent extends RegisterEvent {
  final BlocFormItem phone;
  const PhoneChangedEvent({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class PasswordChangedEvent extends RegisterEvent {
  final BlocFormItem password;
  const PasswordChangedEvent({required this.password});

  @override
  List<Object?> get props => [password];
}

class ConfirmPasswordChangedEvent extends RegisterEvent {
  final BlocFormItem confirmPassword;
  const ConfirmPasswordChangedEvent({required this.confirmPassword});

  @override
  List<Object?> get props => [confirmPassword];
}

class RegisterSubmittedEvent extends RegisterEvent {
  RegisterSubmittedEvent();
}

class RegisterFormResetEvent extends RegisterEvent {
  const RegisterFormResetEvent();
}