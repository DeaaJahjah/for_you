import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/elevated_button_custom.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:for_you/features/home_screen/home.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign_up';
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'SIGN UP',
          style: TextStyle(
              color: white,
              fontFamily: font,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: Center(
        child: ListView(padding: EdgeInsets.fromLTRB(20, 5, 20, 0), children: [
          CircleAvatar(
            backgroundColor: purple,
            radius: 57,
            child: CircleAvatar(
              backgroundColor: dark,
              radius: 55,
              child: Icon(Icons.person, size: 70, color: white),
            ),
          ),
          SizedBox(height: 20,),
          TextFieldCustom(text: 'User name', controller: userName, icon: Icons.person),
          SizedBox(height: 20,),
              TextFieldCustom(text: 'Email', controller: email, icon: Icons.email),
                 SizedBox(height: 20,),
            TextFieldCustom(text: 'Password', controller: password, icon: Icons.lock),
              SizedBox(height: 20,),
            TextFieldCustom(text: 'Confirm password', controller: confirmPassword, icon: Icons.done),
                 SizedBox(height: 20,),
         TextFieldCustom(text: 'Address', controller: address, icon: Icons.location_on),
                 SizedBox(height: 24,),
                 ElevatedButtonCustom(onPressed: (){
                   Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                 }, text: 'Sign up',)
           
        ]),
      ),
    );
  }
}
