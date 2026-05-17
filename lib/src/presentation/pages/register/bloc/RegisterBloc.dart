import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/domain/models/CreateUserResponse.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:rxdart/rxdart.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterState.dart';
import 'package:progress1_project/src/domain/models/User.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUsesCases authUsesCases;
  RegisterBloc(this.authUsesCases) : super(RegisterState()) {
    on<registerInitEvent>(_onRegisterInitEvent);
    on<NameChangedEvent>(_onNameChangedEvent);
    on<LastNameChangedEvent>(_onLastNameChangedEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PhoneChangedEvent>(_onPhoneChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<ConfirmPasswordChangedEvent>(_onConfirmPasswordChangedEvent);
    on<RegisterSubmittedEvent>(_onRegisterSubmittedEvent);
    //on<RegisterFormResetEvent>(_onRegisterFormResetEvent);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onRegisterInitEvent(
    registerInitEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(formState: formKey));
  }

  Future<void> _onNameChangedEvent(
    NameChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty && event.name.value.length >= 2 ? null : 'Ingrese un nombre válido',
        ),
        formState: formKey,
      ),
    );
  }

  Future<void> _onLastNameChangedEvent(
    LastNameChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        lastName: BlocFormItem(
          value: event.lastName.value,
          error: event.lastName.value.isNotEmpty && event.lastName.value.length >= 2 ? null : 'Ingrese un apellido válido',
        ),
        formState: formKey,
      ),
    );
  }

  Future<void> _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isNotEmpty && event.email.value.length >= 5 && RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email.value)
            ? null : 'Ingrese un email válido',
        ),
        formState: formKey,
      ),
    );
  }

  Future<void> _onPhoneChangedEvent(
    PhoneChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty && event.phone.value.length >= 8 ? null : 'Ingrese un teléfono válido, minimo 8 caracteres',
        ),
        formState: formKey,
      ),
    );
  }

  Future<void> _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isNotEmpty && event.password.value.length >= 7 ? null : 'Ingrese una contraseña válida',
        ),
        formState: formKey,
      ),
    );
  }

  Future<void> _onConfirmPasswordChangedEvent(
    ConfirmPasswordChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        confirmPassword: BlocFormItem(
          value: event.confirmPassword.value,
          error: event.confirmPassword.value == state.password.value ? null : 'Las contraseñas no coinciden',
        ),
        formState: formKey,
      ),
    );
  }

  Future<void> _onRegisterSubmittedEvent(
    RegisterSubmittedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formState: formKey));
    User user = User(
      name: state.name.value,
      lastname: state.lastName.value,
      email: state.email.value,
      phone: state.phone.value,
      password: state.password.value,
    );
    Resource<CreateUserResponse> response = await authUsesCases.register.run(
      user,
    );
    emit(state.copyWith(response: response, formState: formKey));
  }

  // controllers
  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  // streams
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get lastnameStream => _lastnameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmPasswordStream => _confirmPasswordController.stream;
  Stream<Resource> get responseStream => _responseController;
  Stream<bool> get ValidateForm => Rx.combineLatest6(
    nameStream,
    lastnameStream,
    emailStream,
    phoneStream,
    passwordStream,
    confirmPasswordStream,
    (a, b, c, d, e, f) => true,
  );

  // validations
  void changeName(String name) {
    if (name.length < 2) {
      _nameController.sink.addError('At least 2 characters');
    } else {
      _nameController.add(name);
    }
  }

  void changeLastname(String lastname) {
    if (lastname.length < 2) {
      _lastnameController.sink.addError('At least 2 characters');
    } else {
      _lastnameController.add(lastname);
    }
  }

  void changeEmail(String email) {
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email) && email.length < 5) {
      _emailController.sink.addError('The email is not available');
    } else {
      _emailController.add(email);
    }
  }

  void changePhone(String phone) {
    if (phone.length < 7) {
      _phoneController.sink.addError('At least 8 digits');
    } else {
      _phoneController.add(phone);
    }
  }

  void changePassword(String password) {
    if (password.length < 7) {
      _passwordController.sink.addError('At least 7 characters');
    } else {
      _passwordController.add(password);
    }
  }

  void changeConfirmPassword(String confirmPassword) {
    if (confirmPassword.length < 7) {
      _confirmPasswordController.sink.addError('At least 7 characters');
    } else if (confirmPassword != _passwordController.value) {
      _confirmPasswordController.sink.addError('Passwords do not match');
    } else {
      _confirmPasswordController.add(confirmPassword);
    }
  }

  void register() async {
    _responseController.add(Loading());
    User user = User(
      name: _nameController.value,
      lastname: _lastnameController.value,
      email: _emailController.value,
      phone: _phoneController.value,
      password: _passwordController.value,
    );
    Resource<CreateUserResponse> response = await authUsesCases.register.run(
      user,
    );
    _responseController.add(response);
  }
}
