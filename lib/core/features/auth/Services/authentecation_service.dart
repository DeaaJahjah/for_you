import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/enums/enums.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:for_you/core/features/auth/screens/login_screen.dart';
import 'package:for_you/features/home_screen/home.dart';
import 'package:provider/provider.dart';

class FlutterFireAuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut(context) async {
    await _firebaseAuth.signOut();
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    Provider.of<AuthSataProvider>(context, listen: false)
        .changeAuthState(newState: AuthState.waiting);

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      Provider.of<AuthSataProvider>(context, listen: false)
          .changeAuthState(newState: AuthState.notSet);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    } on FirebaseAuthException catch (e) {
      context
          .read<AuthSataProvider>()
          .changeAuthState(newState: AuthState.notSet);
      final snakBar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snakBar);
      print(e.message);
    }
  }

  Future<UserCredential?> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    context
        .read<AuthSataProvider>()
        .changeAuthState(newState: AuthState.waiting);
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      context
          .read<AuthSataProvider>()
          .changeAuthState(newState: AuthState.notSet);

      return user;
    } on FirebaseAuthException catch (e) {
      context
          .read<AuthSataProvider>()
          .changeAuthState(newState: AuthState.notSet);
      final snakBar = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snakBar);
    }
    return null;
  }
}
