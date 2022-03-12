import 'package:flutter/material.dart';
import 'package:future/models/product_model.dart';
import 'package:future/pages/detail/detail.dart';

class ClothesItemVertical extends StatelessWidget {
  final ProductModel clothes;
  const ClothesItemVertical({Key? key, required this.clothes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPage(clothes: clothes)));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          clothes.pictures!.first,
                          width: 80,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            clothes.item!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontSize: 15),
                          ),
                          Text(
                            "Stock:" + clothes.stock.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                color: Colors.grey),
                          ),
                          Text(
                            "RM " + clothes.price.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                color: Colors.pink),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
