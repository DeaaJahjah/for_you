import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class ItemCustom extends StatelessWidget {
  String? urlImage;
  String? address;
  String? type;
  String? price;
  Function()? onPressed;
  ItemCustom(
      {Key? key,
      this.urlImage,
      this.address,
      this.type,
      this.price,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Container(
          color: dark,
          width: 300,
          height: 120,
        ),
        Positioned(
          top: 20,
          child: Container(
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                color: purple,
                border: Border.all(color: white.withOpacity(0.5), width: 1),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Container(
            width: 100,
            height: 100,
            child: Image.asset(urlImage!, fit: BoxFit.fill),
          ),
        ),
        Positioned(
          left: 125,
          top: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address!,
                  style:
                      TextStyle(color: white, fontFamily: font, fontSize: 18)),
              Text(type!,
                  style:
                      TextStyle(color: white, fontFamily: font, fontSize: 18)),
              Text(price!,
                  style:
                      TextStyle(color: white, fontFamily: font, fontSize: 18))
            ],
          ),
        ),
        Positioned(
            top: 40,
            left: 255,
            child: IconButton(
                icon: Icon(Icons.delete, color: white, size: 25),
                onPressed: onPressed))
      ]),
    );
  }
}
