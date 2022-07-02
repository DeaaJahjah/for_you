import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/config/extensions/firebase.dart';
import 'package:for_you/core/features/auth/models/post.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';
import 'package:for_you/core/features/services/post_db_service.dart';
import 'package:for_you/core/features/services/user_db_services.dart';
import 'package:for_you/core/features/widgets/porduct_card.dart';

class SimilerStuff extends StatefulWidget {
  final String category;
  final String postID;
  const SimilerStuff({Key? key, required this.category, required this.postID})
      : super(key: key);

  @override
  State<SimilerStuff> createState() => _SimilerStuffState();
}

class _SimilerStuffState extends State<SimilerStuff> {
  bool loading = true;
  UserModel? userModel;
  @override
  void initState() {
    UserDbServices().getUser(context.userUid!).then((value) {
      setState(() {
        userModel = value;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (!loading)
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: FutureBuilder<List<Post>>(
                future: PostDbService().similerStuff(widget.category),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var posts = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: posts.length,
                        itemBuilder: (context, i) {
                          if (posts[i].id! != widget.postID) {
                            return SizedBox(
                              width: 200,
                              height: 300,
                              child: ProductCard(
                                postId: posts[i].id!,
                                imageProduct: (posts[i].photos!.isNotEmpty)
                                    ? posts[i].photos!.first
                                    : null,
                                address: posts[i].address,
                                isFavorite:
                                    userModel!.isFavouritePost(posts[i].id!),
                                type: posts[i].type,
                                price: posts[i].price,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        });
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: purple),
                    );
                  }
                  return const SizedBox.shrink();
                }))
        : const Center(
            child: CircularProgressIndicator(color: purple),
          );
  }
}
