import 'package:flutter/material.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:get/get.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(builder: (favourite) {
      var favouriteList = favourite.favouriteList;
      return Stack(
        children: [
          favouriteList.length > 0
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  height: 1000,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: favouriteList.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 2),
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
                                  child: Image.asset(
                                    favouriteList[index].picture!.first,
                                    width: 80,
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
                                    Text(
                                      "Stock:" +
                                          favouriteList[index].stock.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      "RM " +
                                          favouriteList[index].price.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.pink),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
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
                )
              : Container(),
        ],
      );
    });
  }
}
