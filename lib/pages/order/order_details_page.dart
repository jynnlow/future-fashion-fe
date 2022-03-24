import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:future/models/cart_model.dart';
import 'package:future/pages/detail/detail.dart';
import 'package:future/pages/order/order_page.dart';

class OrderDetailsPage extends StatelessWidget {
  final List<CartModel> orderList;
  const OrderDetailsPage({Key? key, required this.orderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: orderList.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 10, bottom: 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 120,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        clothes: orderList[index].product!)));
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(5),
                                child: Image.memory(
                                  base64Decode(orderList[index]
                                      .product!
                                      .pictures!
                                      .first
                                      .split('data:image/png;base64,')[1]),
                                  gaplessPlayback: true,
                                ),
                                // decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         fit: BoxFit.fitHeight,
                                //         image: AssetImage(orderList[index]
                                //             .product!
                                //             .pictures!
                                //             .first)),
                                //     borderRadius: BorderRadius.circular(20),
                                //     color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    orderList[index].item.toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Size: " +
                                              orderList[index]
                                                  .sizing
                                                  .toString(),
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Quantity: " +
                                              orderList[index]
                                                  .quantity
                                                  .toString(),
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'RM ',
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        orderList[index].price!.toString(),
                                        style: const TextStyle(
                                          color: Colors.pink,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ' /  item ',
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const OrderPage()));
          },
        ),
        backgroundColor: Colors.pink,
        // centerTitle: false,
        title: const Text(
          "Order Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
