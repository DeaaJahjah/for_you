import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/features/home_screen/models/category.dart';

class DropDownCustom extends StatefulWidget {
  List<String> categories;
  String selectedItem;
  Function(String?)? onChanged;
  DropDownCustom(
      {Key? key,
      required this.categories,
      required this.selectedItem,
      this.onChanged})
      : super(key: key);

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 110,
      decoration: BoxDecoration(
        border: Border.all(color: purple),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          dropdownColor: white,
          elevation: 10,
          iconEnabledColor: purple,
          style: const TextStyle(
              color: purple, fontFamily: font, fontWeight: FontWeight.bold),
          alignment: AlignmentDirectional.center,
          focusColor: purple,
          value: widget.selectedItem,
          isDense: true,
          onChanged: widget.onChanged,
          items: widget.categories.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
        ),
      ),
    );
  }
}
