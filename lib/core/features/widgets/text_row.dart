

import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class TextRow extends StatelessWidget {
  final String title;
  final String data;
   TextRow({Key? key,required this.title,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
      child: Row(children: [
        
        Text(title,style: TextStyle(color: purple,fontFamily: font,fontSize: 16,fontWeight:FontWeight.bold,)),
        Expanded(child: Text(data,style: TextStyle(color: white,fontFamily: font,fontSize: 16,),overflow: TextOverflow.clip)),
      ]),
    );
  }
}