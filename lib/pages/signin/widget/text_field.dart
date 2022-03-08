import 'package:flutter/material.dart';

class SignInTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;

  SignInTextField(
      {Key? key,
      required this.textController,
      required this.hintText,
      required this.icon,
      this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        autofocus: true,
        controller: textController,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.pink,
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
        cursorColor: Colors.pink,
      ),
    );
  }
}
