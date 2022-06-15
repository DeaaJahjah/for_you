import 'package:flutter/material.dart';
import 'package:for_you/core/config/Routes/routes.dart';
import 'package:for_you/core/features/auth/screens/login_screen.dart';
import 'package:for_you/features/splash_screen/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
       initialRoute: '/',

    );
  }
}
