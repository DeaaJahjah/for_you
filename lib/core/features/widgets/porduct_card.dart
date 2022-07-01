import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/services/user_db_services.dart';
import 'package:for_you/features/screens/details_screen.dart';

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
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: dark,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: purple,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            widget.imageProduct,
                            fit: BoxFit.cover,

                            //width: double.infinity,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                titleWithIcon(
                                    title: widget.address,
                                    icon: Icons.location_on),
                                Text(
                                  widget.type,
                                  style: const TextStyle(
                                    color: white,
                                    fontFamily: font,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                titleWithIcon(
                                    title: widget.price,
                                    icon: Icons.attach_money),
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
                                      await UserDbServices()
                                          .addToFivourites(widget.postId);
                                    }
                                    setState(() {
                                      widget.isFavorite = !widget.isFavorite;
                                    });
                                  },
                                  color: white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   bottom: 42,
                //   left: 0,
                //   right: 0,
                //   child:
                // ),
              ],
            )));
  }
}

Widget titleWithIcon({required String title, required IconData icon}) {
  return Row(
    children: [
      Icon(
        icon,
        color: white,
      ),
      const SizedBox(
        width: 5,
      ),
      Text(
        title,
        style: const TextStyle(
          color: white,
          fontSize: 16,
          fontFamily: font,
        ),
      ),
    ],
  );
}
