import 'package:flutter/material.dart';
import 'package:nanoestatic/models/ContactItems.dart';
import 'package:nanoestatic/screens/contact_us/items.dart';

class AboutUsCard extends StatelessWidget {
  double width;
  Items items;

  AboutUsCard(
      this.width,
      this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            children: [
              Text("${items.title} ", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ],
          ),
          subtitle: Text(items.details),

        ),
      ),
       width: width,
      // height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
    );

  }
}
