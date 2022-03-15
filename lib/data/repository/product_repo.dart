import 'package:future/data/api/api_client.dart';
import 'package:future/utils/constants.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async {
    return await apiClient.get(Constants.GET_PRODUCT_LIST);
  }
}
