import 'package:flutter/material.dart';
import 'package:future/data/repository/favourite_repo.dart';
import 'package:future/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavouriteController extends GetxController {
  final FavouriteRepo favouriteRepo;
  FavouriteController({required this.favouriteRepo});

  List<ProductModel> _favouriteList = [];
  List<ProductModel> get favouriteList => _favouriteList;

  void addItemToFavourite(ProductModel product) {
    if (_favouriteList.isNotEmpty) {
      for (int i = 0; i < _favouriteList.length; i++) {
        if (_favouriteList[i].ID == product.ID) {
          Get.snackbar(
            "Favourite Item",
            "This item has already in your favourite list",
            backgroundColor: Colors.pink,
            colorText: Colors.white,
          );
        } else {
          _favouriteList.add(product);
          Get.snackbar(
            "Favourite Item",
            "This item is added successfully in your favourite list",
            backgroundColor: Colors.pink,
            colorText: Colors.white,
          );
          print(_favouriteList.length);
        }
      }
    } else {
      _favouriteList.add(product);
      Get.snackbar(
        "Favourite Item",
        "This item is added successfully in your favourite list",
        backgroundColor: Colors.pink,
        colorText: Colors.white,
      );
      print(_favouriteList.length);
    }
    favouriteRepo.addToFavouriteList(favouriteList);
  }

  List<ProductModel> getFavouriteList() {
    _favouriteList = favouriteRepo.getFavouriteList();
    print(_favouriteList.length);
    return _favouriteList;
  }

  void initFavourite() {}
}
