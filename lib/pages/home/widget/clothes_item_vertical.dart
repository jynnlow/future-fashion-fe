import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future/models/product_model.dart';
import 'package:future/pages/detail/detail.dart';

class ClothesItemVertical extends StatelessWidget {
  final ProductModel clothes;
  const ClothesItemVertical({Key? key, required this.clothes})
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
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.memory(
                          base64Decode(clothes.pictures!.first
                              .split('data:image/png;base64,')[1]),
                          width: 100,
                          gaplessPlayback: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            clothes.item!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 16),
                          ),
                          // Text(
                          //   "Stock:" + clothes.stock.toString(),
                          //   style: const TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       height: 1.5,
                          //       color: Colors.grey),
                          // ),
                          Row(
                            children: [
                              const Text(
                                "RM ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.pink),
                              ),
                              Text(
                                clothes.price.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 1.5,
                                    color: Colors.pink,
                                    fontSize: 17),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
