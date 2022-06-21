import 'package:flutter/material.dart';
import 'package:for_you/core/config/Routes/routes.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthSataProvider>(
      create: (_) => AuthSataProvider(),)
      ],
      child: const MaterialApp(
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
         initialRoute: '/',
    
      ),
    );
  }
}
