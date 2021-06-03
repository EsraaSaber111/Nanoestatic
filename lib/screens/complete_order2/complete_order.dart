import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteOrder2 extends StatelessWidget {
  static String routeName = "/complete2";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply Course"),
      ),
      body: Body(),
    );
  }
}
