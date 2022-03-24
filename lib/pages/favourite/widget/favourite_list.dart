import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:future/pages/detail/detail.dart';
import 'package:future/pages/favourite/widget/slidable_widget.dart';
import 'package:get/get.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(builder: (favourite) {
      var favouriteList = favourite.favouriteList;
      return Stack(
        children: [
          Container(
            height: 1000,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: favouriteList.length,
              itemBuilder: (context, index) => SlidableWidget(
                index: index,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(clothes: favouriteList[index])));
                    }),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              // borderRadius: BorderRadius.(15),
                              child: Image.memory(
                                base64Decode(favouriteList[index]
                                    .pictures!
                                    .first
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
                                  favouriteList[index].item!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                      fontSize: 15),
                                ),
                                // Text(
                                //   "Stock:" +
                                //       favouriteList[index].stock.toString(),
                                //   style: const TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       height: 1.5,
                                //       color: Colors.grey),
                                // ),
                                // Text(
                                //   "RM " + favouriteList[index].price.toString(),
                                //   style: const TextStyle(
                                //       fontWeight: FontWeight.bold,
                                //       height: 1.5,
                                //       color: Colors.pink),
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
                                      favouriteList[index].price.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.pink,
                                          fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 15,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 15,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
