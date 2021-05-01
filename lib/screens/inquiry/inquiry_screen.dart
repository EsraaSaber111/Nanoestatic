import 'package:flutter/material.dart';

import 'components/body.dart';

class InquiryScreen extends StatelessWidget {
  static String routeName = "/inquiry";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inquiry"),
      ),
      body: Body(),
    );
  }
}
