import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress1_project/src/presentation/pages/login/LoginBlocCubit.dart';
import 'package:progress1_project/src/presentation/widgets/DefaultButton.dart';
import 'package:progress1_project/src/presentation/widgets/DefaultTextField.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  LoginBlocCubit? _loginBlocCubit;

  @override
  Widget build(BuildContext context) {

    _loginBlocCubit = BlocProvider.of<LoginBlocCubit>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
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
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.emailStream,
                      builder: (context, asyncSnapshot) {
                        return Defaulttextfield(
                          label: 'Email',
                          icon: Icons.email,
                          onChanged: (value){
                            _loginBlocCubit?.changeEmail(value);
                          },
                          obscureText: false,
                          isNumber: false,
                        );
                      }
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.passwordStream,
                      builder: (context, asyncSnapshot) {
                        return Defaulttextfield(
                          label: 'Password', 
                          icon: Icons.lock, 
                          onChanged: (value){
                            _loginBlocCubit?.changePassword(value);
                          }, 
                          obscureText: true, 
                          isNumber: false,
                        );
                      }
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                    child: StreamBuilder(
                      stream: _loginBlocCubit?.validateForm,
                      builder: (context, asyncSnapshot) {
                        return Defaultbutton(
                          text: 'LOG IN', 
                          onPressed: () {
                            if(asyncSnapshot.hasData){
                              _loginBlocCubit?.getInformation();
                            } else {
                              Fluttertoast.showToast(
                                msg: 'the form is not available',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16
                              );
                            }
                          }, 
                          backgroundColor: Colors.green, 
                          foregroundColor: Colors.black
                        );
                      }
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
            )
          ],
        ),
      ),
    );
  }
}

// Minute 56:55