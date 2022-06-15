import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:for_you/features/search/key_word_container.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  List<String> texts=[
    'T-shirt cotton', 'Trousers','Car ford','Ring','Cups','Baby clothes','Big houses',
    'Clothes used','Winter clothes',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: dark,
        appBar: AppBar(
            backgroundColor: purple,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'SEARCH',
              style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            )),
        body: 
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                child: SizedBox(
                    height: 40,
                    child: TextFieldCustom(
                        text: 'Search',
                        controller: controller,
                        icon: Icons.search)),
              ),
            ),
            SliverToBoxAdapter(child: Divider(thickness: 0.5,color: purple)),
        
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Key words',
                  style: TextStyle(
                      fontFamily: font,
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),

 SliverToBoxAdapter(
          child: Container(
            
      padding: EdgeInsets.all(8),
            color: dark,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                itemCount: texts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.7,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, i) => KeyWordContainer(
                     text: texts[i],
                    )),
          ),
        )

            //          Row(
             
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     KeyWordContainer(text: 'T-shirt cotton'),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     KeyWordContainer(text: 'Trousers'),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     KeyWordContainer(text: 'Car ford'),
            //   ],
            // ),
            // SizedBox(height:8),
            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     KeyWordContainer(text: 'Ring'),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     KeyWordContainer(text: 'Cups'),
            //      SizedBox(
            //       width: 10,
            //     ),
            //        KeyWordContainer(text: 'Baby clothes'),
               
            //   ],
            // ),
            //  SizedBox(height:8),
            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     KeyWordContainer(text: 'Big houses'),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     KeyWordContainer(text: 'Clothes used'),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     KeyWordContainer(text: 'Winter clothes'),
            //   ],
            // ),
          ],
        ));
  }
}
