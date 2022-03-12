import 'dart:convert';

import 'package:future/data/api/api_client.dart';
import 'package:future/data/repository/user_repo.dart';
import 'package:future/models/order_model.dart';
import 'package:future/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  OrderRepo({required this.apiClient, required this.sharedPreferences});

  String getToken() {
    return sharedPreferences.getString(Constants.TOKEN) ?? "None";
  }

  Future<Response> getOrderList() async {
    String token = getToken();
    return await apiClient.getMethodWithToken(Constants.GET_ORDER_LIST, token);
  }

  Future<Response> createOrder(OrderModel orderReq) async {
    String token = getToken();
    return await apiClient.postMethod(
        Constants.CREATE_ORDER, orderReq.toJson(), token);
  }
}
