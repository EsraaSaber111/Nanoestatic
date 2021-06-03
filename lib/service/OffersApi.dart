import 'dart:convert';

import 'package:shop_app/models/offres.dart';
import 'package:http/http.dart' as http;
import '../api_constants.dart';
class OffersApi{
  ///get all offers

  static Future<Offres> getAllOffers() async {
    final response = await http.get('${baseurl+allOffersURL+"api_username="+name+"&api_password="+password+"&api_lang="+english}');
    if(response.statusCode == 200) {
      print(response.body);
      final jsondata = json.decode(response.body);
      Offres offres=Offres.fromJson(jsondata);

      var Alloffers=[];
      for(var i in Alloffers){
        AllProducts allProducts= AllProducts.fromJson(i);
        Alloffers.add(allProducts);
      }
      return offres;
    }else{
      throw Exception('faild');
    }
  }

}