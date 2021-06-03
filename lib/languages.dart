import 'package:flutter/material.dart';
class Languages{
  final int id;
  final String name;
  final String languageCode;
  Languages(this.id,this.name,this.languageCode);

  static List<Languages> languagelist(){
    return <Languages>[
      Languages(1, 'English',"en"),
      Languages(1, 'Arabic',"ar"),
    ];
  }
}