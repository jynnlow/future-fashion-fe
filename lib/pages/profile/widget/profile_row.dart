import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  IconData icon;
  String title;
  String text;

  ProfileRow(
      {Key? key, required this.icon, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
      height: 50,
      child: Row(
        children: [
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration:
          //       BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
          //   child: Icon(
          //     icon,
          //     color: Colors.white,
          //     size: 20,
          //   ),
          // ),
          // const SizedBox(
          //   width: 20,
          // ),
          Container(
            width: 100,
            child: Text(
              title + ":",
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}
