import 'package:flutter/material.dart';
import 'package:future/pages/home/main_clothes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List pages = [
    const MainClothesPage(),
    Container(
      child: Center(child: Text("Favourite")),
    ),
    Container(
      child: Center(child: Text("Order")),
    ),
    Container(
      child: Center(child: Text("Profile")),
    ),
  ];

  void onTapNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.pink,
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: onTapNav,
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
          ]),
    );
  }
}
