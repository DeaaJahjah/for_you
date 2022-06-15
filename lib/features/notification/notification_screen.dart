import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class NotificationScreen extends StatefulWidget {
    static const String routeName = '/notification_screen';
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: dark,
        appBar: AppBar(
            backgroundColor: purple,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'Notifications',
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