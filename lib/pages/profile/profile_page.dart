import 'package:flutter/material.dart';
import 'package:future/base/show_custom_snack_bar.dart';
import 'package:future/controllers/cart_controller.dart';
import 'package:future/controllers/user_controller.dart';
import 'package:future/models/user_model.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:future/pages/profile/widget/body_measurement.dart';
import 'package:future/pages/profile/widget/dialog_text_field.dart';
import 'package:future/pages/profile/widget/personal_info.dart';
import 'package:future/base/check_is_number.dart';

import 'package:future/pages/signin/sign_in.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chestController = TextEditingController();
    var waistController = TextEditingController();
    var hipController = TextEditingController();

    void validation() {
      var userController = Get.find<UserController>();
      String chest = chestController.text.trim();
      String waist = waistController.text.trim();
      String hip = hipController.text.trim();

      num chestInNum = 0;
      num waistInNum = 0;
      num hipInNum = 0;

      if (chest.isNotEmpty) {
        if (isNumber(chest)) {
          chestInNum = double.parse(chest);
        } else {
          showCustomSnackBar("Please insert a valid number", title: "Chest");
        }
      }
      if (waist.isNotEmpty) {
        if (isNumber(waist)) {
          waistInNum = double.parse(waist);
        } else {
          showCustomSnackBar("Please insert a valid number", title: "Waist");
        }
      }
      if (hip.isNotEmpty) {
        if (isNumber(hip)) {
          hipInNum = double.parse(hip);
        } else {
          showCustomSnackBar("Please insert a valid number", title: "Hip");
        }
      }

      UserModel editReq = UserModel(
        username: "",
        password: "",
        chest: chestInNum,
        waist: waistInNum,
        hip: hipInNum,
      );
      userController.editPersonalInfo(editReq).then(
        (status) {
          if (status.isSuccess) {
            showCustomSnackBar("Updated successfully!", title: "Success");
            chestController.clear();
            waistController.clear();
            hipController.clear();
            Navigator.of(context).pop();
          } else {
            showCustomSnackBar(status.message);
          }
        },
      );
    }

    void openDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Edit Body Measurement',
            style: TextStyle(
              color: Colors.pink,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Builder(
              builder: (context) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DialogTextField(
                        text: "chest: ",
                        textController: chestController,
                        icon: "assets/icons/chest.png",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DialogTextField(
                        text: "waist: ",
                        textController: waistController,
                        icon: "assets/icons/waist.png",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DialogTextField(
                        text: "hip: ",
                        textController: hipController,
                        icon: "assets/icons/hip.png",
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: const Text("cancel"),
                    style: TextButton.styleFrom(
                        primary: Colors.pink,
                        side: const BorderSide(color: Colors.pink, width: 0.5)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text("submit"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.pink,
                    ),
                    onPressed: () {
                      validation();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 15,
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => (HomePage()))),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return Get.find<UserController>().checkIfUserLoggedIn()
              ? Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
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
                                    text:
                                        userController.userModel.dob.toString(),
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
                                const SizedBox(height: 15),
                                BodyMeasurement(
                                  icon: "assets/icons/chest.png",
                                  text:
                                      userController.userModel.chest.toString(),
                                  body: "chest",
                                ),
                                BodyMeasurement(
                                  icon: "assets/icons/waist.png",
                                  text:
                                      userController.userModel.waist.toString(),
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
                        GestureDetector(
                          onTap: () {
                            openDialog();
                          },
                          child: Container(
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
                        ),
                      ],
                    ),
                  ))
              : Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: const Text(
                              "Please log in to view your profile.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
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
        },
      ),
    );
  }
}
