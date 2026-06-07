import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:progress1_project/src/presentation/pages/client/home/bloc/ClientHomeState.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  AuthUsesCases authUsesCases;

  ClientHomeBloc(this.authUsesCases) : super(const ClientHomeState()) {
    on<ClientHomeInit>(_onInit);
    on<Logout>(_onLogout);
  }

  Future<void> _onInit(ClientHomeInit event, Emitter<ClientHomeState> emit) async {
    AuthResponse? session = await authUsesCases.getUserSession.run();
    emit(state.copyWith(authResponse: session));
  }

  Future<void> _onLogout(Logout event, Emitter<ClientHomeState> emit) async {
    await authUsesCases.logoutUseCase.run();
    emit(state.copyWith(authResponse: null));
  }
}