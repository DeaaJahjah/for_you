import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

const Color purple = Color(0xff976ACA);
const Color dark = Color(0xff1F263B);
const Color white = Color(0xffffffff);

const String font = 'Palanquin';

const TextStyle navigationTextStyle =
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
