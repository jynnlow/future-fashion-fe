import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  IconData icon;
  String text;

  PersonalInfo({Key? key, required this.icon, required this.text})
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
            child: Icon(
              icon,
              color: Colors.pink,
              size: 30,
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
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
