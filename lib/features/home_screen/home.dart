import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:for_you/core/features/auth/models/post.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';

import 'package:for_you/core/features/services/post_db_service.dart';
import 'package:for_you/core/features/services/user_db_services.dart';
import 'package:for_you/core/features/widgets/category_card.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/custom_navigation_bar.dart';
import 'package:for_you/core/features/widgets/drawer_item.dart';
import 'package:for_you/core/features/widgets/porduct_card.dart';
import 'package:for_you/features/chat/messages_screen.dart';
import 'package:for_you/features/screens/add_post.dart';
import 'package:for_you/features/screens/favourite_screen.dart';
import 'package:for_you/features/screens/help_screen.dart';
import 'package:for_you/features/screens/my_posts_screen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  String category = categoriesHome[0].name;
  bool isSwitched = true;
  bool loading = true;
  UserModel? userModel;

  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    UserDbServices().getUser(uid).then((value) {
      setState(() {
        userModel = value;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterFireAuthServices().signOut(context);

    return Scaffold(
        backgroundColor: dark,
        bottomNavigationBar: CustomNavigationBar(index: 2),
        appBar: AppBar(
          centerTitle: true,
          actions: [
            StreamBuilder<int>(
                stream: StreamChatCore.of(context)
                    .client
                    .state
                    .totalUnreadCountStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.message),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(MessagesScreen.routeName);
                          },
                        ),
                        if (snapshot.data != 0)
                          CircleAvatar(
                            backgroundColor: purple,
                            radius: 10,
                            child: Text(
                              snapshot.data.toString(),
                              style: const TextStyle(color: white, fontSize: 8),
                            ),
                          )
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: purple),
                    );
                  }
                  return const SizedBox.shrink();
                })
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
        drawer: Drawer(
            backgroundColor: white,
            child: Column(children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: dark,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: FutureBuilder<UserModel?>(
                    future: UserDbServices().getUser(uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            CircleAvatar(
                              backgroundColor: purple,
                              radius: 50,
                              backgroundImage: NetworkImage(
                                snapshot.data!.imgUrl,
                                scale: 4,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              snapshot.data!.name,
                              style: const TextStyle(
                                color: white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              snapshot.data!.email,
                              style: const TextStyle(
                                  color: white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(color: purple),
                      );
                    }),
              ),
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
                    Navigator.of(context).pushNamed(MyPostsScreen.routeName);
                  }),
              DrawerItem(
                  icon: Icons.message,
                  text: 'My messages',
                  onTap: () {
                    Navigator.of(context).pushNamed(MessagesScreen.routeName);
                  }),
              DrawerItem(
                  icon: Icons.add_box,
                  text: 'Add post',
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AddPostScreen.routeName);
                  }),
              DrawerItem(
                  icon: Icons.help,
                  text: 'Help',
                  onTap: () {
                    Navigator.of(context).pushNamed(HelpScreen.routeName);
                  })
            ])),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  backgroundColor: dark,
                  pinned: false,
                  snap: true,
                  floating: true,
                  toolbarHeight: 180,
                  leading: const SizedBox.shrink(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => CategoryCard(
                                name: categoriesHome[index].name,
                                url: categoriesHome[index].urlImage,
                                onTap: () {
                                  for (int i = 0;
                                      i < categoriesHome.length;
                                      i++) {
                                    if (i == index) {
                                      categoriesHome[i].isSelected = true;
                                      category = categoriesHome[i].name;
                                      setState(() {});
                                    } else {
                                      categoriesHome[i].isSelected = false;
                                    }
                                    setState(() {});
                                  }
                                },
                                isSelected: categoriesHome[index].isSelected),
                            itemCount: categoriesHome.length,
                          ),
                        ),
                      ],
                    ),
                  )),
            ];
          },
          body: (!loading)
              ? StreamBuilder<List<Post>>(
                  stream: PostDbService().getPostsByCategory(category),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Post> posts = snapshot.data!;
                      return GridView.builder(
                          itemCount: posts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 2,
                          ),
                          itemBuilder: (context, i) => ProductCard(
                                postId: posts[i].id!,
                                imageProduct: (posts[i].photos!.isNotEmpty)
                                    ? posts[i].photos!.first
                                    : null,
                                address: posts[i].address,
                                isFavorite:
                                    userModel!.isFavouritePost(posts[i].id!),
                                type: posts[i].type,
                                price: posts[i].price,
                              ));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: purple),
                      );
                    }
                    return const SizedBox.shrink();
                  })
              : const Center(child: CircularProgressIndicator(color: purple)),
        ));
  }
}
