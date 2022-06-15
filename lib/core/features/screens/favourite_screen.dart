import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/item_custome.dart';

class FavouriteScreen extends StatefulWidget {
  static const String routeName = '/favourite_screen';
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
          backgroundColor: purple,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'FAVOURITES',
            style: TextStyle(
                color: white,
                fontFamily: font,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          )),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        children: [
          ItemCustom(
            urlImage: 'assets/images/sport.png',
            address: 'Syria/Homs',
            type: 'New',
            price: '400',
            onPressed: () {},
          ),
          ItemCustom(
            urlImage: 'assets/images/kids.png',
            address: 'Syria/Hama',
            type: 'New',
            price: '1000',
            onPressed: () {},) 
        ],
      ),
    );
  }
}
