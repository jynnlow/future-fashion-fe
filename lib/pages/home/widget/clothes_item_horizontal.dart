import 'package:flutter/material.dart';
import 'package:future/pages/detail/detail.dart';
import 'package:future/models/product_model.dart';

class ClothesItemHorizontal extends StatelessWidget {
  final ProductModel clothes;

  const ClothesItemHorizontal({Key? key, required this.clothes})
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 0,
                    left: 8,
                    right: 8,
                    top: 5,
                  ),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(clothes.pictures!.first),
                        fit: BoxFit.fitHeight),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: 180,
                  child: Text(
                    clothes.item!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "RM ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.pink),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        clothes.price.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                            fontSize: 19),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
