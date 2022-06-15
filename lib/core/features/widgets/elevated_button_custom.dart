import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class ElevatedButtonCustom extends StatelessWidget {
  Function()? onPressed;
  String text;
  ElevatedButtonCustom({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: SizedBox(height: 40,
        child: ElevatedButton(
          
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(purple),
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
