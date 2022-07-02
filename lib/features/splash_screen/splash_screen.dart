import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/screens/login_screen.dart';
import 'package:for_you/features/home_screen/home.dart';
import 'package:for_you/core/config/extensions/firebase.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      if (context.logedInUser != null) {
        //connect user to caht sdk
        final client = StreamChatCore.of(context).client;
        await client.connectUser(
            User(id: context.userUid!), context.userToken!);

        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      }
    });
    return Scaffold(
      backgroundColor: dark,
      body: Center(
          child:
              Hero(tag: 'log', child: Image.asset('assets/images/login.png'))),
    );
  }
}
