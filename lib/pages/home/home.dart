import 'package:flutter/material.dart';
import 'package:future/pages/home/widget/home_app_bar.dart';
import 'package:future/pages/home/widget/popular.dart';
import 'package:future/pages/home/widget/new_arrival.dart';
import 'package:future/pages/home/widget/search_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List pages = [
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  void onTapNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                SearchInput(),
                NewArrival(),
                const BestSell(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.pink,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Order'),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'User',
              )
            ]));
  }
}
