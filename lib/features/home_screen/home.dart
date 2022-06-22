import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:for_you/core/config/constant/keys.dart';
import 'package:for_you/core/features/screens/favourite_screen.dart';
import 'package:for_you/core/features/screens/post_screen.dart';
import 'package:for_you/core/features/widgets/category_card.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/custom_navigation_bar.dart';
import 'package:for_you/core/features/widgets/drawer_item.dart';
import 'package:for_you/core/features/widgets/porduct_card.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:for_you/features/chat/messages_screen.dart';
import 'package:for_you/features/home_screen/models/category.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  bool isSwitched = true;
  List<Category> categories = [
    Category(
        name: 'House', urlImage: 'assets/images/house.png', isSelected: true),
    Category(
        name: 'Kids', urlImage: 'assets/images/kids.png', isSelected: false),
    Category(
        name: 'Sport', urlImage: 'assets/images/sport.png', isSelected: false),
    Category(
        name: 'Furniture',
        urlImage: 'assets/images/furniture.png',
        isSelected: false),
    Category(
        name: 'Furniture',
        urlImage: 'assets/images/furniture.png',
        isSelected: false)
  ];
  @override
  Widget build(BuildContext context) {
    //FlutterFireAuthServices().signOut(context);
    final client = StreamChatClient(streamKey);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [
            // StreamBuilder<int>(
            //     stream: client.state.totalUnreadCountStream,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         print(snapshot.data.toString());
            //         return Stack(
            //           children: [
            //             IconButton(
            //               icon: const Icon(Icons.message),
            //               onPressed: () {
            //                 Navigator.of(context)
            //                     .pushNamed(MessagesScreen.routeName);
            //               },
            //             ),
            //             CircleAvatar(
            //               backgroundColor: purple,
            //               radius: 10,
            //               child: Text(
            //                 snapshot.data.toString(),
            //                 style: const TextStyle(color: white, fontSize: 8),
            //               ),
            //             )
            //           ],
            //         );
            //       }
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(color: purple),
            //         );
            //       }
            //       return const SizedBox.shrink();
            //     })
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                Navigator.of(context).pushNamed(MessagesScreen.routeName);
              },
            )
          ],
          backgroundColor: dark,
          elevation: 0.0,
          title: Row(
            children: [
              const SizedBox(width: 65),
              Image.asset(
                'assets/images/logo.png',
                scale: 4,
              ),
              const Text('HOME', style: appBarTextStyle),
            ],
          ),
        ),
        backgroundColor: dark,
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                color: purple,
                child: DrawerHeader(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: white,
                        radius: 45,
                        backgroundImage: NetworkImage(''),
                      ),
                    ),
                    Text(
                      'Doaa Alfisal',
                      style: TextStyle(
                          color: white,
                          fontFamily: font,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      'DoaaAlfisal@gmail.com',
                      style: TextStyle(color: white, fontFamily: font),
                    )
                  ],
                )),
              ),
              ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DrawerItem(
                        icon: Icons.favorite,
                        text: 'Favourites',
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(FavouriteScreen.routeName);
                        }),
                    DrawerItem(
                        icon: Icons.post_add,
                        text: 'My posts',
                        onTap: () {
                          Navigator.of(context).pushNamed(PostScreen.routeName);
                        }),
                    DrawerItem(
                        icon: Icons.message,
                        text: 'My messages',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MessagesScreen.routeName);
                        }),
                    DrawerItem(
                        icon: Icons.add_box,
                        text: 'Add post',
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(FavouriteScreen.routeName);
                        }),
                    DrawerItem(
                        icon: Icons.help,
                        text: 'Help',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(FavouriteScreen.routeName);
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DrawerItem(
                            icon: Icons.language_rounded,
                            text: 'Laguages',
                            onTap: null),
                        FlutterSwitch(
                            value: isSwitched,
                            height: 30,
                            width: 50,
                            toggleSize: 20,
                            borderRadius: 50,
                            activeColor: white,
                            inactiveColor: white,
                            toggleColor: purple,
                            switchBorder: Border.all(
                              color: purple,
                            ),
                            activeIcon: const Text('en',
                                style: TextStyle(color: white)),
                            inactiveIcon: const Text('ar',
                                style: TextStyle(color: white)),
                            onToggle: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            })
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(index: 2),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  backgroundColor: dark,
                  pinned: false,
                  snap: true,
                  floating: true,
                  toolbarHeight: 210,
                  leading: const SizedBox.shrink(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                          child: SizedBox(
                              height: 40,
                              child: TextFieldCustom(
                                  text: 'Search',
                                  controller: controller,
                                  icon: Icons.search)),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: font,
                                color: white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CategoryCard(
                                name: categories[index].name,
                                url: categories[index].urlImage,
                                onTap: () {
                                  for (int i = 0; i < categories.length; i++) {
                                    if (i == index) {
                                      categories[i].isSelected = true;
                                    } else {
                                      categories[i].isSelected = false;
                                    }
                                    setState(() {});
                                  }
                                },
                                isSelected: categories[index].isSelected),
                            itemCount: categories.length,
                          ),
                        ),
                      ],
                    ),
                  )),
            ];
          },
          body: GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                childAspectRatio: 0.7,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, i) => ProductCard(
                    imageProduct: 'assets/images/product.png',
                    address: 'Homs',
                    isFavorite: true,
                    isNew: true,
                    price: '100',
                  )),
        ));
  }
}
