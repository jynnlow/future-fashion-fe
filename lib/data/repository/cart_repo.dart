import 'dart:convert';

import 'package:future/models/cart_model.dart';
import 'package:future/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  /*
  This repo is to retrieve and save data from and to the local storage - shared preference in phone.
  Shared preference only accept string - need to convert model to string before storing and convert back if get data from it
  */
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  /*
    This method is to convert cartModel to string in order to store it in the shared preference 
    Cart Model --> Json (Using toJson)
  */
  void addToCartList(List<CartModel> cartList) {
    cart.clear();
    cartList.forEach((element) {
      //this method will try to find the toJson method from the cart model - convert it into string
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(Constants.CART_LIST, cart);
    getCartList();
  }

  /*
    This method works in opposite way which converting string (data from shared preference) to cartModel list
    Json --> Cart Model (Using fromJson)
   */
  List<CartModel> getCartList() {
    List<CartModel> cartList = [];
    List<String> jsonData = [];
    // sharedPreferences.clear();
    if (sharedPreferences.containsKey(Constants.CART_LIST)) {
      jsonData = sharedPreferences.getStringList(Constants.CART_LIST)!;
    }
    jsonData.forEach((element) {
      //convert string element(cartFromSP) to map(jsonDecode) and add to object list(cartList)
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }
}
