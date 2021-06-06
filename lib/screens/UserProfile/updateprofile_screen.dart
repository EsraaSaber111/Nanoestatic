import 'package:flutter/material.dart';
import 'package:shop_app/models/login.dart';
import 'components/EditBody.dart';
class UpdateProfileScreen extends StatelessWidget {
  static String routeName = "/updateprofile";
  // User user;
  // UpdateProfileScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
   //  body: EditBody(user),
    //  bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
