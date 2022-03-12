import 'package:future/data/repository/order_repo.dart';
import 'package:future/models/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  final List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;

  Future<void> getOrderList() async {
    Response response = await orderRepo.getOrderList();
    if (response.body['status'] == 'FAIL') {
      return;
    }
    if (response.body['details']['orders'].isNotEmpty) {
      List<OrderModel> orders = Order.fromJson(response.body['details']).orders;
      _orderList.clear();
      _orderList.addAll(orders);
      update();
    }
  }
}
