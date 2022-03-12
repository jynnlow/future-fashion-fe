import 'package:flutter/material.dart';
import 'package:future/controllers/favourite_controller.dart';
import 'package:future/pages/favourite/widget/favourite_list.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
            size: 15,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        backgroundColor: Colors.pink,
        // centerTitle: false,
        title: const Text(
          "Favourite List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
