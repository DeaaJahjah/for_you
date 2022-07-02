import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class ItemCustom extends StatelessWidget {
  String? urlImage;
  String address;
  String type;
  String price;
  Function()? onDelete;
  Function()? onEdit;
  ItemCustom(
      {Key? key,
      required this.urlImage,
      required this.address,
      required this.type,
      required this.price,
      this.onDelete,
      this.onEdit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: purple,
                border: Border.all(color: white.withOpacity(0.5), width: 1),
                borderRadius: BorderRadius.circular(10)),
            height: 130,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                      height: 130,
                      width: 130,
                      margin: const EdgeInsets.only(left: 5, right: 20),
                      child: (urlImage != null)
                          ? Image.network(urlImage!, fit: BoxFit.fill)
                          : const Center(
                              child: Text(
                              'No photo',
                              style: style2,
                            ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address,
                        style: textStyle,
                      ),
                      Text(
                        type,
                        style: textStyle,
                      ),
                      Text(
                        price,
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: const Icon(Icons.delete, color: white, size: 25),
                      onPressed: onDelete),
                  (onEdit != null)
                      ? IconButton(
                          icon: const Icon(Icons.edit, color: white, size: 25),
                          onPressed: onEdit)
                      : const SizedBox.shrink()
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
