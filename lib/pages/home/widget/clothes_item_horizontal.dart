import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future/pages/detail/detail.dart';
import 'package:future/models/product_model.dart';

class ClothesItemHorizontal extends StatelessWidget {
  final ProductModel clothes;

  const ClothesItemHorizontal({Key? key, required this.clothes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(clothes: clothes)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 0,
                    left: 8,
                    right: 8,
                    top: 5,
                  ),
                  height: 200,
                  width: 200,
                  child: Image.memory(
                    base64Decode(clothes.pictures!.first
                        .split('data:image/png;base64,')[1]),
                    gaplessPlayback: true,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 180,
                  // padding: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      clothes.item!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 5, top: 10),
                      child: const Text(
                        "RM ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.pink),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5, top: 10),
                      child: Text(
                        clothes.price.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
