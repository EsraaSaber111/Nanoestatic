import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteOrder extends StatelessWidget {
  static String routeName = "/complete";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Order"),
      ),
      body: Body(),
    );
  }
}
