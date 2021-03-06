import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/models/post.dart';
import 'package:for_you/core/features/auth/models/user_model.dart';
import 'package:for_you/core/features/services/post_db_service.dart';
import 'package:for_you/core/features/services/report_db_service.dart';
import 'package:for_you/core/features/services/user_db_services.dart';
import 'package:for_you/core/features/widgets/similer_stuff.dart';
import 'package:for_you/core/features/widgets/text_row.dart';
import 'package:for_you/features/chat/services/stream_chat_service.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = 'details_screen';
  String? postId;
  DetailsScreen({Key? key, this.postId}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> imgList = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  UserModel? userModel;
  bool loading = true;
  bool state = false;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserDbServices().getUser(uid).then((value) {
      setState(() {
        userModel = value;
        loading = false;
      });
    });
    return Scaffold(
      backgroundColor: dark,
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(state);
          return false;
        },
        child: SafeArea(
            child: FutureBuilder<Post?>(
          future: PostDbService().getPostById(widget.postId!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Widget> imageSliders = snapshot.data!.photos!
                  .map((item) => Container(
                        height: 200,
                        margin: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList();
              String keywords = '';
              for (var element in snapshot.data!.keywrds!) {
                keywords += ' ' + element;
              }
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        (snapshot.data!.photos!.isNotEmpty)
                            ? CarouselSlider(
                                carouselController: _controller,
                                options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                  autoPlay: true,
                                  aspectRatio: 1.3,
                                  enlargeCenterPage: true,
                                ),
                                items: imageSliders,
                              )
                            : SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                                child: const Center(
                                    child: Text(
                                  'no photos',
                                  style: style1,
                                )),
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: snapshot.data!.photos!
                              .asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : purple)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                        TextRow(title: 'Adress ', data: snapshot.data!.address),
                        TextRow(title: 'Type ', data: snapshot.data!.type),
                        TextRow(
                            title: 'Price ',
                            data: snapshot.data!.price +
                                ' ' +
                                snapshot.data!.symbol),
                        TextRow(
                            title: 'Categories ',
                            data: snapshot.data!.category1 +
                                ' - ' +
                                snapshot.data!.category2),
                        TextRow(title: 'Keywords ', data: keywords),
                        TextRow(title: 'Description ', data: ''),
                        TextRow(title: '', data: snapshot.data!.description),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Similar items',
                                style: TextStyle(
                                    color: purple,
                                    fontFamily: font,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SimilerStuff(
                            category: snapshot.data!.category1,
                            postID: snapshot.data!.id!),
                      ],
                    ),
                    Positioned(
                      right: 10,
                      top: MediaQuery.of(context).size.height * 0.47,
                      child: Column(
                        children: [
                          (userModel!.id != snapshot.data!.userId)
                              ? InkWell(
                                  onTap: () async {
                                    //Start chat
                                    await StreamChatService().createChannel(
                                        context, snapshot.data!.userId);
                                  },
                                  child: const Icon(
                                    Icons.message,
                                    color: white,
                                    size: 25,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          (!loading)
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(
                                    onTap: () async {
                                      if (userModel!.isFavouritePost(
                                          snapshot.data!.id!)) {
                                        await UserDbServices()
                                            .removeFromFavourites(
                                                snapshot.data!.id!);
                                        state = false;
                                      } else {
                                        await UserDbServices().addToFivourites(
                                            snapshot.data!.id!);
                                        state = true;
                                      }
                                      setState(() {});
                                    },
                                    child: ((userModel!.isFavouritePost(
                                            snapshot.data!.id!)))
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 25,
                                          )
                                        : const Icon(
                                            Icons.favorite_outline,
                                            color: white,
                                            size: 25,
                                          ),
                                  ))
                              : const CircularProgressIndicator(
                                  color: purple,
                                ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              //send report
                              await ReportDbService()
                                  .sendReport(snapshot.data!.id!, context);
                            },
                            child: const Icon(
                              Icons.report_gmailerrorred,
                              color: white,
                              size: 25,
                            ),
                          ),
                          const Text('Report',
                              style: TextStyle(
                                color: white,
                                fontFamily: font,
                                fontSize: 16,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: purple),
              );
            }
            return const SizedBox.shrink();
          },
        )),
      ),
    );
  }
}
