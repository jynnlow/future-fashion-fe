import 'package:flutter/material.dart';
import 'package:future/pages/profile/widget/profile_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
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
          ],
        ));
  }
}
