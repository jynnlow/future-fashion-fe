import 'dart:convert';

import 'package:future/data/api/api_client.dart';
import 'package:future/models/ar_model.dart';
import 'package:future/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepo extends GetxService {
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;

  ProductRepo({required this.apiClient, required this.sharedPreferences});

  String model = '';

  Future<Response> getProductList() async {
    return await apiClient.get(Constants.GET_PRODUCT_LIST);
  }

  setARConfig(int productID) {
    sharedPreferences.setInt('ARProductID', productID);
  }

  getARConfig() {
    var productID = sharedPreferences.getInt('ARProductID');
  }
}
