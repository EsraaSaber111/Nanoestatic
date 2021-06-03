import 'package:flutter/material.dart';

import 'components/body.dart';
class AboutUs extends StatelessWidget {
  static String routeName = "/aboutus";
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body();
  }
}
