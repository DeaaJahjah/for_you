import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/custom_navigation_bar.dart';
import 'package:for_you/core/features/widgets/drop_down_custom.dart';
import 'package:for_you/core/features/widgets/elevated_button_custom.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:intl/intl.dart';

class AddPostScreen extends StatefulWidget {
  static const String routeName = '/add_post';
  AddPostScreen({Key? key}) : super(key: key);
  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController descController = TextEditingController();

  bool isSwitched = true;
  List<String> category1 = categories.keys.toList();
  List<String> category2 = [];
  String selectedCategory1 = 'Select';
  String selectedCategory2 = 'Select';
  String symbol='Ls' ;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    category2 = categories[selectedCategory1]!;

    print(category1[1]);
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: dark,
      bottomNavigationBar: CustomNavigationBar(index: 0),
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0.0,
        title: Text('Add post', style: appBarTextStyle),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
            child: Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: purple),
                  color: dark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.add_photo_alternate_outlined,
                  color: white,
                  size: 50,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20, top: 10),
                child: Row(
                  children: [
                    Text('Available', style: style1),
                    SizedBox(width: 10),
                    FlutterSwitch(
                        value: isSwitched,
                        height: 30,
                        width: 50,
                        toggleSize: 20,
                        borderRadius: 50,
                        activeColor: dark,
                        inactiveColor: white,
                        toggleColor: purple,
                        switchBorder: Border.all(
                          color: purple,
                        ),
                        onToggle: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        }),
                  ],
                ),
              ),
              DropDownCustom(
                categories: category1,
                selectedItem: selectedCategory1,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory1 = newValue!;
                    selectedCategory2 = categories[selectedCategory1]!.first;
                    visible = true;
                  });
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Type', style: style1),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (va) {},
                      activeColor: purple,
                      autofocus: false,
                      fillColor: MaterialStateProperty.all(purple)),
                  Text(
                    'New',
                    style:style2
                  ),
                ],
              ),
              (visible)
                  ? DropDownCustom(
                      categories: category2,
                      selectedItem: selectedCategory2,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory2 = newValue!;
                        });
                      },
                    )
                  : SizedBox.shrink()
            ],
          ),
          Row(
            children: [
              Radio(
                  value: false,
                  groupValue: true,
                  onChanged: (va) {},
                  activeColor: purple,
                  autofocus: false,
                  fillColor: MaterialStateProperty.all(purple)),
              Text(
                'Used',
                style:style2
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              title('Adress'),
              Expanded(
                  child:
                      TextFieldCustom(text: '', controller: addressController)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              title('Price'),
              Expanded(
                  child:
                      TextFieldCustom(text: '', controller: priceController)),
              InkWell(
                  onTap: () {
                    showCurrencyPicker(
                      context: context,
                      showFlag: true,
                      showSearchField: true,
                      showCurrencyName: true,
                      showCurrencyCode: true,
                      onSelect: (Currency currency) {
                      //  Locale locale = Localizations.localeOf(context);
                        // var format = NumberFormat.simpleCurrency(
                        //     locale: locale.toString());
                        // print("Currency symbol ${format.currencySymbol}");
                        // print("Currency name ${format.currencyName}"); 
                        print('Select currency: ${currency.symbol}');
                        symbol=currency.symbol;
                        setState(() {
                          
                        });
                      },
                      favorite: ['SYP'],
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10) ,
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(border: Border.all(color: purple),
                    borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Text(symbol,style: style2,),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 40,
                          color: purple,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              title('Description'),
              Expanded(
                  child: TextFieldCustom(
                text: '',
                controller: descController,
                maxLine: 8,
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              title('Tags'),
              Expanded(
                  child: TextFieldCustom(text: '', controller: tagsController))
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButtonCustom(
                text: 'Add', color: purple, onPressed: () {}),
          )
        ],
      ),
    );
  }

  title(String title) {
    return Container(
      width: 80,
      child: Text(
        title,
        style: style1,
      ),
    );
  }
}
