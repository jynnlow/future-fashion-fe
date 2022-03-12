import 'dart:convert';

import 'package:future/models/product_model.dart';

class CartModel {
  String? id;
  String? item;
  num? price;
  String? sizing;
  int? quantity;
  bool? isExist;
  String? createdTime;
  ProductModel? product;

  CartModel({
    this.id,
    this.item,
    this.price,
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
    sizing = json['sizing'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    createdTime = json['createdTime'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = new Map<String, dynamic>();
    jsonMap["id"] = id;
    jsonMap["item"] = item;
    jsonMap["price"] = price;
    jsonMap["sizing"] = sizing;
    jsonMap["quantity"] = quantity;
    jsonMap["isExist"] = isExist;
    jsonMap["createdTime"] = createdTime;
    jsonMap["product"] = product!.toJson();

    return jsonMap;
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
