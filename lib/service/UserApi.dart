import 'dart:convert';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/models/register.dart';
import 'package:http/http.dart' as http;
import '../api_constants.dart';

class UserApi{
  static Future<Register> UserRegister(RegisterUser user) async {
    final response = await http.post(
        '${baseurl + RegisterURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&name=" +
            user.name + "&phone=" + user.phone.toString() + "&email=" +
            user.email + "&password=" + user.password}');
    if (response.statusCode == 200) {
      //   print(response.body);
      final jsondata = json.decode(response.body);
      //   print(jsondata);
      return Register.fromJson(jsondata);
    } else {
      throw Exception('faild');
    }
  }

  static Future<Login> login(String email, String pass) async {
    final response = await http.post(
        '${baseurl + LoginURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&email=" +
            email + "&password=" + pass}');
    if (response.statusCode == 200) {
      //   print(response.body);
      final jsondata = json.decode(response.body);
      print(jsondata);
      return Login.fromJson(jsondata);
    } else {
      throw Exception('faild');
    }
  }

  static Future<Login> getuser(int id) async {
    final response = await http.get(
        '${baseurl + "user/show?" + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +"&user_id="+id.toString()}');
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      print(jsondata);
      return Login.fromJson(jsondata);
    } else {
      throw Exception('faild');
    }
  }

}