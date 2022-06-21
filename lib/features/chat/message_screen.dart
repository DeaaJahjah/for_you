

import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class MessageScreen extends StatefulWidget {
    static const String routeName = '/notification_screen';
  MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
       backgroundColor: dark,
        appBar: AppBar(
            backgroundColor: purple,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'Chats',
              style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            )),
            body: Container(),
    );
  }
}