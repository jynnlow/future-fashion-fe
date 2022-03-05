import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future/pages/signup/widget/text_field.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    var usernameController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                child: Center(
                  child: Image.asset(
                    "assets/logo/spec-logo.png",
                    width: 90,
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   "Sign Up",
              //   style: TextStyle(
              //     color: Colors.pink.withOpacity(0.5),
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              const SizedBox(
                height: 80,
              ),
              SignUpTextField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email,
              ),
              const SizedBox(
                height: 30,
              ),
              SignUpTextField(
                textController: usernameController,
                hintText: "Username",
                icon: Icons.person,
              ),
              const SizedBox(
                height: 30,
              ),
              SignUpTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password,
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.pink),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = (() {}),
                    text: "Already have an account?",
                    style: TextStyle(color: Colors.grey[500])),
              )
            ],
          ),
        ));
  }
}
