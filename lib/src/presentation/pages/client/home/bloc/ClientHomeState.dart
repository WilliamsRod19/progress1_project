import 'package:equatable/equatable.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';

class ClientHomeState extends Equatable {
  final AuthResponse? authResponse;

  const ClientHomeState({this.authResponse});

  // crear copia de los nuevos valores cuando cambie este estado
  ClientHomeState copyWith({AuthResponse? authResponse}) {
    return ClientHomeState(
      authResponse: authResponse ?? this.authResponse,
    );
  }

  @override
  List<Object?> get props => [authResponse];
}