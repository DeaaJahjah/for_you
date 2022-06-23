import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/screens/details_screen.dart';

class ProductCard extends StatelessWidget {
  bool isFavorite;
  String imageProduct;
  String type;
  String price;
  String address;
  String postId;
  ProductCard(
      {Key? key,
      required this.imageProduct,
      required this.isFavorite,
      required this.type,
      required this.address,
      required this.price,required this.postId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen(postId: postId,)));},
      child: Stack(
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
              child: Image.network(
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
               Text(
                        type,
                        style: TextStyle(
                            color: white,
                            fontFamily: font,
                            fontWeight: FontWeight.bold),
                      )
                 
              ],
            ),
          ),
          Positioned(
            top: 170,
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
                SizedBox(width: 50),
             
                   IconButton(
                       icon: Icon(Icons.favorite_outline),onPressed: () {
                          
                        },
                        color: white,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
