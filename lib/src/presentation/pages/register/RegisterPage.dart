import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress1_project/src/presentation/pages/register/RegisterBlocCubit.dart';
import 'package:progress1_project/src/presentation/widgets/DefaultButton.dart';
import 'package:progress1_project/src/presentation/widgets/DefaultTextField.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  RegisterBlocCubit? _registerBlocCubit;
  @override
  Widget build(BuildContext context) {
    _registerBlocCubit = BlocProvider.of<RegisterBlocCubit>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
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
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 130,
                    ),
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.nameStream,
                        builder: (context, asyncSnapshot) {
                          return Defaulttextfield(
                            label: 'name', 
                            icon: Icons.person, 
                            onChanged: (value){
                              _registerBlocCubit?.changeName(value);
                            }, 
                            obscureText: false, 
                            isNumber: false
                          );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.lastnameStream,
                        builder: (context, asyncSnapshot) {
                          return Defaulttextfield(
                            label: 'Last name', 
                            icon: Icons.person, 
                            onChanged: (value){
                              _registerBlocCubit?.changeLastname(value);
                            }, 
                            obscureText: false, 
                            isNumber: false
                          );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.emailStream,
                        builder: (context, asyncSnapshot) {
                          return Defaulttextfield(
                            label: 'email', 
                            icon: Icons.email, 
                            onChanged: (value){
                              _registerBlocCubit?.changeEmail(value);
                            }, 
                            obscureText: false, 
                            isNumber: false
                          );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.phoneStream,
                        builder: (context, asyncSnapshot) {
                          return Defaulttextfield(
                            label: 'phone', 
                            icon: Icons.phone, 
                            onChanged: (value){
                              _registerBlocCubit?.changePhone(value);
                            }, 
                            obscureText: false, 
                            isNumber: true
                          );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.passwordStream,
                        builder: (context, asyncSnapshot) {
                          return Defaulttextfield(
                            label: 'password', 
                            icon: Icons.lock, 
                            onChanged: (value){
                              _registerBlocCubit?.changePassword(value);
                            }, 
                            obscureText: true, 
                            isNumber: false
                          );
                        }
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.confirmPasswordStream,
                        builder: (context, asyncSnapshot) {
                          return Defaulttextfield(
                            label: 'Confirm password', 
                            icon: Icons.lock_outline, 
                            onChanged: (value){
                              _registerBlocCubit?.changeConfirmPassword(value);
                            }, 
                            obscureText: true, 
                            isNumber: false
                          );
                        }
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: StreamBuilder(
                        stream: _registerBlocCubit?.ValidateForm,
                        builder: (context, asyncSnapshot) {
                          return Defaultbutton(
                            text: 'REGISTER', 
                            onPressed: () {
                              if (asyncSnapshot.hasData) {
                                _registerBlocCubit?.getInformation();
                              } else {
                                Fluttertoast.showToast(msg: 'Something is happening');
                              }
                            }, 
                            backgroundColor: Colors.black, 
                            foregroundColor: Colors.white
                          );
                        }
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
                icon: Icon(Icons.arrow_back, size: 40, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}