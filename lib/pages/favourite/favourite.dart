import 'package:flutter/material.dart';
import 'package:future/pages/favourite/widget/favourite_app_bar.dart';
import 'package:future/pages/favourite/widget/favourite_list.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FavouriteAppBar(),
              // FavouriteList(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
