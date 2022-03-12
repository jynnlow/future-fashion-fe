import 'package:flutter/material.dart';
import 'package:future/pages/favourite/widget/favourite_app_bar.dart';
import 'package:future/pages/favourite/widget/favourite_list.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/pages/home/main_clothes_page.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              FavouriteList(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        backgroundColor: Colors.pink,
        // centerTitle: false,
        title: const Text(
          "Favourite List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    ;
  }
}
