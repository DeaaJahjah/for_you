import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/Services/user_db_services.dart';
import 'package:for_you/core/features/screens/details_screen.dart';

class ProductCard extends StatefulWidget {
  bool isFavorite;
  final String imageProduct;
  final String type;
  final String price;
  final String address;
  final String postId;

  ProductCard({
    Key? key,
    required this.imageProduct,
    required this.isFavorite,
    required this.type,
    required this.address,
    required this.price,
    required this.postId,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      postId: widget.postId,
                    )))
            .then((value) {
          setState(() {
            print(value);
            widget.isFavorite = value;
          });
        });
      },
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
            child: SizedBox(
              width: 140,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.imageProduct,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 25,
            width: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: white,
                    ),
                    Text(
                      widget.address,
                      style: const TextStyle(
                          color: white,
                          fontFamily: font,
                          overflow: TextOverflow.fade),
                    ),
                  ],
                ),
                Text(
                  widget.type,
                  style: const TextStyle(
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
                const Icon(
                  Icons.attach_money,
                  color: white,
                ),
                Text(
                  widget.price,
                  style: const TextStyle(color: white, fontFamily: font),
                ),
                const SizedBox(width: 50),
                IconButton(
                  icon: (widget.isFavorite)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_outline),
                  onPressed: () async {
                    if (widget.isFavorite) {
                      await UserDbServices()
                          .removeFromFavourites(widget.postId);
                    } else {
                      await UserDbServices().addToFivourites(widget.postId);
                    }
                    setState(() {
                      widget.isFavorite = !widget.isFavorite;
                    });
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
