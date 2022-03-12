import 'package:future/models/cart_model.dart';
import 'package:future/models/product_model.dart';

class Order {
  late List<OrderModel> _orders;
  List<OrderModel> get orders => _orders;

  Order({required orders}) {
    _orders = orders;
  }

  Order.fromJson(Map<String, dynamic> json) {
    _orders = <OrderModel>[];
    json['orders'].forEach((v) {
      _orders.add(OrderModel.fromJson(v));
    });
  }
}

class OrderModel {
  int? id;
  num? total;
  String? status;
  List<CartModel>? snapshots = [];

  OrderModel({this.id, this.total, this.status, this.snapshots});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    status = json['status'];
    if (json['snapshots'] != '') {
      for (var item in json['snapshots']) {
        snapshots!.add(CartModel.fromJson(item));
      }
    }
  }
}
