import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/config/enums/enums.dart';
import 'package:for_you/core/config/extensions/firebase.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:for_you/core/features/auth/Services/authentecation_service.dart';
import 'package:for_you/core/features/auth/screens/sign_up_screen.dart';
import 'package:for_you/core/features/widgets/elevated_button_custom.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:for_you/features/home_screen/home.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/log_in';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/images/login.png',
              scale: 1,
            ),
            TextFieldCustom(
              text: 'Email',
              controller: email,
              icon: Icons.email,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldCustom(
              text: 'Password',
              controller: password,
              icon: Icons.lock,
            ),
            const SizedBox(height: 30),
            Consumer<AuthSataProvider>(
                builder: (context, state, child) => (state.authState ==
                        AuthState.notSet)
                    ? ElevatedButtonCustom(
                        color: purple,
                        onPressed: () async {
                          if (email.text.isNotEmpty &&
                              password.text.isNotEmpty) {
                            var creds = await FlutterFireAuthServices().signIn(
                                email: email.text,
                                password: password.text,
                                context: context);
                            if (creds != null) {
                              final client = StreamChatCore.of(context).client;
                              String? token = context.userToken;
                              await client.connectUser(
                                User(id: creds.user!.uid),
                                token!,
                              );
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  HomeScreen.routeName, (route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('User is empty')),
                              );
                            }
                          } else {
                            const snakBar = SnackBar(
                                content:
                                    Text('Please enter email and password'));
                            ScaffoldMessenger.of(context).showSnackBar(snakBar);
                          }
                        },
                        text: 'Login')
                    : const Center(
                        child: CircularProgressIndicator(
                        color: purple,
                      ))),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Havent an account?',
                  style:
                      TextStyle(color: white, fontSize: 16, fontFamily: font),
                ),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                  child: const Text('Sign up',
                      style: TextStyle(
                          color: purple,
                          fontSize: 16,
                          fontFamily: font,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
