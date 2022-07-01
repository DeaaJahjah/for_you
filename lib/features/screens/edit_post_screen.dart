import 'dart:io';

import 'package:currency_picker/currency_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/config/enums/enums.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:for_you/core/features/auth/Services/file_services.dart';
import 'package:for_you/core/features/auth/models/post.dart';
import 'package:for_you/core/features/services/post_db_service.dart';
import 'package:for_you/core/features/widgets/drop_down_custom.dart';
import 'package:for_you/core/features/widgets/elevated_button_custom.dart';
import 'package:for_you/core/features/widgets/picked_image_network.dart';
import 'package:for_you/core/features/widgets/picked_images_widget.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:for_you/features/home_screen/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditPostScreen extends StatefulWidget {
  static const String routeName = '/edit_post_screen';
  const EditPostScreen({Key? key}) : super(key: key);

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController descController = TextEditingController();

  bool isSwitched = true;
  List<String> category1 = categories.keys.toList();
  List<String> category2 = [];
  String selectedCategory1 = 'Select';
  String selectedCategory2 = 'Select';
  String symbol = 'Ls';
  bool visible = false;
  String postType = 'New';
  List<XFile> pickedimages = [];
  List<String> photos = [];
  String postId = '';
  bool firstTime = false;
  _pickImage() async {
    final picker = ImagePicker();
    try {
      var picked = await picker.pickMultiImage();
      if (picked!.isNotEmpty) {
        pickedimages.addAll(picked);
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void didChangeDependencies() {
    if (!firstTime) {
      final Post post = ModalRoute.of(context)?.settings.arguments as Post;
      addressController.text = post.address;
      priceController.text = post.price;
      descController.text = post.description;
      selectedCategory1 = post.category1;
      selectedCategory2 = post.category2;
      postType = post.type;
      category2 = categories[selectedCategory1] ?? [];
      symbol = post.symbol;
      print(symbol);
      photos = post.photos!;
      postId = post.id!;
      if (post.keywrds != null) {
        for (var element in post.keywrds!) {
          tagsController.text += ('#' + element + ' ').toString();
        }
      }
      firstTime = true;
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0.0,
        title: const Text('Edit Post', style: appBarTextStyle),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 10),
            child: InkWell(
              onTap: () {
                _pickImage();
                setState(() {});
              },
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: purple),
                    color: dark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.add_photo_alternate_outlined,
                    color: white,
                    size: 30,
                  )),
            ),
          ),
          (pickedimages.isNotEmpty)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return PickedImagesWidget(
                        url: File(pickedimages[i].path),
                        onTap: () {
                          pickedimages.removeAt(i);
                          setState(() {});
                        },
                      );
                    },
                    itemCount: pickedimages.length,
                  ),
                )
              : const SizedBox.shrink(),
          (photos.isNotEmpty)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return PickedImageNetwok(
                        url: photos[i],
                        onTap: () {
                          photos.removeAt(i);
                          setState(() {});
                        },
                      );
                    },
                    itemCount: photos.length,
                  ),
                )
              : const SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 20, top: 0),
                child: Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Text('Available', style: style1),
                      const SizedBox(width: 10),
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
              ),
              Expanded(
                flex: 2,
                child: DropDownCustom(
                  categories: category1,
                  selectedItem: selectedCategory1,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory1 = newValue!;
                      selectedCategory2 = categories[selectedCategory1]!.first;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: DropDownCustom(
                  categories: typies,
                  selectedItem: postType,
                  onChanged: (String? newValue) {
                    setState(() {
                      postType = newValue!;
                    });
                  },
                ),
              ),
              Expanded(
                child: DropDownCustom(
                  categories: category2,
                  selectedItem: selectedCategory2,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory2 = newValue!;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              title('Adress'),
              Expanded(
                  child:
                      TextFieldCustom(text: '', controller: addressController)),
            ],
          ),
          const SizedBox(
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
                      theme: CurrencyPickerThemeData(backgroundColor: dark),
                      onSelect: (Currency currency) {
                        symbol = currency.symbol;
                        setState(() {});
                      },
                      favorite: ['SYP'],
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: purple),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Text(
                          symbol,
                          style: style2,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 40,
                          color: purple,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
          const SizedBox(
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              title('Tags'),
              Expanded(
                  child: TextFieldCustom(text: '', controller: tagsController))
            ],
          ),
          const SizedBox(height: 20),
          Consumer<AuthSataProvider>(builder: (context, value, child) {
            return Center(
                child: (value.authState == AuthState.notSet)
                    ? ElevatedButtonCustom(
                        text: 'Update',
                        color: purple,
                        onPressed: () async {
                          Provider.of<AuthSataProvider>(context, listen: false)
                              .changeAuthState(newState: AuthState.waiting);

                          List<String> keywords =
                              tagsController.text.split('#').toList();
                          String uid = FirebaseAuth.instance.currentUser!.uid;

                          List<String> images = [];

                          images = await FileService()
                              .uploadeimages(pickedimages, context);

                          Post post = Post(
                              id: postId,
                              address: addressController.text,
                              category1: selectedCategory1,
                              category2: selectedCategory2,
                              description: descController.text,
                              isAvailable: isSwitched,
                              price: priceController.text,
                              symbol: symbol,
                              type: postType,
                              userId: uid,
                              keywrds: keywords,
                              photos: images + photos);
                          await PostDbService().updatePost(post);

                          Provider.of<AuthSataProvider>(context, listen: false)
                              .changeAuthState(newState: AuthState.notSet);
                          SnackBar snackBar =
                              const SnackBar(content: Text('successfully'));
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        })
                    : const CircularProgressIndicator(
                        color: purple,
                      ));
          })
        ],
      ),
    );
  }
}

title(String title) {
  return SizedBox(
    width: 80,
    child: Text(
      title,
      style: style1,
    ),
  );
}
