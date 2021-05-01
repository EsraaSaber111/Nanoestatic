import 'package:flutter/material.dart';

class ContactItems {

  final String title, content,icon;

  ContactItems({@required this.icon, @required this.title, @required this.content});


}
List<ContactItems> itemsforContact=[
  ContactItems(icon:"assets/icons/Call.svg",title:'Phone', content: '0xxxxxxxxxx'),
  ContactItems(icon:"assets/icons/Location point.svg",title:'Location',content: 'www.googlemaps.com'),
  ContactItems(icon:"assets/icons/Mail.svg",title:'E-mail', content:'MesoEstatic@gmail.com'),
  //  ContactItems(Icon(Icons.email),'E-mail', 'MesoEstatic@gmail.com'),
];