import 'package:flutter/material.dart';

const Color purple = Color(0xff976ACA);
const Color dark = Color(0xff1F263B);
const Color white = Color(0xffffffff);

const String font = 'Palanquin';

const TextStyle textStyle =
    TextStyle(color: white, fontFamily: font, fontSize: 16);


const TextStyle appBarTextStyle = TextStyle(
    color: white, fontFamily: font, fontWeight: FontWeight.bold, fontSize: 22);

 const TextStyle style1 = TextStyle(
    color: purple, fontFamily: font, fontSize: 16, fontWeight: FontWeight.bold);

const TextStyle style2 = TextStyle(
  color: white,
  fontFamily: font,
  fontSize: 14,
   fontWeight: FontWeight.bold
);

var categories = {
  'Select': ['Select'],
  'Clothes': ['Women', 'Man'],
  'Sport': ['Machines', 'Clothes'],
  'Electronic': ['Select', 'gfgf'],
  'cars': ['Select'],
  'Furniture and home décor': ['Select'],
  'kids': ['Select'],
  'accessories': ['Select'],
  'shoes': ['Select'],
  'school supplies': ['Select'],
  'books': ['Select'],
};

 List<String> typies = ['New', 'Used'];