import 'dart:async';

import 'package:flutter/material.dart';
import 'package:future/controllers/product_controller.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  Future<void> _loadResource() async {
    await Get.find<ProductController>().getProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/logo/spec-logo.png",
                width: 90,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Future Fashion",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
