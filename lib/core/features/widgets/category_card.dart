

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class CategoryCard extends StatelessWidget {
  String? name;
  String url ;
  Function() onTap;
  bool? isSelected;
  CategoryCard({Key? key,this.name,required this.url,required this.onTap,this.isSelected}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    
    return  InkWell(
          onTap: onTap,
          child:
     Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Image.asset(url,fit: BoxFit.fill,),
              width: 70,height: 70,
              decoration: BoxDecoration(
               border: Border.all(color:(isSelected!)? purple :  dark ,width: 3),
            borderRadius: BorderRadius.circular(8),
              ),
            ),   
        
           Text(name!,style: TextStyle(color: white,fontFamily: font,fontSize: 14,),),
        ],
      ),
    );
  }
}