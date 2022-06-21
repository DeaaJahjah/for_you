import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class DrawerItem extends StatelessWidget {
  IconData icon;
  String text;
  Function()? onTap;
  DrawerItem(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:  const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
               icon,
                color: purple,
                size: 20,
              ),
            ),
            
            Text(
             text,
              style: TextStyle(color: purple, fontFamily: font,
              fontSize: 16,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
