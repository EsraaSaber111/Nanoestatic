import 'dart:convert';
import 'package:nanoestatic/localization/language_constants.dart';
import 'package:nanoestatic/models/CompeleteOrder.dart';
import 'package:nanoestatic/models/User.dart';
import 'package:nanoestatic/models/about_us_model.dart';
import 'package:nanoestatic/models/all_categories_model.dart';
import 'package:nanoestatic/models/all_courses_model.dart';
import 'package:nanoestatic/models/all_products_model.dart';
import 'package:nanoestatic/models/contact_us.dart';
import 'package:nanoestatic/models/inquiry.dart';
import 'package:nanoestatic/models/member.dart';
import 'package:nanoestatic/models/product_model.dart';
import 'package:nanoestatic/models/slider.dart';
import 'package:http/http.dart' as http;
import '../api_constants.dart';

class Api {
  ///get function for arrays
  ///get all categories

  static Future<AllCategoriesModel> getAllCategories() async {
    final response = await http.get(
        "${baseurl + allCatURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}");
    if (response.statusCode == 200) {
      print(response.body);
      final jsondata = json.decode(response.body);
      AllCategoriesModel allCategoriesModel = AllCategoriesModel.fromJson(
          jsondata);
      List<AllCategories> Allcat = [];
      for (var i in Allcat) {
        AllCategories allCategories = AllCategories.fromJson(i);
        Allcat.add(allCategories);
      }
      return allCategoriesModel;
    } else {
      throw Exception('failed');
    }
  }

  ///getslider
  static Future<Sliders> getSlider() async {
    final response = await http.get(
        '${baseurl + 'home/sliders?' + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
    if (response.statusCode == 200) {
      //print(response.body);
      final jsondata = json.decode(response.body);
      Sliders slider = Sliders.fromJson(
          jsondata);
      List<AllSliders> Allslid = [];
      for (var i in Allslid) {
        AllSliders allSliders = AllSliders.fromJson(i);
        Allslid.add(allSliders);
      }
      return slider;
    } else {
      throw Exception('failed');
    }
  }

  static Future<AllProductsModel> getHomeProducts() async {
    final response = await http.get(
        '${baseurl + 'home/products?' + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
    if (response.statusCode == 200) {
      //print(response.body);
      final jsondata = json.decode(response.body);
      AllProductsModel allProductsModel = AllProductsModel.fromJson(jsondata);

      List<AllProducts> Allpro = [];
      for (var i in Allpro) {
        AllProducts allProducts = AllProducts.fromJson(i);
        Allpro.add(allProducts);
      }
      return allProductsModel;
    } else {
      throw Exception('failed');
    }
  }

  static Future<AllProductsModel> getAllProducts(int cat_Id) async {
    final response = await http.get(
        '${baseurl + allProductURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +
            "&category_id=" + cat_Id.toString()}');
    if (response.statusCode == 200) {
      print(response.body);
      final jsondata = json.decode(response.body);
      AllProductsModel allProductsModel = AllProductsModel.fromJson(jsondata);

      List<AllProducts> Allpro = [];
      for (var i in Allpro) {
        AllProducts allProducts = AllProducts.fromJson(i);
        Allpro.add(allProducts);
      }
      return allProductsModel;
    } else {
      throw Exception('failed');
    }
  }

  ///get product (details) data

  static Future<Product_model> getproductdetails(int pro_id) async {
    final response = await http.get(
        '${baseurl + productURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&product_id=" +
            pro_id.toString()}');
    if (response.statusCode == 200) {
        print(response.body);
      final jsondata = json.decode(response.body);
      //print(jsondata);
      return Product_model.fromJson(jsondata);
    } else {
      throw Exception('failed');
    }
  }


  static Future<MemberModel> getmemberserial(String serial, String url) async {
    final response = await http.get(
        '${baseurl + url + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&serial=" +
            serial}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MemberModel.fromJson(data);
    }
    else {
      throw Exception('failed');
    }
  }

  static Future<dynamic> getdoctorserial(String serial, String url) async {
    final response = await http.get(
        '${baseurl + url + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&serial=" +
            serial}');
    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      return data['message'];
    }
  }


  ///get all courses

  static Future<Courses> getAllCourses() async {
    final response = await http.get(
        '${baseurl + allCoursesURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
    if (response.statusCode == 200) {
      // print(response.body);
      final jsondata = json.decode(response.body);
      Courses courses = Courses.fromJson(jsondata);
      List<AllCourses> Allcourses = [];
      for (var i in Allcourses) {
        AllCourses allCourses = AllCourses.fromJson(i);
        Allcourses.add(allCourses);
      }
      return courses;
    } else {
      throw Exception('failed');
    }
  }

  ///get all products of specific category



  /// get function for json object




  ///get course (details) data


  /// get contact us data

  static Future<ContactUs> getcontact() async {
    final response = await http.get(
        '${baseurl + contentURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
    if (response.statusCode == 200) {
      //  print(response.body);
      final jsondata = json.decode(response.body);
      //print(jsondata);
      return ContactUs.fromJson(jsondata);
    } else {
      throw Exception('failed');
    }
  }

  ///get about us data

  static Future<AboutUsModel> getAboutUs() async {
    final response = await http.get(
        '${baseurl + aboutUsURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
    if (response.statusCode == 200) {
      //   print(response.body);
      final jsondata = json.decode(response.body);
      //  print(jsondata);
      return AboutUsModel.fromJson(jsondata);
    } else {
      throw Exception('failed');
    }
  }

  ///post methods

  static Future<Inquiry> makeinquiry(String email, int phone,
      String content) async {
    final response = await http.post(
        '${baseurl + InquiryUrl + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + english + "&name=" + name + "&phone=" +
            phone.toString() + "&content=" + content}');
    if (response.statusCode == 200) {
      //  print(response.body);
      final jsondata = json.decode(response.body);
      // print(jsondata);
      return Inquiry.fromJson(jsondata);
    } else {
      throw Exception('failed');
    }
  }




  static Future<String> checkout(CompeleteOrder order) async {
    print("order ${order.myProducts}");
    print( '${baseurl + CheckoutURL + "api_username=" + name + "&api_password=" +
        password + "&api_lang=" + await getLanguageCode() + "&email=" +
        order.email + "&phone=" + order.phone + "&fullname=" +
        order.fullname + "&address=" + order.address + "&notes=" +
        order.notes + "&orderd_by=" + order.customerid.toString() +
        "&allProducts=" + "${order.myProducts.map((e) => e.to_String()).toList()}"}');
    final response = await http.post(
        '${baseurl + CheckoutURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&email=" +
            order.email + "&phone=" + order.phone + "&fullname=" +
            order.fullname + "&address=" + order.address + "&notes="+ order.notes + "&orderd_by=" + order.customerid.toString() +
            "&allProducts=" + "${order.myProducts.map((e) => e.to_String()).toList()}"}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
    //  print(response.body);
      return data.toString();
    } else (e){
      print(e);
      throw Exception(e);
    };
  }







}