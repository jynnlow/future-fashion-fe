import 'package:flutter/material.dart';

class DialogTextField extends StatelessWidget {
  final TextEditingController textController;
  final String icon;
  final String text;

  const DialogTextField(
      {Key? key,
      required this.text,
      required this.textController,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: ImageIcon(
                AssetImage(icon),
                color: Colors.pink,
                size: 28,
              ),
            ),
            Container(
              width: 55,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 160,
          height: 40,
          child: TextField(
            controller: textController,
            autofocus: true,
            cursorColor: Colors.pink,
            decoration: InputDecoration(
              hintText: "in cm",
              hintStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black26,
                fontWeight: FontWeight.bold,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 0.5, color: Colors.pink.withOpacity(0.6)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 0.5, color: Colors.pink.withOpacity(0.6)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
