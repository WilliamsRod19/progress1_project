import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/presentation/pages/roles/bloc/RolesEvent.dart';
import 'package:progress1_project/src/presentation/pages/roles/bloc/RolesState.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {

  AuthUsesCases authUsesCases;

  RolesBloc(this.authUsesCases) : super(RolesState()) {
    on<GetRolesList>(_onGetRolesList);
  }

  Future<void> _onGetRolesList(GetRolesList event, Emitter<RolesState> emit) async {
    AuthResponse? authResponse = await authUsesCases.getUserSession.run();

    emit(state.copyWith(roles: authResponse?.createUserResponse.roles));
  }
  
}