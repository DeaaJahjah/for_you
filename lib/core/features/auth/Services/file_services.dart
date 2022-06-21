import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/enums/enums.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:provider/provider.dart';

class FileService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadeimage(
      String name, File image, BuildContext context) async {
    try {
      await storage.ref(name).putFile(image);
      return storage.ref(name).getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.toString());
      // Provider.of<AuthSataProvider>(context, listen: false)
      //     .changeAuthState(newState: AuthState.notSet);
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return 'error';
    }
  }
}

