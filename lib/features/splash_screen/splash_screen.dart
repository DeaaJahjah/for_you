import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName='/j';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);});
    return Scaffold(
      backgroundColor: dark,
      body: Center(child: Hero(tag: 'log',
        child: Image.asset('assets/images/login.png'))),

    );
  }
}
