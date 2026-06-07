import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';

class LoginState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const LoginState({
    this.email = const BlocFormItem(error: "Ingresa el Email"),
    this.password = const BlocFormItem(error: "Ingresa la Contraseña"),
    this.response,
    this.formKey,
  });

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
    Resource? response
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      response: response,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, password, response];
}