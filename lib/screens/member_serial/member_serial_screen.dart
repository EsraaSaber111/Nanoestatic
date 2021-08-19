import 'package:flutter/material.dart';
import 'package:shop_app/components/drawer.dart';
import 'components/body.dart';

class MemberSerialScreen extends StatelessWidget {
  static String routeName = "/memberserial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child:drawer()),
      appBar: AppBar(
        title: Text("Member Serial"),
      ),
      body: Body(),
    );
  }
}
