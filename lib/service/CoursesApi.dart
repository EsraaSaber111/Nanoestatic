import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/course_model.dart';
import 'package:shop_app/models/orders.dart';
import 'package:shop_app/screens/complete_order2/components/complete_form.dart';
import 'package:http/http.dart' as http;
import '../api_constants.dart';
import 'package:shop_app/models/user_courses.dart';

class CoursesApi{

  static Future<dynamic> confirmcourse(String url, Confirm c) async {
    final response = await http.post(
        '${baseurl + url + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&name=" +
            c.name + "&phone=" +
            c.phone + "&notes=" +
            c.note + "&address=" +
            c.address + "&email=" +
            c.email +
            "&user_id="+
            c.userid.toString()+
            "&course_id="+
            c.courseid.toString()}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['message'];
    }
  }
  static Future<Course_Model> getcoursedetails(String id) async {
    final response = await http.get(
        '${baseurl + courseURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&course_id=" +
            id.toString()}');
    if (response.statusCode == 200) {
      final jsondata = json.decode(response.body);
      print(jsondata);
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('course_id', jsondata['course']['id'].toString());
        prefs.setString('course_name', jsondata['course']['data']['name']);
        //print(prefs.getString('course_id'));
      });
      return Course_Model.fromJson(jsondata);
    } else {
      throw Exception('faild');
    }
  }
  static Future<UserCourses> getUserCourses(String userid) async {
    final response = await http.get(
        '${baseurl + 'user/courses?' + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +
            "&user_id=" + userid}');
    if (response.statusCode == 200) {
      print(response.body);
      final jsondata = json.decode(response.body);
      UserCourses courses = UserCourses.fromJson(jsondata);
      List<AllUserCourses> Allcourses = [];
      for (var i in Allcourses) {
        AllUserCourses allUserCourses = AllUserCourses.fromJson(i);
        Allcourses.add(allUserCourses);
      }
      return courses;
    } else {
      throw Exception('faild');
    }
  }



}