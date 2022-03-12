import 'package:future/data/repository/order_repo.dart';
import 'package:future/models/cart_model.dart';
import 'package:future/models/order_model.dart';
import 'package:future/models/response_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  final List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;

  final List<CartModel> _orderCartList = [];
  List<CartModel> get orderCartLit => _orderCartList;

  Future<void> getOrderList() async {
    Response response = await orderRepo.getOrderList();
    if (response.body['status'] == 'FAIL') {
      return;
    }
    if (response.body['details']['orders'].isNotEmpty) {
      List<OrderModel> orders = Order.fromJson(response.body['details']).orders;
      _orderList.clear();
      _orderCartList.clear();
      _orderList.addAll(orders);
      update();
    }
  }

  Future<ResponseModel> createOrder(OrderModel orderReq) async {
    late ResponseModel responseModel;
    Response response = await orderRepo.createOrder(orderReq);
    if (response.body['status'] == 'FAIL') {
      responseModel = ResponseModel(false, response.body['message']);
    } else {
      responseModel = ResponseModel(true, response.body['message']);
    }
    update();
    return responseModel;
  }
}
