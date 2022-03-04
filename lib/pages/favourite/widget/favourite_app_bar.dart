import 'package:flutter/material.dart';

class FavouriteAppBar extends StatelessWidget {
  const FavouriteAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 25, left: 25, right: 25),
      child: const Text(
        "Favourite List",
        style: TextStyle(
          color: Colors.pink,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
