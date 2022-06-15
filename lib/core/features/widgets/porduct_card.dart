import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class ProductCard extends StatelessWidget {
  bool isFavorite;
  String imageProduct;
  bool isNew;
  String price;
  String address;
  ProductCard(
      {Key? key,
      required this.imageProduct,
      required this.isFavorite,
      required this.isNew,
      required this.address,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 180,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: dark),
        ),
        Positioned(
          left: 13,
          top: 18,
          child: Container(
            width: 160,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: purple),
          ),
        ),
        Positioned(
          left: 22,
          child: Container(
            width: 140,
            height: 140,
            child: Image.asset(
              imageProduct,
              fit: BoxFit.fill,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 25,
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: white,
              ),
              Text(
                address,
                style: TextStyle(color: white, fontFamily: font),
              ),
              SizedBox(width: 50),
              (isNew)
                  ? Text(
                      'New',
                      style: TextStyle(
                          color: white,
                          fontFamily: font,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      'Used',
                      style: TextStyle(
                          color: white,
                          fontFamily: font,
                          fontWeight: FontWeight.bold),
                    )
            ],
          ),
        ),
        Positioned(
          top: 180,
          left: 25,
          child: Row(
            children: [
              Icon(
                Icons.attach_money,
                color: white,
              ),
              Text(
                price,
                style: TextStyle(color: white, fontFamily: font),
              ),
              SizedBox(width: 60),
              (isFavorite)
                  ? Icon(
                      Icons.favorite,
                      color: white,
                    )
                  : Icon(
                      Icons.favorite_outline,
                      color: white,
                    )
            ],
          ),
        ),
      ],
    );
  }
}
