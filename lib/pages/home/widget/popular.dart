import 'package:flutter/material.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/pages/home/widget/clothes_item_vertical.dart';
import 'package:get/get.dart';

class BestSell extends StatelessWidget {
  const BestSell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Popular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        GetBuilder<ProductController>(builder: (products) {
          return Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: products.clothesList.isEmpty
                  ? 0
                  : products.clothesList.length ~/ 2,
              itemBuilder: (context, index) => ClothesItemVertical(
                clothes: products.clothesList[index + 1],
              ),
            ),
          );
        })
      ]),
    );
  }
}
