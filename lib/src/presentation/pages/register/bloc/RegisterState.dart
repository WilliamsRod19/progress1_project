import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;

  final Resource? response;
  final GlobalKey<FormState>? formState;


  const RegisterState({
    this.name = const BlocFormItem(error: "Ingrese un nombre válido"),
    this.lastName = const BlocFormItem(error: "Ingrese un apellido válido"),
    this.email = const BlocFormItem(error: "Ingrese un email válido"),
    this.phone = const BlocFormItem(error: "Ingrese un teléfono válido"),
    this.password = const BlocFormItem(error: "Ingrese una contraseña válida"),
    this.confirmPassword = const BlocFormItem(error: "Las contraseñas no coinciden"),
    this.response,
    this.formState,
  });

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    Resource? response,
    GlobalKey<FormState>? formState,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      response: response ?? this.response,
      formState: formState ?? this.formState,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [name, lastName, email, phone, password, confirmPassword, response, formState];

}