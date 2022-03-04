import 'package:flutter/material.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/pages/home/main_clothes_page.dart';
import 'package:get/get.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        left: 20,
        right: 20,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.pink,
                      size: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
