import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future/base/show_custom_snack_bar.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/models/user_model.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/pages/signup/sign_up.dart';
import 'package:future/pages/signup/widget/text_field.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();

    void _signin() {
      var userController = Get.find<UserController>();
      var cartController =
          Get.find<CartController>().getCartListFromLocalStorage();
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();

      if (username.isEmpty) {
        showCustomSnackBar("Please fill in your username", title: "Username");
      } else if (password.isEmpty) {
        showCustomSnackBar("Please fill in your password", title: "Password");
      } else {
        UserModel signinReq = UserModel(username: username, password: password);
        userController.signin(signinReq).then(
          (status) {
            if (status.isSuccess) {
              showCustomSnackBar("Sign In successfully!", title: "Success");
              usernameController.clear();
              passwordController.clear();
              print(cartController.length);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => (HomePage())));
            } else {
              showCustomSnackBar(status.message);
            }
          },
        );
      }
    }

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
              isObscure: true,
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: (() {
                _signin();
              }),
              child: Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.pink),
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
