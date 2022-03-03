import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/data/api/api_client.dart';
import 'package:future/data/repository/cart_repo.dart';
import 'package:future/data/repository/product_repo.dart';
import 'package:future/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(baseUrl: Constants.BASE_URL));
  //repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  //controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
