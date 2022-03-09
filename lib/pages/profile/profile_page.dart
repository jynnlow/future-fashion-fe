import 'package:flutter/material.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/pages/profile/widget/body_measurement.dart';
import 'package:future/pages/profile/widget/personal_info.dart';
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
          return Get.find<UserController>().checkIfUserLoggedIn()
              ? Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "account".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                PersonalInfo(
                                  icon: Icons.person,
                                  text: userController.userModel.username
                                      .toString(),
                                ),
                                PersonalInfo(
                                  icon: Icons.cake,
                                  text: userController.userModel.dob.toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  "body measurement".toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              BodyMeasurement(
                                icon: "assets/icons/chest.png",
                                text: userController.userModel.chest.toString(),
                                body: "chest",
                              ),
                              BodyMeasurement(
                                icon: "assets/icons/waist.png",
                                text: userController.userModel.waist.toString(),
                                body: "waist",
                              ),
                              BodyMeasurement(
                                icon: "assets/icons/hip.png",
                                text: userController.userModel.hip.toString(),
                                body: "hip",
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 300,
                              padding: const EdgeInsets.all(10),
                              child: const Center(
                                  child: Text(
                                "Edit Body Measurement",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.find<UserController>().loggout();
                                print("User has logged out");
                              },
                              child: Container(
                                width: 300,
                                padding: const EdgeInsets.all(10),
                                child: const Center(
                                    child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                      color: Colors.pink, fontSize: 15),
                                )),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.pink,
                                      width: 0.5,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Text("Please log in to view your profile."),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => (SignInPage())));
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              child: const Center(
                                  child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
        }));
  }
}
