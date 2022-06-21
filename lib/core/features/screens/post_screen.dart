
import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/item_custome.dart';

class PostScreen extends StatefulWidget {
  static const String routeName = '/post_screen';
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(          backgroundColor: purple,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'My post',
            style:appBarTextStyle
          ) ),

          body:   ListView(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
        children: [
          ItemCustom(
            urlImage: 'assets/images/sport.png',
            address: 'Syria/Homs',
            type: 'New',
            price: '400',
            onDelete: () {},
            onEdit: (){},
          ),
          ItemCustom(
            urlImage: 'assets/images/kids.png',
            address: 'Syria/Hama',
            type: 'New',
            price: '1000',
            onDelete: () {},
            onEdit: (){},
            )
        ],
      ),
    );
  }
}