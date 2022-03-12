import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:future/controllers/order_controller.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/data/api/api_client.dart';
import 'package:future/data/repository/cart_repo.dart';
import 'package:future/data/repository/favourite_repo.dart';
import 'package:future/data/repository/order_repo.dart';
import 'package:future/data/repository/product_repo.dart';
import 'package:future/data/repository/user_repo.dart';
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
  Get.lazyPut(() => FavouriteRepo(sharedPreferences: Get.find()));
  Get.lazyPut(
      () => UserRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => OrderRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => FavouriteController(favouriteRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
}
