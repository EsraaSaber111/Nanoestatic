import 'package:flutter/material.dart';
import 'package:nanoestatic/components/coustom_bottom_nav_bar.dart';
import 'package:nanoestatic/models/login.dart';
import '../../enums.dart';
import 'components/EditBody.dart';
class UpdateProfileScreen extends StatelessWidget {
  static String routeName = "/updateprofile";
  Login login;
  UpdateProfileScreen(this.login);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
     body: EditBody(login),
    // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
