import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/custom_navigation_bar.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = '/add_post';
  AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      bottomNavigationBar: CustomNavigationBar(index: 0),
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0.0,
        title: Text('Add post', style: appBarTextStyle),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 10, 60, 20),
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: purple),
                  color: dark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.add_photo_alternate_outlined,
                  color: white,
                  size: 50,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Type', style: style1),
              ),
              Row(
                children: [
                  Text('Available', style: style1),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterSwitch(
                        value: isSwitched,
                        height: 30,
                        width: 50,
                        toggleSize: 20,
                        borderRadius: 50,
                        activeColor: dark,
                        inactiveColor: white,
                        toggleColor: purple,
                        switchBorder: Border.all(
                          color: purple,
                        ),
                        onToggle: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        }),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Radio(
                  value: true,
                  groupValue: true,
                  onChanged: (va) {},
                  activeColor: purple,
                  autofocus: false,
                  fillColor: MaterialStateProperty.all(purple)),
              Text(
                'New',
                style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: false,
                  groupValue: true,
                  onChanged: (va) {},
                  activeColor: purple,
                  autofocus: false,
                  fillColor: MaterialStateProperty.all(purple)),
              Text(
                'Used',
                style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
