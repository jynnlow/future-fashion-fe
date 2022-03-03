import 'dart:convert';

import 'package:future/models/product_model.dart';

class CartModel {
  int? id;
  String? item;
  int? price;
  List<String>? picture;
  String? sizing;
  int? quantity;
  bool? isExist;
  String? createdTime;
  ProductModel? product;

  CartModel({
    this.id,
    this.item,
    this.price,
    this.picture,
    this.sizing,
    this.quantity,
    this.isExist,
    this.createdTime,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    price = json['price'];
    if (json['picture'] != '') {
      var jsonData = jsonDecode(json['picture']);
      picture = <String>[];
      for (var i = 0; i < jsonData.length; i++) {
        picture!.add(jsonData[i]);
      }
    } else {
      picture = null;
    }
    sizing = json['sizing'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    createdTime = json['creatTime'];
    product = ProductModel.fromJson(json[product]);
  }
}

class Sizing {
  int? chest;
  int? waist;
  int? hip;

  Sizing({this.chest, this.waist, this.hip});

  Sizing.fromJson(String sizingData) {
    if (sizingData.isNotEmpty) {
      var sizing = jsonDecode(sizingData);

      chest = sizing['chest'];
      waist = sizing['waist'];
      hip = sizing['hip'];
    }
  }
}
