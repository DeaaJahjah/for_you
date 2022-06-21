import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:for_you/app.dart';
import 'package:for_you/core/config/constant/keys.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final client = StreamChatClient(streamKey);
  runApp(App(
    client: client,
  ));
}
