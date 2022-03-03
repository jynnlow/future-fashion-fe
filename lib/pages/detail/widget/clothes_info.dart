import 'package:flutter/material.dart';
import 'package:future/models/product_model.dart';

class ClothesInfo extends StatelessWidget {
  final ProductModel clothes;
  const ClothesInfo({Key? key, required this.clothes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${clothes.item}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 15,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Row(
            children: const [
              Icon(
                Icons.star_border,
                color: Color.fromARGB(255, 227, 204, 1),
              ),
              Text(
                '4.5(2.7k)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
