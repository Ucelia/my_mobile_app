import 'package:flutter/material.dart';
import 'package:my_mobile_app/pages/home.dart';
import 'package:my_mobile_app/pages/signIn.dart';
import 'package:my_mobile_app/pages/signUp.dart';
import 'package:my_mobile_app/pages/calculator.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
       '/': (context) => Home(),
       '/signIn': (context) => SignInScreen(),
       '/signUp': (context) => SignUpScreen(),
       '/calculator': (context) => Calculator(),
    },
  ));

}


