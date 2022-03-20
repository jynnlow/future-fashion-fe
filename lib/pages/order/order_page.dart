import 'package:flutter/material.dart';
import 'package:future/controllers/order_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/pages/order/widget/order_list.dart';
import 'package:future/pages/signin/sign_in.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<OrderController>().getOrderList();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 15,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
          backgroundColor: Colors.pink,
          // centerTitle: false,
          title: const Text(
            "Order",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GetBuilder<UserController>(
          builder: (userController) {
            return Get.find<UserController>().checkIfUserLoggedIn()
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          OrderList(),
                        ],
                      ),
                    ),
                  )
                : Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: const Text(
                                "Please log in to view your order.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => (SignInPage())));
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                padding: const EdgeInsets.all(10),
                                child: const Center(
                                    child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )),
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          },
        ));
  }
}
