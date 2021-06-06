import 'package:flutter/material.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/screens/UserProfile/components/ProfileBody.dart';

class UserProfileScreen extends StatelessWidget {
// User user;
// UserProfileScreen(this.user)
  static String routeName = "/userprofile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: ProfileBody(),
    //  bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
