import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';

import '../../UserProfile/expansion.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Full Name",
            sub: "Mohamed Ahmed",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Email",
            sub: "DRAhmed@gmail.com",
            icon: "assets/icons/Mail.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Password",
            sub: "*********",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Phone",
            sub: "0102020220",
            icon: "assets/icons/Phone.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Address",
            sub: "4 Heloioples street",
            icon: "assets/icons/Location point.svg",
            press: () {},
          ),
         // ExPanal(courses),
        ],
      ),
    );
  }
}
