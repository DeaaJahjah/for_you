import 'package:flutter/material.dart';
import 'package:for_you/core/features/auth/screens/sign_up_screen.dart';
import 'package:for_you/core/features/widgets/category_card.dart';
import 'package:for_you/core/config/constant/constant.dart';
import 'package:for_you/core/features/widgets/porduct_card.dart';
import 'package:for_you/core/features/widgets/text_field_custome.dart';
import 'package:for_you/features/home_screen/models/category.dart';
import 'package:for_you/features/notification/notification_screen.dart';
import 'package:for_you/features/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex =0; 
  TextEditingController controller = TextEditingController();
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
    return Scaffold(
      drawer: Drawer(child: ListView(children: [DrawerHeader(child:Column(children: [Center(
        child: CircleAvatar(
   backgroundColor: purple,
                        radius: 40,
                        backgroundImage: NetworkImage(''),
        ),
      )],)),
      ListTile(title: Text('item1'),)],)),
      bottomNavigationBar: BottomNavigationBar( 
        backgroundColor: white.withOpacity(0.5),
currentIndex: currentIndex,
onTap: (index)=>setState(() {
  currentIndex=index;
}),
type: BottomNavigationBarType.fixed ,
unselectedItemColor: purple.withOpacity(0.5),
selectedItemColor: purple,
showUnselectedLabels: false,
showSelectedLabels: true,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favourite'),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'profile'),
      ]),
      backgroundColor: dark,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationScreen.routeName);
            },
          )
        ],
        backgroundColor: dark,
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          children: [
            SizedBox(width: 65),
            Image.asset(
              'assets/images/logo.png',
              scale: 4,
            ),
            Text(
              'HOME',
              style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ],
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
            child: SizedBox(
                height: 40,
                child: TextFieldCustom(
                    text: 'Search',
                    controller: controller,
                    icon: Icons.search)),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: font,
                  color: white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryCard(
                  name: categories[index].name,
                  url: categories[index].urlImage,
                  onTap: () {
                    for (int i = 0; i < categories.length; i++) {
                      if (i == index)
                        categories[i].isSelected = true;
                      else
                        categories[i].isSelected = false;
                      setState(() {});
                    }
                  },
                  isSelected: categories[index].isSelected),
              itemCount: categories.length,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            color: dark,
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
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
          ),
        )
      ]),
    );
  }
}
