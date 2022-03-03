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
              children: const [
                Text(
                  "New Arrival",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          GetBuilder<ProductController>(builder: (products) {
            return Container(
              height: 280,
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
