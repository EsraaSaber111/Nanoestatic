import 'package:flutter/material.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/localization/language_constants.dart';

import 'components/body.dart';
class WishListScreen extends StatelessWidget {
  static String routeName = "/wishlist";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getTranslated(context, 'wishlist')),
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      drawer: Drawer(
        child: drawer(),
      ),
    );
  }
}