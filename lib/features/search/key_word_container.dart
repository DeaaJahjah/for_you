

import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class KeyWordContainer extends StatelessWidget {
  String text;
  KeyWordContainer({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,height: 50,
      decoration: BoxDecoration(color: white,
      border: Border.all(color: purple,width: 2),
        borderRadius: BorderRadius.circular(5),      
      ),
      child:Center(child: Text(text,style: TextStyle(color: purple,fontFamily: font,fontWeight: FontWeight.bold),)),
    );
  }
}