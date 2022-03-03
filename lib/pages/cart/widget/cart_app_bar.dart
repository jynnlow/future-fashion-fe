import 'package:flutter/material.dart';
import 'package:future/pages/home/main_clothes_page.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 100),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainClothesPage()));
                },
                child: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ));
  }
}
