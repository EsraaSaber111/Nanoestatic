import 'package:flutter/material.dart';

import 'Product.dart';

class ContactItems {

  final String title, content,icon;

  ContactItems({this.icon, @required this.title, @required this.content});

}
List<ContactItems> itemsforContact=[
  ContactItems(icon:"assets/icons/Phone.svg",title:'Phone', content: '0xxxxxxxxxx'),
  ContactItems(icon:"assets/icons/Mail.svg",title:'E-mail', content:'MesoEstatic@gmail.com'),
  ContactItems(icon:"assets/icons/Location point.svg",title:'Location',content: 'www.googlemaps.com'),
  //  ContactItems(Icon(Icons.email),'E-mail', 'MesoEstatic@gmail.com'),
];

List<ContactItems> itemsforContact2=[
  ContactItems(title:'Who Us', content: '${demoProducts[0].description}'),
  ContactItems(title:'E-mail', content:'MesoEstatic@gmail.com'),
  ContactItems(title:'Address',content: '5 Heliopolis street,Cairo,Egypt'),
  ContactItems(title:'Our Vision',content: '${demoProducts[0].description}'),
  //  ContactItems(Icon(Icons.email),'E-mail', 'MesoEstatic@gmail.com'),
];