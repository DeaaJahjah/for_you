
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/enums/enums.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';
import 'package:for_you/features/home_screen/home.dart';
import 'package:provider/provider.dart';

class UserDbServices{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var userDb = FirebaseAuth.instance.currentUser;
  
creatUser(UserModel user, context) async {
    try {
      _db.collection('users').doc(user.id).set(user.toJson());

      

      // Provider.of<AuthSataProvider>(context, listen: false)
      //     .changeAuthState(newState: AuthState.notSet);

    

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));

      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } on FirebaseException catch (e) {
      // Provider.of<AuthSataProvider>(context, listen: false)
      //     .changeAuthState(newState: AuthState.notSet);

      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

}}