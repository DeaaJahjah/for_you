import 'package:flutter/material.dart';
import 'package:for_you/core/config/enums/enums.dart';

class AuthSataProvider extends ChangeNotifier {
  AuthState authState = AuthState.notSet;

  changeAuthState({required AuthState newState}) {
    authState = newState;
    notifyListeners();
  }
}