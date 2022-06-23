import 'package:flutter/material.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/custom_navigation_bar.dart';
import 'package:for_you/core/features/widgets/drop_down_custom.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  List<String> category = categories.keys.toList();
 
  String selectedtype='';
   String category1='';
@override
  void initState() {
    selectedtype = typies[0];
 category1 = category[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        bottomNavigationBar: CustomNavigationBar(index: 3),
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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                child: SizedBox(
                    height: 40,
                    child: TextFieldCustom(
                        text: 'What Are You looking for?',
                        controller: controller,
                        icon: Icons.search)),
              ),
            ),
     
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                children: [
                  DropDownCustom(
                
                    categories: typies,
                    selectedItem: selectedtype,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedtype = newValue!;
                      });
                    },
                  ),
                  DropDownCustom(
                    categories: category,
                    selectedItem: category1,
                    onChanged: (String? newValue) {
                      setState(() {
                        category1 = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
                   SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Key words',
                  style: appBarTextStyle
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: SizedBox(
                    height: 40,
                    child: TextFieldCustom(
                        text: 'Ex: #Clothes #PC',
                        controller: controller,
                        icon: Icons.search)),
              ),  
            )
          ],
        ));
  }
}
