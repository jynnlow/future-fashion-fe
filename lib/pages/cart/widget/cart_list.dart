import 'package:flutter/material.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/pages/detail/detail.dart';
import 'package:get/get.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.find<ProductController>().initProduct(Get.find<CartController>());
    return Positioned(
      top: 120,
      left: 20,
      right: 20,
      bottom: 0,
      child: Container(
        child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: GetBuilder<CartController>(builder: (cart) {
              var cartList = cart.getCartList;
              return ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder: ((_, index) {
                    return Container(
                      height: 100,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      clothes: cartList[index].product!)));
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(cart.getCartList[index]
                                          .product!.pictures!.first)),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Container(
                            height: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  cartList[index].item!,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                Text(
                                  "Size: " + cartList[index].sizing!,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'RM ' + cartList[index].price!.toString(),
                                      style: const TextStyle(
                                          color: Colors.pink, fontSize: 18),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cart.addItem(
                                                  cartList[index].product!,
                                                  -1,
                                                  cartList[index].sizing!);
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color:
                                                  Colors.pink.withOpacity(0.5),
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            cartList[index].quantity.toString(),
                                            style: const TextStyle(
                                                height: 1,
                                                fontSize: 18,
                                                color: Colors.pink),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () => {
                                              cart.addItem(
                                                  cartList[index].product!,
                                                  1,
                                                  cartList[index].sizing!)
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color:
                                                  Colors.pink.withOpacity(0.5),
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    );
                  }));
            })),
      ),
    );
  }
}
