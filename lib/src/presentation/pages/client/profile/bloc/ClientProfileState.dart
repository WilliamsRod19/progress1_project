import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';

class ClientProfileState extends Equatable {
  final AuthResponse? authResponse;
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final GlobalKey<FormState>? formKey;
  const ClientProfileState({
    this.authResponse,
    this.name = const BlocFormItem(),
    this.lastname = const BlocFormItem(),
    this.phone = const BlocFormItem(),
    this.formKey
  });

  ClientProfileState copyWidth({
    AuthResponse? authResponse,
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    GlobalKey<FormState>? formKey,
  }){
    return ClientProfileState(
      authResponse: authResponse ?? this.authResponse, 
      name: name ?? this.name, 
      lastname: lastname ?? this.lastname, 
      phone: phone ?? this.phone, 
      formKey: formKey
    );
  }

  @override
  List<Object?> get props => [authResponse, name, lastname, phone];
}