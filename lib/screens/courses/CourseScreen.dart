import 'package:flutter/material.dart';
import 'package:nanoestatic/components/drawer.dart';
import 'package:nanoestatic/localization/language_constants.dart';

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
