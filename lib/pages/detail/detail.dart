import 'package:flutter/material.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/pages/detail/widget/add_cart.dart';
import 'package:future/pages/detail/widget/detail_app_bar.dart';
import 'package:future/pages/detail/widget/clothes_info.dart';
import 'package:future/pages/detail/widget/size_chart.dart';
import 'package:future/pages/detail/widget/size_list.dart';
import 'package:future/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailPage extends StatelessWidget {
  final ProductModel clothes;

  const DetailPage({Key? key, required this.clothes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //every time click into the clothes details will make the quantity 0
    Get.find<ProductController>().initProduct(Get.find<CartController>());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailAppBar(
              clothes: clothes,
            ),
            ClothesInfo(
              clothes: clothes,
            ),
            SizeChart(clothes: clothes),
            const SizeList(),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<ProductController>(
        builder: (products) {
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        Text(
                          'RM ${clothes.price}',
                          style: const TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.pink),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.pink,
                              width: 1,
                            )),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                products.setQuantity(false);
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.pink.withOpacity(0.5),
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              products.quantity.toString(),
                              style: const TextStyle(
                                  height: 1, fontSize: 20, color: Colors.pink),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () => products.setQuantity(true),
                              child: Icon(
                                Icons.add,
                                color: Colors.pink.withOpacity(0.5),
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            color: Colors.pink),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => products.addItemToCart(clothes),
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
