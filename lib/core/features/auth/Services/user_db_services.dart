import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/enums/enums.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';
import 'package:for_you/features/home_screen/home.dart';
import 'package:provider/provider.dart';

class UserDbServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var userDb = FirebaseAuth.instance.currentUser;

  creatUser(UserModel user, context) async {
    try {
      await _db.collection('users').doc(userDb!.uid).set(user.toJson());

      Provider.of<AuthSataProvider>(context, listen: false)
          .changeAuthState(newState: AuthState.notSet);

      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    } on FirebaseException catch (e) {
      Provider.of<AuthSataProvider>(context, listen: false)
          .changeAuthState(newState: AuthState.notSet);

      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<UserModel?> getUser(String id) async {
    print(id);
    try {
      var user = await _db.collection('users').doc(id).get();
      return UserModel.fromFirestore(user);
    } on FirebaseException catch (e) {
      print(e);
    }
    return null;
  }
}
