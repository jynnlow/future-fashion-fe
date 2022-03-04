import 'package:flutter/material.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/pages/cart/cart.dart';
import 'package:future/pages/cart/widget/cart_list.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ProductController>().initProduct(Get.find<CartController>());
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 25, left: 25, right: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: 'Howdy, What are you \nlooking for? ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: '👀',
                style: TextStyle(
                  fontSize: 22,
                ),
              )
            ]))
          ],
        ),
        GetBuilder<ProductController>(builder: (products) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0.1,
                          blurRadius: 0.1,
                          offset: const Offset(0, 1))
                    ]),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ),
              products.totalItems > 0
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : Container(),
              products.totalItems > 0
                  ? Positioned(
                      right: 6,
                      top: 4,
                      child: Text(
                        products.totalItems.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    )
                  : Container()
            ],
          );
        })
      ]),
    );
  }
}
