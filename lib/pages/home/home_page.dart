import 'package:flutter/material.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/pages/favourite/favourite.dart';
import 'package:future/pages/home/main_clothes_page.dart';
import 'package:future/pages/order/order_page.dart';
import 'package:future/pages/profile/profile_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List pages = [
    const MainClothesPage(),
    const FavouritePage(),
    const OrderPage(),
    const ProfilePage(),
  ];

  void onTapNav(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().getProductList();

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
