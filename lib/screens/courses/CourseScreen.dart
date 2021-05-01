import 'package:flutter/material.dart';
import 'package:shop_app/components/drawer.dart';

import 'components/body.dart';
class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mesoestatic Academy'),),
      body: Body(),
      drawer: Drawer(
        child: drawer(),
      ),
    );
  }
}
