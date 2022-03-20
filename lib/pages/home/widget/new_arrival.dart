import 'package:flutter/material.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/pages/home/widget/clothes_item_horizontal.dart';
import 'package:get/get.dart';

class NewArrival extends StatelessWidget {
  NewArrival({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrival".toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<ProductController>(builder: (products) {
            return Container(
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                scrollDirection: Axis.horizontal,
                itemCount: products.clothesList.isEmpty
                    ? 0
                    : products.clothesList.length,
                itemBuilder: (context, index) =>
                    ClothesItemHorizontal(clothes: products.clothesList[index]),
                separatorBuilder: (_, index) => const SizedBox(
                  width: 10,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
