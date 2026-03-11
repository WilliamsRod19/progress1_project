import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'LoginBloc.dart';

class LoginBlocCubit extends Cubit<Loginbloc> {
  LoginBlocCubit() : super(LoginInitial());

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void changeEmail(String email) {
    if (email.isEmpty) {
      _emailController.sink.addError('Email cannot be empty');
    } else if (email.length < 5) {
      _emailController.sink.addError('Email must be at least 5 characters long');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isEmpty) {
      _passwordController.sink.addError('Password cannot be empty');
    } else if (password.length < 6) {
      _passwordController.sink.addError('Password must be at least 6 characters long');
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm => Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void getInformation(){
    print('Email ${_emailController.value}');
    print('Password ${_passwordController.value}');
  }
}