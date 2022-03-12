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
              orderList.isNotEmpty
                  ? Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: orderList.length,
                          itemBuilder: ((context, index) {
                            return Card(
                                margin: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  height: 100,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailPage(
                                                          clothes:
                                                              orderList[index]
                                                                  .product!)));
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fitHeight,
                                                  image: AssetImage(
                                                      orderList[index]
                                                          .product!
                                                          .pictures!
                                                          .first)),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            const SizedBox(
                                              height: 1,
                                            ),
                                            Text(
                                              orderList[index].item.toString(),
                                              style: const TextStyle(
                                                  color: Colors.pink,
                                                  fontSize: 18),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Size: " +
                                                      orderList[index]
                                                          .sizing
                                                          .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "Quantity: " +
                                                      orderList[index]
                                                          .quantity
                                                          .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 1,
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ));
                          })))
                  : Container(
                      child: Text("Order List is empty"),
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
