import 'dart:io';

import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/config/enums/enums.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:for_you/core/features/auth/Services/authentecation_service.dart';
import 'package:for_you/core/features/auth/Services/file_services.dart';
import 'package:for_you/core/features/auth/Services/user_db_services.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';
import 'package:for_you/core/features/widgets/elevated_button_custom.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign_up';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  List<DropdownMenuItem> items = [
    const DropdownMenuItem(
      child: Text(''),
    )
  ];

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  XFile? pickedimage;
  String fileName = '';
  File? imageFile;
  var formKey = GlobalKey<FormState>();
  _pickImage() async {
    final picker = ImagePicker();
    try {
      pickedimage = await picker.pickImage(source: ImageSource.gallery);
      fileName = path.basename(pickedimage!.path);
      imageFile = File(pickedimage!.path);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('SIGN UP', style: appBarTextStyle),
      ),
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
              children: [
                InkWell(
                  onTap: () {
                    _pickImage();
                    setState(() {});
                    print(imageFile);
                  },
                  child: CircleAvatar(
                    backgroundColor: purple,
                    radius: 57,
                    child: (pickedimage == null)
                        ? const CircleAvatar(
                            backgroundColor: dark,
                            radius: 55,
                            child: Icon(Icons.person, size: 70, color: white),
                          )
                        : CircleAvatar(
                            radius: 60, backgroundImage: FileImage(imageFile!)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    text: 'User name',
                    controller: userName,
                    icon: Icons.person),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    text: 'Email', controller: email, icon: Icons.email),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    text: 'Password', controller: password, icon: Icons.lock),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    text: 'Confirm password',
                    controller: confirmPassword,
                    icon: Icons.done),
                const SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                    text: 'Address',
                    controller: address,
                    icon: Icons.location_on),
                const SizedBox(
                  height: 24,
                ),
                Consumer<AuthSataProvider>(
                    builder: (context, state, child) => (state.authState ==
                            AuthState.notSet)
                        ? ElevatedButtonCustom(
                            color: purple,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (confirmPassword.text == password.text) {
                                  var user = await FlutterFireAuthServices()
                                      .signUp(
                                          email: email.text,
                                          password: password.text,
                                          context: context);

                                  String url = '';

                                  if (user != null) {
                                    if (imageFile != null) {
                                      url = await FileService().uploadeimage(
                                          fileName, imageFile!, context);
                                    }

                                    if (url != 'error') {
                                      UserModel user = UserModel(
                                          name: userName.text,
                                          email: email.text,
                                          password: password.text,
                                          address: address.text,
                                          imgUrl: url);
                                      await UserDbServices()
                                          .creatUser(user, context);
                                    }
                                  }
                                } else {
                                  var snackBar = const SnackBar(
                                      content: Text('Password is incorrect'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              } else {
                                var snackBar = const SnackBar(
                                    content: Text('all fields are required'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            text: 'Sign up',
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: purple,
                          ))),
              ]),
        ),
      ),
    );
  }
}
