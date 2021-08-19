import 'dart:convert';
import 'package:shop_app/models/wishlist.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/localization/language_constants.dart';
import '../api_constants.dart';

class WishlistApi{

  ///add to wishlist

  static Future<dynamic> addwishlist(String url,int product_id, int userid) async {
    final response = await http.post(
        '${baseurl + url + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +
            "&user_id=" +
            userid.toString() +
            "&product_id=" +
            product_id.toString()}');
    if (response.statusCode == 200) {
      //print(response.body);
      var data = jsonDecode(response.body);
      return data['message'];
    }
  }
  ///get wishlist
  static Future<Wishlist> getwish(int id) async {
    final response = await http.get(
        '${baseurl + wishlistURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&user_id="+id.toString()}');
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      Wishlist wishList = Wishlist.fromJson(jsondata);
      List<AllWishListProducts> Allwishes = [];
      for (var i in Allwishes) {
        AllWishListProducts allWishListProducts = AllWishListProducts.fromJson(
            i);
        Allwishes.add(allWishListProducts);
      }
      return wishList;
    } else {
      throw Exception('failed');
    }
  }
  ///if wishlish
  static Future<dynamic> ifwishlist(String url,int product_id, int userid) async {
    final response = await http.post(
        '${baseurl + url + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +
            "&user_id=" +
            userid.toString() +
            "&product_id=" +
            product_id.toString()}');
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      return data['message'];
    }
  }

  ///deletewishlist

  static Future<dynamic> deletewishlist(String url,int product_id, int userid) async {
    final response = await http.post(
        '${baseurl + url + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +
            "&user_id=" +
            userid.toString() +
            "&product_id=" +
            product_id.toString()}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print(response.body);
      return data['message'];
    } else (e){
      print(e);
      throw Exception(e);
    };

  }
}