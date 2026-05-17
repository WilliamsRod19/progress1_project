import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress1_project/src/domain/utils/Resource.dart';
import 'package:progress1_project/src/presentation/Utils/BlocFormItem.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterBloc.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterEvent.dart';
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterState.dart';
import 'package:progress1_project/src/presentation/pages/widgets/DefaultButton.dart';
import 'package:progress1_project/src/presentation/pages/widgets/DefaultTextField.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  RegisterBloc? _registerBloc;
  @override
  Widget build(BuildContext context) {
    _registerBloc = BlocProvider.of<RegisterBloc>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (contexto, state) {
            return Form(
              key: state.formState,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/img/register_background.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.height * 0.85,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Colors.white, size: 130),
                          Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              bottom: 10,
                              top: 10,
                            ),
                            child: Defaulttextfield(
                              label: 'name',
                              validator: (value) => state.name.error,
                              icon: Icons.person,
                              onChanged: (value) {
                                _registerBloc?.add(NameChangedEvent(name: BlocFormItem(value: value)));
                              },
                              obscureText: false,
                              isNumber: false,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              bottom: 10,
                              top: 10,
                            ),
                            child: Defaulttextfield(
                              label: 'Last name',
                              icon: Icons.person,
                              validator: (value) => state.lastName.error,
                              onChanged: (value) {
                                _registerBloc?.add(LastNameChangedEvent(lastName: BlocFormItem(value: value)));
                              },
                              obscureText: false,
                              isNumber: false,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              bottom: 10,
                              top: 10,
                            ),
                            child: Defaulttextfield(
                              label: 'email',
                              validator: (value) => state.email.error,
                              icon: Icons.email,
                              onChanged: (value) {
                                _registerBloc?.add(EmailChangedEvent(email: BlocFormItem(value: value)));
                              },
                              obscureText: false,
                              isNumber: false,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              bottom: 10,
                              top: 10,
                            ),
                            child: Defaulttextfield(
                              label: 'phone',
                              validator: (value) => state.phone.error,
                              icon: Icons.phone,
                              onChanged: (value) {
                                _registerBloc?.add(PhoneChangedEvent(phone: BlocFormItem(value: value)));
                              },
                              obscureText: false,
                              isNumber: true,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              bottom: 10,
                              top: 10,
                            ),
                            child: Defaulttextfield(
                              label: 'password',
                              validator: (value) => state.password.error,
                              icon: Icons.lock,
                              onChanged: (value) {
                                _registerBloc?.add(PasswordChangedEvent(password: BlocFormItem(value: value)));
                              },
                              obscureText: true,
                              isNumber: false,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              bottom: 10,
                              top: 10,
                            ),
                            child: Defaulttextfield(
                              label: 'Confirm password',
                              validator: (value) => state.confirmPassword.error,
                              icon: Icons.lock_outline,
                              onChanged: (value) {
                                _registerBloc?.add(ConfirmPasswordChangedEvent(confirmPassword: BlocFormItem(value: value)));
                              },
                              obscureText: true,
                              isNumber: false,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                              left: 25,
                              right: 25,
                              top: 15,
                            ),
                            child: Defaultbutton(
                              text: 'REGISTER',
                              onPressed: () {
                                if (state.formState!.currentState!.validate()) {
                                  _registerBloc?.add(RegisterSubmittedEvent());
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'Please fix the errors in the form',
                                    toastLength: Toast.LENGTH_LONG,
                                  );
                                }
                              },
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 70, left: 50),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      final responseState = state.response;

                      if (responseState is Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (responseState is Error) {
                        Fluttertoast.showToast(
                          msg: responseState.message,
                          toastLength: Toast.LENGTH_LONG,
                        );
                      } else if (responseState is Success) {
                        //_registerBloc?.add(RegisterResetEvent());
                        Fluttertoast.showToast(
                          msg: 'Registro exitoso',
                          toastLength: Toast.LENGTH_LONG,
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
