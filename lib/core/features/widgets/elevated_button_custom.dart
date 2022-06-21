import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class ElevatedButtonCustom extends StatelessWidget {
  Function()? onPressed;
  String text;
  Color color;
  ElevatedButtonCustom({Key? key, required this.onPressed, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: SizedBox(height: 40,
        child: ElevatedButton(
          
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: 
          BorderRadius.circular(20)))
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  color: white, fontFamily: font, fontWeight: FontWeight.bold,fontSize: 22),
            )),
      ),
    );
  }
}
