import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/screens/login_screen.dart';
import 'package:for_you/features/home_screen/home.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName='/h';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state =FirebaseAuth.instance;
    var user = state.currentUser;
    Timer(Duration(seconds: 2),(){
      (user!= null)?
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName):
       Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      });
    return Scaffold(
      backgroundColor: dark,
      body: Center(child: Hero(tag: 'log',
        child: Image.asset('assets/images/login.png'))),

    );
  }
}
