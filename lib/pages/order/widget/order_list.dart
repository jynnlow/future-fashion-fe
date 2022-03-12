import 'package:flutter/material.dart';
import 'package:future/controllers/order_controller.dart';
import 'package:future/pages/order/order_details_page.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      var orderList = orderController.orderList;
      return Stack(
        children: [
          orderList.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 1000,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: orderList.length,
                    itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: GestureDetector(
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OrderDetailsPage(
                                  orderList: orderList[index].snapshots!)));
                        }),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ID: #000000" +
                                            orderList[index].id.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        "Status: " +
                                            orderList[index].status.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            color: Colors.pink),
                                      ),
                                      Text(
                                        "Total Amount: RM" +
                                            orderList[index].total.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            color: Colors.grey),
                                      ),
                                      Text(
                                        "Total Item: " +
                                            orderList[index]
                                                .snapshots!
                                                .length
                                                .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(
                  child: Text("no item"),
                ),
        ],
      );
    });
  }
}
