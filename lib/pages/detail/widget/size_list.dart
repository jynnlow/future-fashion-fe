import 'package:flutter/material.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SizeList extends StatefulWidget {
  const SizeList({Key? key}) : super(key: key);

  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  final List<String> sizeList = ['XS', 'S', 'M', 'L', 'XL'];
  var currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 73,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: GetBuilder<ProductController>(
          builder: (products) {
            return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentSelected = index;
                        });
                        products.setSizing(index);

                        // products.setARModel(clothes.id);
                        print(products.sizing);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: currentSelected == index
                                ? Colors.pink.withOpacity(0.2)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.1), width: 2)),
                        child: Text(
                          sizeList[index],
                          style: TextStyle(
                              color: currentSelected == index
                                  ? Colors.pink
                                  : Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: sizeList.length);
          },
        ));
  }
}
