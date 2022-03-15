import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/data/repository/product_repo.dart';
import 'package:future/models/cart_model.dart';
import 'package:future/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  ProductController({required this.productRepo});

  final List<ProductModel> _clothesList = [];
  List<ProductModel> get clothesList => _clothesList;

  late CartController _cartController;

  int _quantity = 1;
  int get quantity => _quantity;

  String _sizing = 'XS';
  String get sizing => _sizing;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + _quantity;

  Future<void> getProductList() async {
    Response response = await productRepo.getProductList();
    if (response.body['status'] == 'FAIL') {
      return;
    }

    List<ProductModel> products =
        Product.fromJson(response.body['details']).products;
    _clothesList.clear();
    _clothesList.addAll(products);
    update();
  }

  void setSizing(String sizing) {
    _sizing = sizing;
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (_quantity == 20) {
        Get.snackbar(
          "Item count",
          "Not allowed to add more than 20",
          backgroundColor: Colors.pink,
          colorText: Colors.white,
        );
        _quantity = _quantity;
      } else {
        _quantity = _quantity + 1;
      }
    } else if (!isIncrement && _quantity != 1) {
      _quantity = _quantity - 1;
    } else if (!isIncrement && _quantity == 1) {
      _quantity = _quantity;
      Get.snackbar(
        "Item count",
        "You can't reduct anymore!",
        backgroundColor: Colors.pink,
        colorText: Colors.white,
      );
    }
    update();
  }

  void initProduct(CartController cartController) {
    _quantity = 1;
    _inCartItem = 0;
    _sizing = 'XS';
    _cartController = cartController;
  }

  void addItemToCart(ProductModel product) {
    if (_quantity > 0) {
      _cartController.addItem(product, _quantity, _sizing);
      _quantity = 0;
      Get.snackbar(
        "Success",
        "Your item is added to cart succesfully",
        backgroundColor: Colors.pink,
        colorText: Colors.white,
      );
      update();
    } else {
      Get.snackbar(
        "Item count",
        "You should at least add an item to the cart",
        backgroundColor: Colors.pink,
        colorText: Colors.white,
      );
    }
  }

  int get totalItems {
    // update();
    return _cartController.totalItems;
  }

  List<CartModel> get getCartList {
    return _cartController.getCartList;
  }
}
