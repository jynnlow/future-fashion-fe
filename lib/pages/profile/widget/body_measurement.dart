import 'package:flutter/material.dart';

class BodyMeasurement extends StatelessWidget {
  String icon;
  String text;
  String body;

  BodyMeasurement(
      {Key? key, required this.icon, required this.text, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Container(
            width: 50,
            margin: const EdgeInsets.only(left: 30, right: 40),
            child: ImageIcon(
              AssetImage(icon),
              color: Colors.pink,
              size: 28,
            ),
          ),
          Container(
            width: 100,
            child: Text(
              body + ":",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: const Text(
              "cm",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
