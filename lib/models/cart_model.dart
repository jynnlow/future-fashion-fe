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
    final Map<String, dynamic> jsonMap = {};
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
