import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future/ar_fitting_room.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:future/controllers/order_controller.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/helper/dependencies.dart' as dep;
import 'package:future/pages/splash/splash_page.dart';
import 'package:get/get.dart';

void main() async {
  //to make sure dependencies are loaded correctly and wait until they are loaded
  WidgetsFlutterBinding.ensureInitialized();
  //load dependencies
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartListFromLocalStorage();
    Get.find<FavouriteController>().getFavouriteList();

    print("Restart - User Logged In -> " +
        Get.find<UserController>().checkIfUserLoggedIn().toString());
    if (Get.find<UserController>().checkIfUserLoggedIn()) {
      Get.find<UserController>().getPersonalInfoFromSP();
      Get.find<OrderController>().getOrderList();
    }

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return const GetMaterialApp(
      title: 'Future Fashion App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
