import 'package:flutter/material.dart';
import 'package:future/models/product_model.dart';

class AddCart extends StatelessWidget {
  final ProductModel clothes;

  const AddCart({Key? key, required this.clothes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Container(
      padding: const EdgeInsets.only(top: 5, right: 25, left: 25),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Price',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              'RM ${clothes.price}',
              style: const TextStyle(
                  height: 1.5, fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Container(
            height: 55,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                    primary: Colors.pink),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                )),
          ),
        )
      ]),
    );
  }
}
