import 'package:flutter/material.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:future/pages/favourite/widget/favourite_list.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FavouriteController>(
        builder: (favouriteController) {
          var favouriteList = favouriteController.favouriteList;
          return favouriteList.isNotEmpty
              ? SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        FavouriteList(),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ImageIcon(
                            AssetImage("assets/icons/broken-heart.png"),
                            color: Colors.pink,
                            size: 50,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: const Text(
                              "There's no item in your favourite list.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: Colors.pink,
        // centerTitle: false,
        title: const Text(
          "Favourite List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
