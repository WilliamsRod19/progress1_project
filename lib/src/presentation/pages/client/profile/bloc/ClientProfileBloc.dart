import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';
import 'package:progress1_project/src/presentation/pages/client/profile/bloc/ClientProfileEvent.dart';
import 'package:progress1_project/src/presentation/pages/client/profile/bloc/ClientProfileState.dart';

class ClientProfileBloc extends Bloc<ClientprofileEvent, ClientProfileState>{
  AuthUsesCases authUsesCases;
  final formKey = GlobalKey<FormState>();

  ClientProfileBloc(this.authUsesCases):super(const ClientProfileState()){
    on<ClientProfileInit>(_onInit);
  }

  Future<void> _onInit(ClientProfileInit event, Emitter<ClientProfileState> emit) async{
    AuthResponse? session = await authUsesCases.getUserSession.run();
    
    emit(state.copyWidth(
      authResponse: session,
      name: BlocFormItem(value: session?.createUserResponse.name ?? ""),
      lastname: BlocFormItem(value: session?.createUserResponse.lastName ?? ""),
      phone: BlocFormItem(value: session?.createUserResponse.phone ?? ""),
      formKey: formKey
    ));
  }
}