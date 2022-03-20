import 'dart:convert';

import 'package:future/models/product_model.dart';
import 'package:future/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteRepo {
  final SharedPreferences sharedPreferences;
  FavouriteRepo({required this.sharedPreferences});

  /*
    This method is to convert productModel to string in order to store it in the shared preference 
    Product Model --> Json (Using toJson)
  */
  void addToFavouriteList(List<ProductModel> favouriteList) {
    List<String> favouriteListJson = [];

    favouriteListJson.clear();
    favouriteList.forEach((element) {
      return favouriteListJson.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(
        Constants.FAVOURITE_LIST, favouriteListJson);
    getFavouriteList();
  }

  List<ProductModel> getFavouriteList() {
    List<String> favouriteListJson = [];
    List<ProductModel> favouriteListObject = [];
    // sharedPreferences.clear();
    if (sharedPreferences.containsKey(Constants.FAVOURITE_LIST)) {
      favouriteListJson =
          sharedPreferences.getStringList(Constants.FAVOURITE_LIST)!;
    }
    favouriteListJson.forEach((element) {
      favouriteListObject.add(ProductModel.fromJson(jsonDecode(element)));
    });
    return favouriteListObject;
  }
}
