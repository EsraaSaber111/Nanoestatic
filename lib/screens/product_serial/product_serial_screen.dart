import 'package:flutter/material.dart';
import 'package:shop_app/components/drawer.dart';

import 'components/body.dart';

class ProductSerialScreen extends StatelessWidget {
  static String routeName = "/productserial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child:drawer()),
      appBar: AppBar(
        title: Text("Product Serial"),
      ),
      body: Body(),
    );
  }
}
