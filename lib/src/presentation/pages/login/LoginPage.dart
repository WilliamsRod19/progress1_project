import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginEvent.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginState.dart';
import 'package:progress1_project/src/presentation/pages/widgets/DefaultButton.dart';
import 'package:progress1_project/src/presentation/pages/widgets/DefaultTextField.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  LoginBloc? _loginBloc;

  @override
  Widget build(BuildContext context) {

    _loginBloc = BlocProvider.of<LoginBloc>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Form(
              key: state.formKey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/img/login_background.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,
                  ),
              
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 130,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                          child: Defaulttextfield(
                            label: 'Email',
                            icon: Icons.email,
                            onChanged: (value){
                              _loginBloc?.add(EmailChanged(email: BlocFormItem(value: value)));
                            },
                            validator: (value){
                              return state.email.error;
                            },
                            obscureText: false,
                            isNumber: false,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                          child: Defaulttextfield(
                            label: 'Password', 
                            icon: Icons.lock, 
                            onChanged: (value){
                              _loginBloc?.add(PasswordChanged(password: BlocFormItem(value: value)));
                            }, 
                            validator: (value){
                              return state.password.error;
                            },
                            obscureText: true, 
                            isNumber: false,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                          child: Defaultbutton(
                            text: 'LOG IN', 
                            onPressed: () {
                              if (state.formKey?.currentState?.validate() ?? false) {
                                _loginBloc?.add(LoginSubmitted());
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'Please fix the errors in the form',
                                  toastLength: Toast.LENGTH_LONG
                                );
                              }
                            }, 
                            backgroundColor: Colors.green, 
                            foregroundColor: Colors.black
                          ),
                        ),
                        Text(
                          'You dont have an account? Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 50,
                          margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                          child: Defaultbutton(text: 'REGISTER', 
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          }, 
                          backgroundColor: Colors.black, 
                          foregroundColor: Colors.white)
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {

                      final responsState = state.response;

                      if (responsState is Loading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else if (responsState is Error) {
                        Fluttertoast.showToast(
                          msg: responsState.message,
                          toastLength: Toast.LENGTH_LONG
                        );
                      }
                      else if (responsState is Success) {
                        Fluttertoast.showToast(
                          msg: 'Login exitoso',
                          toastLength: Toast.LENGTH_LONG
                        );
                      }
                      return Container();
                    }
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Minute 56:55