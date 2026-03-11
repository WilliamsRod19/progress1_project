import 'package:flutter/material.dart';
import 'package:progress1_project/src/presentation/widgets/DefaultButton.dart';
import 'package:progress1_project/src/presentation/widgets/DefaultTextField.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
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
                      child: Defaulttextfield(
                        label: 'name', 
                        icon: Icons.person, 
                        onChanged: (value){}, 
                        obscureText: false, 
                        isNumber: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: Defaulttextfield(
                        label: 'Last name', 
                        icon: Icons.person, 
                        onChanged: (value){}, 
                        obscureText: false, 
                        isNumber: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: Defaulttextfield(
                        label: 'email', 
                        icon: Icons.email, 
                        onChanged: (value){}, 
                        obscureText: false, 
                        isNumber: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: Defaulttextfield(
                        label: 'phone', 
                        icon: Icons.phone, 
                        onChanged: (value){}, 
                        obscureText: false, 
                        isNumber: true
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: Defaulttextfield(
                        label: 'password', 
                        icon: Icons.lock, 
                        onChanged: (value){}, 
                        obscureText: true, 
                        isNumber: false
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
                      child: Defaulttextfield(
                        label: 'Confirm password', 
                        icon: Icons.lock_outline, 
                        onChanged: (value){}, 
                        obscureText: true, 
                        isNumber: false
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
                      child: Defaultbutton(
                        text: 'REGISTER', 
                        onPressed: () {
                          Navigator.pop(context);
                        }, 
                        backgroundColor: Colors.black, 
                        foregroundColor: Colors.white
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