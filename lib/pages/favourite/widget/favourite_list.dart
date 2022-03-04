import 'package:flutter/material.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(builder: (favourite) {
      var favouriteList = favourite.getFavouriteList;
      return Container(
        height: 200,
        // child: ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   scrollDirection: Axis.vertical,
        //   itemCount: favouriteList
        //       ? 0
        //       : products.clothesList.length ~/ 2,
        //   itemBuilder: (context, index) => ClothesItemVertical(
        //     clothes: products.clothesList[index + 1],
        //   ),
        // ),
      );
    });
  }
}
