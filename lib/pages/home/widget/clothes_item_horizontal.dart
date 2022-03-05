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
                  margin: const EdgeInsets.all(8),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(clothes.picture!.first),
                        fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 10,
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
            Text(
              clothes.item!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, height: 1.5, fontSize: 17),
            ),
            Text(
              "RM " + clothes.price.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold, height: 1.5, color: Colors.pink),
            ),
          ],
        ),
      ),
    ));
  }
}
