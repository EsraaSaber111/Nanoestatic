import 'package:flutter/material.dart';
import 'components/EditBody.dart';
class UpdateProfileScreen extends StatelessWidget {
  static String routeName = "/updateprofile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
     body: EditBody(),
    //  bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
