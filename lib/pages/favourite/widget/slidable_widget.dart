import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:get/get.dart';

class SlidableWidget extends StatelessWidget {
  final Widget child;
  final int index;

  const SlidableWidget({Key? key, required this.child, required this.index})
      : super(key: key);

  onTap() {
    print("delete");
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: child,
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          flex: 1,
          onPressed: (context) {
            Get.find<FavouriteController>().removeItemFromFavouriteList(index);
            // print(index);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Remove',
        ),
      ]),
    );
  }
}
