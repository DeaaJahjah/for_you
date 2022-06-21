import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/Services/authentecation_service.dart';
import 'package:for_you/core/features/widgets/custom_navigation_bar.dart';
import 'package:for_you/core/features/widgets/elevated_button_custom.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile_screen';
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: CustomNavigationBar(index: 4),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: 280,
          color: white,
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            Positioned(
              top: 130,
              left: (MediaQuery.of(context).size.width / 2) - 72,
              child: Column(
                children: [
                  // (client.profilePicUrl != '')?
                  CircleAvatar(
                    backgroundColor: purple,
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Text(
          'Sally Alfisal',
          style: TextStyle(
              color: dark,
              fontFamily: font,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Text(
          'sallyalfisal@gmail.com',
          style: TextStyle(color: dark, fontFamily: font, fontSize: 18),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Syria/Homs',
                style: TextStyle(color: dark, fontFamily: font, fontSize: 18)),
            Icon(
              Icons.location_on,
              color: dark,
              size: 25,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '4.5',
              style: TextStyle(
                  color: dark,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 25,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(dark.withOpacity(0.2)),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: dark,
                    radius: 10,
                    child: Text('2', style: TextStyle(color: white)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Posts',
                    style: TextStyle(
                            color: dark,
                            fontFamily: font,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
          child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(dark.withOpacity(0.2)),
                ),
                onPressed: () {},
                child: Row(
                  children: [
                   Icon(Icons.edit,color: dark,),
                    SizedBox(width: 10),
                    Text(
                      'Edit profile',
                      style: TextStyle(
                          color: dark,
                          fontFamily: font,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
        ),
      
        ElevatedButtonCustom(onPressed: (){
          FlutterFireAuthServices().signOut(context);
        },text: 'Log out',color: dark,)
      ]),
    );
  }
}
