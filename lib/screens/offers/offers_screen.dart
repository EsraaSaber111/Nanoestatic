import 'package:flutter/material.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/localization/language_constants.dart';

import 'components/body.dart';
class OfferScreen extends StatelessWidget {
  static String routeName = "/offer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getTranslated(context, 'offers')),
      ),
      body: Body(),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      drawer: Drawer(
        child: drawer(),
      ),
    );
  }
}