import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future/base/show_custom_snack_bar.dart';
import 'package:future/models/user_model.dart';
import 'package:future/pages/signin/sign_in.dart';
import 'package:future/pages/signup/widget/text_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var dobController = TextEditingController();

    void _registration() {
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();
      String dob = dobController.text.trim();

      if (username.isEmpty) {
        showCustomSnackBar("Please fill in your username", title: "Username");
      } else if (dob.isEmpty) {
        showCustomSnackBar("Please fill in your date of birth", title: "DOB");
      } else if (password.isEmpty) {
        showCustomSnackBar("Please fill in your password", title: "Password");
      } else if (confirmPassword.isEmpty) {
        showCustomSnackBar("Please fill in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less than 6 characters",
            title: "Password");
      } else if (password != confirmPassword) {
        showCustomSnackBar("Failed to confirm password.", title: "Password");
      } else {
        showCustomSnackBar("All went well", title: "Perfect");
        UserModel signupReq =
            UserModel(username: username, password: password, dob: dob);
        print(signupReq.username);
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
              height: 10,
            ),
            const SizedBox(
              height: 80,
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
              textController: dobController,
              hintText: "Date of birth",
              icon: Icons.date_range,
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
              height: 30,
            ),
            SignUpTextField(
              textController: confirmPasswordController,
              hintText: "Confirm your password",
              icon: Icons.password,
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: (() {
                _registration();
              }),
              child: Container(
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
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = (() {}),
                text: "Already have an account? ",
                style: TextStyle(color: Colors.grey[500]),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                      }),
                    text: "Sign Up",
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
