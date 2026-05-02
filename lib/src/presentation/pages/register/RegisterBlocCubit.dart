import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/domain/models/CreateUserResponse.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/RegisterUsesCases.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';
import 'package:rxdart/rxdart.dart';
import 'package:progress1_project/src/presentation/pages/register/RegisterBlocState.dart';
import 'package:progress1_project/src/domain/models/User.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  AuthUsesCases authUsesCases;
  RegisterBlocCubit(this.authUsesCases) : super(RegisterInitialState());

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

  void register() async{
    _responseController.add(Loading());
    User user = User(
      name: _nameController.value,
      lastname: _lastnameController.value,
      email: _emailController.value,
      phone: _phoneController.value,
      password: _passwordController.value,
    );
    Resource<CreateUserResponse> response = await authUsesCases.register.run(user);
    _responseController.add(response);
  }
}
