import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/auth/models/post.dart';
import 'package:for_you/core/features/auth/Services/post_db_service.dart';
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
  List<String> imgList = ['assets/images/i.jpg', 'assets/images/i.jpg'];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: SafeArea(
          child: FutureBuilder<Post>(
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
            return Stack(
              children: [
                Column(
                  children: [
                    CarouselSlider(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
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
                    )
                  ],
                ),
                Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height * 0.47,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await StreamChatService()
                              .createChannel(context, snapshot.data!.userId);
                        },
                        child: const Icon(
                          Icons.message,
                          color: white,
                          size: 25,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Icon(
                          Icons.favorite_outline,
                          color: white,
                          size: 25,
                        ),
                      ),
                      Text(snapshot.data!.price + ' ' + snapshot.data!.symbol,
                          style: const TextStyle(
                            color: white,
                            fontFamily: font,
                            fontSize: 16,
                          ))
                    ],
                  ),
                ),
              ],
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
    );
  }
}
