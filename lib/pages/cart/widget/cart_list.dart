import 'package:flutter/material.dart';
import 'package:future/base/show_custom_snack_bar.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/models/product_model.dart';
import 'package:future/pages/detail/detail.dart';
import 'package:get/get.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showAlertDialog(
        BuildContext context, ProductModel product, String sizing) {
      // set up the buttons
      Widget cancelButton = TextButton(
        child: const Text("Cancel"),
        style: TextButton.styleFrom(
            primary: Colors.pink,
            side: const BorderSide(color: Colors.pink, width: 0.5)),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
      Widget continueButton = TextButton(
        child: const Text("Delete"),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.pink,
        ),
        onPressed: () {
          Get.find<CartController>().removeItemFromCart(product, sizing);
          showCustomSnackBar("Remove successfully!", title: "Success");
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: const Text(
          "Remove Item",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
        content: const Text(
          "Do you want to remove this item from your cart?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cancelButton,
                  continueButton,
                ]),
          )
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Positioned(
      top: 20,
      left: 20,
      right: 20,
      bottom: 20,
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
                          margin: const EdgeInsets.only(bottom: 8),
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
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Size: " + cartList[index].sizing!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                                        cartList[index].price!.toString(),
                                        style: const TextStyle(
                                          color: Colors.pink,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
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
                                            if (cart.checkQuantity(
                                                  cartList[index].product!,
                                                  cartList[index].sizing!,
                                                ) ==
                                                1) {
                                              showAlertDialog(
                                                context,
                                                cartList[index].product!,
                                                cartList[index].sizing!,
                                              );
                                            } else {
                                              cart.addItem(
                                                cartList[index].product!,
                                                -1,
                                                cartList[index].sizing!,
                                              );
                                            }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.pink.withOpacity(0.5),
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
                                          onTap: () {
                                            cart.addItem(
                                              cartList[index].product!,
                                              1,
                                              cartList[index].sizing!,
                                            );
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.pink.withOpacity(0.5),
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
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}
