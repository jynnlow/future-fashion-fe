import 'package:flutter/material.dart';
import 'package:future/pages/home/widget/home_app_bar.dart';
import 'package:future/pages/home/widget/popular.dart';
import 'package:future/pages/home/widget/new_arrival.dart';
import 'package:future/pages/home/widget/search_input.dart';

class MainClothesPage extends StatelessWidget {
  const MainClothesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SearchInput(),
              NewArrival(),
              const BestSell(),
            ],
          ),
        ),
      ),
    );
  }
}
