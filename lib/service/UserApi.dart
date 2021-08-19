import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/models/orders.dart';
import 'package:shop_app/models/register.dart';
import 'package:http/http.dart' as http;
import '../api_constants.dart';

class UserApi{
  static Future<Register> UserRegister(RegisterUser user) async {
    final response = await http.post(
        '${baseurl + RegisterURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&name=" +
            user.name + "&phone=" + user.phone+ "&email=" +
            user.email + "&password=" + user.password}');
    if (response.statusCode == 200) {
      //   print(response.body);
      final jsondata = json.decode(response.body);
      //   print(jsondata);
      return Register.fromJson(jsondata);
    } else {
      throw Exception('failed');
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
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('email', jsondata['user']['email']);
        prefs.setString('id', jsondata['user']['id'].toString());
        prefs.setString('name', jsondata['user']['name']);
        prefs.setString('main_image', jsondata['user']['main_image']);
        prefs.setString('phone', jsondata['user']['phone']);
        prefs.setString('address', jsondata['user']['address']);
        prefs.setString('user_token', jsondata['user']['user_token']);
      });
      return Login.fromJson(jsondata);
    } else {
      throw Exception('failed');
    }
  }

  static Future<dynamic> logout(String token) async {
    final response = await http.post(
        '${baseurl + "user/logout?" + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + '&user_token=' +
            token}');

      if (response.statusCode == 200) {
        // print('${baseurl + "user/show?" + "api_username=" + name + "&api_password=" +
        //     password + "&api_lang=" + await getLanguageCode() + '&user_token=' +
        //     token}');
        //   print(response.body);
        SharedPreferences.getInstance().then((prefs) {
          prefs.clear();
        });
        var data = jsonDecode(response.body);
        print(response.body);
        return data.toString();
      } else
         (e){
          print(e);
          throw Exception(e);
        };
    }

  static Future<Login> getuser(String id) async {
    final response = await http.get(
        '${baseurl + "user/show?" + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +"&user_id="+id.toString()}');
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
     // print(jsondata);
      return Login.fromJson(jsondata);
    } else {
      throw Exception('failed');
    }
  }

  static Future<Orders> getUserOrders(String userid) async {
    final response = await http.get(
        '${baseurl + 'user/orders?' + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +
            "&user_id=" + userid}');
    if (response.statusCode == 200) {
     // print(response.body);
      final jsondata = json.decode(response.body);
      Orders orders = Orders.fromJson(jsondata);
      List<AllUserOrders> Allorders = [];
      for (var i in Allorders) {
        AllUserOrders allUserOrders = AllUserOrders.fromJson(i);
        Allorders.add(allUserOrders);
      }
      return orders;
    } else {
      throw Exception('failed');
    }
  }

  static Future<dynamic> UserUpdate(RegisterUser user, String userid) async {
    final response = await http.post(
        '${baseurl +
            'user/update?'+
            "api_username=" + name +
            "&api_password=" + password +
            "&api_lang=" + await getLanguageCode()+
            "&name="+ user.name +
            "&phone=" + user.phone+
            "&email=" + user.email +
            "&password=" + user.password+
            "&user_id="+userid}');

    if (response.statusCode == 200) {
        //print(response.body);
      var data = jsonDecode(response.body);
      return data['message'];
    } else {
     print('failed');
    }
  }



}