import 'package:flutter/material.dart';

import 'components/body.dart';

class InquiryScreen extends StatelessWidget {
  static String routeName = "/inquiry";
  final inquiry=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: inquiry,
      appBar: AppBar(
        title: Text("Inquiry"),
      ),
      body: Body(),
    );
  }
}
