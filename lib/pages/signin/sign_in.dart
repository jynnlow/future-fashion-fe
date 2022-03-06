import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future/pages/signup/sign_up.dart';
import 'package:future/pages/signup/widget/text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              height: 80,
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                  Text(
                    "Sign in your account",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
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
                  borderRadius: BorderRadius.circular(30), color: Colors.pink),
              child: const Center(
                child: Text(
                  "Sign In",
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
                text: "Don\'t have an account? ",
                style: TextStyle(color: Colors.grey[500], fontSize: 15),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignUpPage()));
                      }),
                    text: "Create",
                    style: const TextStyle(
                        color: Colors.pink,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
