import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';
import 'package:for_you/core/features/services/user_db_services.dart';
import 'package:for_you/core/features/widgets/custom_navigation_bar.dart';
import 'package:for_you/core/features/widgets/drop_down_custom.dart';
import 'package:for_you/core/features/widgets/porduct_card.dart';
import 'package:for_you/core/features/widgets/text_field_new.dart';
import 'package:for_you/features/search/data_provider.dart';
import 'package:for_you/features/search/search_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> categoriesKeys = categories.keys.toList();
  ScrollController controller = ScrollController();
  UserModel? userModel;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  String type = '';
  String category = '';
  String keywords = '';
  String query = '';
  bool loading = true;
  @override
  void initState() {
    type = typies[0];
    category = categoriesKeys[0];
    UserDbServices().getUser(uid).then((value) {
      setState(() {
        userModel = value;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // Provider.of<SearchProvider>(context, listen: false).filteredPosts = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context, listen: false);

    Provider.of<DataProvider>(context, listen: false).fecthData();
    print(category);
    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(index: 3),
        backgroundColor: dark,
        appBar: AppBar(
            backgroundColor: purple,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              'SEARCH',
              style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            )),
        body: ListView(
          controller: controller,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: SizedBox(
                  height: 45,
                  child: TextFieldNew(
                    text: 'What Are You looking for?',
                    icon: Icons.search,
                    onChanged: (value) {
                      query = value;
                      searchProvider.search(
                          query: query,
                          category: category,
                          type: type,
                          keywords: keywords,
                          context: context);
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DropDownCustom(
                      categories: typies,
                      selectedItem: type,
                      onChanged: (String? newValue) {
                        setState(() {
                          type = newValue!;
                        });
                        searchProvider.search(
                            query: query,
                            category: category,
                            type: type,
                            keywords: keywords,
                            context: context);
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: DropDownCustom(
                      categories: categoriesKeys,
                      selectedItem: category,
                      onChanged: (String? newValue) {
                        setState(() {
                          category = newValue!;
                        });
                        searchProvider.search(
                            query: query,
                            category: category,
                            type: type,
                            keywords: keywords,
                            context: context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Text('Keywords', style: appBarTextStyle),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
              child: SizedBox(
                  height: 45,
                  child: TextFieldNew(
                    text: 'Ex: Clothes PC',
                    icon: Icons.abc,
                    onChanged: (value) {
                      keywords = value;
                      searchProvider.search(
                          query: query,
                          category: category,
                          type: type,
                          keywords: keywords,
                          context: context);
                    },
                  )),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Text('Recent search', style: appBarTextStyle),
            ),
            (!loading)
                ? Consumer<SearchProvider>(builder: (context, posts, child) {
                    if (posts.filteredPosts.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: Text('No results found', style: style1),
                        ),
                      );
                    }
                    return SizedBox(
                      // height: 200,
                      child: GridView.builder(
                        itemCount: posts.filteredPosts.length,
                        controller: controller,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 350,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 2,
                                mainAxisExtent: 250),
                        itemBuilder: (BuildContext context, int i) {
                          var post = posts.filteredPosts[i];
                          return ProductCard(
                            postId: post.id!,
                            imageProduct: post.photos!.first,
                            address: post.address,
                            isFavorite: userModel!.isFavouritePost(post.id!),
                            type: post.type,
                            price: post.price,
                          );
                        },
                      ),
                    );
                  })
                : const Center(
                    child: CircularProgressIndicator(color: purple),
                  )
          ],
        ));
  }
}
