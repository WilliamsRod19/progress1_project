import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'LoginState.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUsesCases authUsesCases;
  LoginBloc(this.authUsesCases) : super(LoginState()) {
    on<InitEvent>(_onInitEvent);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onInitEvent(InitEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onEmailChanged(
    EmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value, 
          error: event.email.value.isNotEmpty ? null : 'Ingrese un email válido'
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isNotEmpty && event.password.value.length >= 6 ? null : 'Ingrese una contraseña válida'
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource authResponse = await authUsesCases.login.run(
      state.email.value,
      state.password.value,
    );
    emit(state.copyWith(response: authResponse, formKey: formKey));
  }

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  void changeEmail(String email) {
    if (email.length < 6) {
      _emailController.sink.addError('The email must be at least 6 characters');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.length < 6) {
      _passwordController.sink.addError(
        'The password must be at least 6 characters',
      );
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void getInformation() async {
    _responseController.add(Loading());
    Resource authResponse = await authUsesCases.login.run(
      _emailController.value,
      _passwordController.value,
    );
    _responseController.add(authResponse);
  }
}
