import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:future/ar/widget/ar_fitting_room.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class FittingRoomPage extends StatelessWidget {
  String model = "";
  double sizingScale = 0.0;
  num positionAdjustment = 0.0;

  FittingRoomPage({
    Key? key,
    required this.model,
    required this.sizingScale,
    required this.positionAdjustment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.pink,
        // centerTitle: false,
        title: const Text(
          "AR Fitting Room",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ARFittingRoom(
        model: model,
        sizingScale: sizingScale,
        positionAdjustment: positionAdjustment,
      ),
    );
  }
}
