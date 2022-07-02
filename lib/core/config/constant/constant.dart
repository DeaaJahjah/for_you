import 'package:flutter/material.dart';
import 'package:for_you/features/home_screen/models/category.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

const Color purple = Color(0xff976ACA);
const Color dark = Color(0xff1F263B);
const Color white = Color(0xffffffff);

const String font = 'Palanquin';

const TextStyle textStyle =
    TextStyle(color: white, fontFamily: font, fontSize: 16);

const TextStyle itemTextStyle =
    TextStyle(color: white, fontFamily: font, fontSize: 18);

const TextStyle appBarTextStyle = TextStyle(
    color: white, fontFamily: font, fontWeight: FontWeight.bold, fontSize: 22);

const TextStyle style1 = TextStyle(
    color: purple, fontFamily: font, fontSize: 16, fontWeight: FontWeight.bold);

const TextStyle style2 = TextStyle(
    color: white, fontFamily: font, fontSize: 14, fontWeight: FontWeight.bold);

StreamChatThemeData streamChatTheme = StreamChatThemeData(
  colorTheme: StreamColorTheme.dark(
      accentPrimary: purple, appBg: dark, barsBg: dark, overlayDark: purple),
  messageInputTheme: const StreamMessageInputThemeData(
    actionButtonColor: purple,
    sendButtonColor: purple,
  ),
  otherMessageTheme:
      const StreamMessageThemeData(messageBackgroundColor: purple),
  channelListViewTheme:
      const StreamChannelListViewThemeData(backgroundColor: dark),
);

var categories = {
  'Select': ['Select'],
  'Clothes': ['Women', 'Man', 'kids'],
  'Sport': ['Machines', 'Clothes', 'Games'],
  'Electronic': [
    'Mobiles',
    'Laptop',
    'Screens',
    'Washing machine',
    'Refrigerator',
    'Conditioners'
  ],
  'Furniture': [
    'Bed room',
    'salon',
    'living rooms',
    'Panels',
    'Samadiyat',
    'kitchen furniture'
  ],
  'kids': ['Games', 'Clothes'],
  'Accessories': ['Bags', 'Jewelry', 'Watches'],
  'Shoes': ['Man', 'Women', 'Kids'],
  'School supplies': ['Schoolbags', 'Clothes', 'Stationery'],
  'Books': ['Scientific books', 'Religious books', 'Novels', 'Cultural books'],
};

List<String> typies = ['New', 'Used'];
List<Category> categoriesHome = [
  Category(name: 'All', urlImage: 'assets/images/all.png', isSelected: true),
  Category(
      name: 'Clothes',
      urlImage: 'assets/images/clothes.png',
      isSelected: false),
  Category(name: 'kids', urlImage: 'assets/images/kids.png', isSelected: false),
  Category(
      name: 'Shoes', urlImage: 'assets/images/shoes.png', isSelected: false),
  Category(
      name: 'Sport', urlImage: 'assets/images/sport.png', isSelected: false),
  Category(
      name: 'Furniture',
      urlImage: 'assets/images/furniture.png',
      isSelected: false),
  Category(
      name: 'Electronic',
      urlImage: 'assets/images/electronics.png',
      isSelected: false),
  Category(
      name: 'Accessories',
      urlImage: 'assets/images/accessories.png',
      isSelected: false),
  Category(
      name: 'School supplies',
      urlImage: 'assets/images/school.png',
      isSelected: false),
  Category(
      name: 'Books', urlImage: 'assets/images/book.png', isSelected: false),
];
