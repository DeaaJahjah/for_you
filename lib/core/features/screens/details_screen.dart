import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/text_row.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = 'details_screen';
  DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> imgList = ['assets/images/i.jpg', 'assets/images/i.jpg'];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              height: 200,
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                ),
              ),
            ))
        .toList();

    return Scaffold(
      backgroundColor: dark,
      body: SafeArea(
        child: Stack(
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
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : purple)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                TextRow(title: 'Adress ', data: 'data'),
                TextRow(title: 'Type ', data: 'data'),
                TextRow(title: 'Categories ', data: 'data'),
                TextRow(title: 'Keywords ', data: 'data'),
                TextRow(title: 'Description ', data: ''),
                TextRow(
                    title: '',
                    data:
                        'DescriptionDDescriptionDDescriptionDDescriptionD escriptionDescr iptionDescriptionDescrip tionDescript ionDescription'),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 10),
                  child: Align(alignment: Alignment.centerLeft,
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
                  Icon(
                    Icons.message,
                    color: white,
                    size: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      Icons.favorite_outline,
                      color: white,
                      size: 25,
                    ),
                  ),
                  Text('500\$',
                      style: TextStyle(
                        color: white,
                        fontFamily: font,
                        fontSize: 16,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
