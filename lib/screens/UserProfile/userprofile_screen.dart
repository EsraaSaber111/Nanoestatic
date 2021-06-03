import 'package:flutter/material.dart';
import 'package:shop_app/screens/UserProfile/components/ProfileBody.dart';



class UserProfileScreen extends StatelessWidget {
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
