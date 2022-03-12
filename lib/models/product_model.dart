import 'dart:convert';

class Product {
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({required products}) {
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _products = <ProductModel>[];
    json['products'].forEach((v) {
      _products.add(ProductModel.fromJson(v));
    });
  }
}

class ProductModel {
  int? id;
  String? item;
  num? price;
  int? stock;
  List<String>? pictures;
  Sizing? xs;
  Sizing? s;
  Sizing? m;
  Sizing? l;
  Sizing? xl;

  ProductModel(
      {this.id,
      this.item,
      this.price,
      this.stock,
      this.pictures,
      this.xs,
      this.s,
      this.m,
      this.l,
      this.xl});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    price = json['price'];
    stock = json['stock'];
    pictures =
        json['pictures'] != null ? List<String>.from(json['pictures']) : [];
    xs = json['xs'] != null ? Sizing(json['xs']) : null;
    s = json['s'] != null ? Sizing(json['s']) : null;
    m = json['m'] != null ? Sizing(json['m']) : null;
    l = json['l'] != null ? Sizing(json['l']) : null;
    xl = json['xl'] != null ? Sizing(json['xl']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {};

    jsonMap["id"] = id;
    jsonMap["item"] = item;
    jsonMap["price"] = price;
    jsonMap["pictures"] = jsonEncode(pictures);
    jsonMap["stock"] = stock;
    if (xs != null) {
      jsonMap['xs'] = jsonEncode(xs!.toJson());
    }
    if (s != null) {
      jsonMap['s'] = jsonEncode(s!.toJson());
    }
    if (m != null) {
      jsonMap['m'] = jsonEncode(m!.toJson());
    }
    if (l != null) {
      jsonMap['l'] = jsonEncode(l!.toJson());
    }
    if (xl != null) {
      jsonMap['xl'] = jsonEncode(xl!.toJson());
    }
    return jsonMap;
  }
}

class Sizing {
  num? chest;
  num? waist;
  num? hip;

  Sizing(Map<String, dynamic> sizingData) {
    chest = sizingData['chest'];
    waist = sizingData['waist'];
    hip = sizingData['hip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonMap = {};
    jsonMap['chest'] = chest;
    jsonMap['waist'] = waist;
    jsonMap['hip'] = hip;
    return jsonMap;
  }
}
