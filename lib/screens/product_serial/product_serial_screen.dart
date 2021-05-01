import 'package:flutter/material.dart';

import 'components/body.dart';

class ProductSerialScreen extends StatelessWidget {
  static String routeName = "/productserial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Serial"),
      ),
      body: Body(),
    );
  }
}
