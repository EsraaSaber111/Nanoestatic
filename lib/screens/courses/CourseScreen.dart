import 'package:flutter/material.dart';
import 'package:shop_app/components/drawer.dart';
import 'package:shop_app/localization/language_constants.dart';

import 'components/body.dart';
class CourseScreen extends StatelessWidget {
  static String routeName = "/courses";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${getTranslated(context, 'Nanoestatic Academy')}'),),
      body: Body(),
      drawer: Drawer(
        child: drawer(),
      ),
    );
  }
}
