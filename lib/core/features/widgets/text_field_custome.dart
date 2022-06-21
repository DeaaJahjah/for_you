import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';

class TextFieldCustom extends StatelessWidget {
  int? maxLine = 1;
  String text;
  TextEditingController controller;
  IconData? icon;
  TextFieldCustom(
      {Key? key,
      required this.text,
      required this.controller,
      this.icon,
      this.maxLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      style: const TextStyle(
        color: white,
        fontFamily: font,
      ),
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: white.withOpacity(0.5),
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: purple, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: purple, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: text,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: purple, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          labelStyle: TextStyle(
              color: white.withOpacity(0.5),
              fontFamily: font,
              fontSize: 16,
              fontWeight: FontWeight.normal)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
