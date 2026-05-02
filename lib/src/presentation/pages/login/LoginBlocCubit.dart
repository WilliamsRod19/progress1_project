import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart';
import 'package:progress1_project/src/domain/useCases/auth/LoginAuthUseCase.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'LoginBloc.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';

class LoginBlocCubit extends Cubit<Loginbloc>{
  AuthUsesCases authUsesCases;
  LoginBlocCubit(this.authUsesCases):super(LoginInitial());
  
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  void changeEmail(String email){
    if(email.length<6){
      _emailController.sink.addError('The email must be at least 6 characters');
    }else{
      _emailController.sink.add(email);
    }

  }

  void changePassword(String password){
    if(password.length < 6){
      _passwordController.sink.addError('The password must be at least 6 characters');
    }else{
      _passwordController.sink.add(password);
    }

  }

  Stream<bool> get validateForm => Rx.combineLatest2(
      emailStream, passwordStream,(a,b)=>true);

  void getInformation()async{
    _responseController.add(Loading());
    Resource authResponse=  await authUsesCases.login.run(_emailController.value, _passwordController.value);
    _responseController.add(authResponse);
  }


}