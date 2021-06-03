import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
   this.text,
   this.icon,
   this.sub,
    this.press,
  }) : super(key: key);

  final String text, sub, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: kPrimaryColor,
              width: 22,
            ),
            SizedBox(width: 10),
            Expanded(
             child: ListTile(
               title: Text('${text}'),
               subtitle: Text('${sub}'),
             ),
           ),
           // Expanded(child: Text(text)),
          //  Icon(Icons.edit),
          ],
        ),
      ),
    );
  }
}
