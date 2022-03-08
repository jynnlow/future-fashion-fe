import 'package:flutter/material.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/pages/profile/widget/profile_row.dart';
import 'package:future/pages/signin/sign_in.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => (HomePage()))),
          ),
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.pink, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Personal Info",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              //username
              ProfileRow(
                icon: Icons.person,
                title: "Username",
                text: "Jynn Low",
              ),
              const SizedBox(
                height: 20,
              ),
              //dob
              ProfileRow(
                icon: Icons.card_giftcard,
                title: "DOB",
                text: "03-02-1999",
              ),
              const SizedBox(
                height: 20,
              ),
              //dob
              GestureDetector(
                onTap: () {
                  if (userController.userLoggedIn()) {
                    userController.loggout();
                    Get.find<CartController>().clearCart();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => (SignInPage())));
                  }
                },
                child: ProfileRow(
                  icon: Icons.logout,
                  title: "Logout",
                  text: "Logout",
                ),
              ),
              GestureDetector(
                onTap: (() {
                  Get.find<UserController>().getPersonalInfo();
                }),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
                  child: Icon(
                    Icons.abc,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          );
        }));
  }
}
