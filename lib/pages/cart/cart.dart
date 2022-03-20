import 'package:flutter/material.dart';
import 'package:future/base/show_custom_snack_bar.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/order_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/models/order_model.dart';
import 'package:future/pages/order/order_page.dart';
import 'package:future/pages/signin/sign_in.dart';
import 'package:get/get.dart';

import 'widget/cart_app_bar.dart';
import 'widget/cart_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _checkOut() {
      var orderController = Get.find<OrderController>();
      var cartController = Get.find<CartController>();
      var cartList = Get.find<CartController>().getCartList;
      var total = Get.find<CartController>().totalAmount;
      OrderModel orderReq = OrderModel(total: total, snapshots: cartList);
      orderController.createOrder(orderReq).then((status) {
        if (status.isSuccess) {
          showCustomSnackBar("Checkout successfully");
          cartController.clearCart();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => (OrderPage())));
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }

    return GetBuilder<CartController>(builder: (cartController) {
      var cartList = cartController.getCartList;
      return Scaffold(
          body: cartList.isNotEmpty
              ? Stack(
                  children: const [
                    CartList(),
                  ],
                )
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ImageIcon(
                            AssetImage("assets/icons/empty-cart.png"),
                            color: Colors.pink,
                            size: 50,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: const Text(
                              "There's no item in your cart.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          appBar: AppBar(
            backgroundColor: Colors.pink,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 15,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              "Your Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            margin: const EdgeInsets.only(bottom: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyle(
                          height: 1,
                          fontSize: 20,
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'RM',
                        style: TextStyle(
                          height: 1,
                          fontSize: 23,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        cartController.totalAmount.toString(),
                        style: const TextStyle(
                          height: 1,
                          fontSize: 23,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.pink),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            if (Get.find<UserController>()
                                .checkIfUserLoggedIn())
                              {_checkOut()}
                            else
                              {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => (const SignInPage()),
                                  ),
                                ),
                              }
                          },
                          child: const Text(
                            'Checkout',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
