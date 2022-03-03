import 'dart:convert';

class Product {
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({required products}) {
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    if (json['details'] != null) {
      _products = <ProductModel>[];
      json['details'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? item;
  int? price;
  int? stock;
  List<String>? picture;
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
      this.picture,
      this.xs,
      this.s,
      this.m,
      this.l,
      this.xl});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    item = json['item'];
    price = json['price'];
    stock = json['stock'];
    if (json['picture'] != '') {
      var jsonData = jsonDecode(json['picture']);
      picture = <String>[];
      for (var i = 0; i < jsonData.length; i++) {
        picture!.add(jsonData[i]);
      }
    } else {
      picture = null;
    }
    xs = json['xs'] != null ? Sizing.fromJson(json['xs']) : null;
    s = json['s'] != null ? Sizing.fromJson(json['s']) : null;
    m = json['m'] != null ? Sizing.fromJson(json['m']) : null;
    l = json['l'] != null ? Sizing.fromJson(json['l']) : null;
    xl = json['xl'] != null ? Sizing.fromJson(json['xl']) : null;
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
