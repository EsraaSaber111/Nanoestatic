import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/localization/language_constants.dart';
import 'package:shop_app/models/CompeleteOrder.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/models/about_us_model.dart';
import 'package:shop_app/models/all_categories_model.dart';
import 'package:shop_app/models/all_courses_model.dart';
import 'package:shop_app/models/all_products_model.dart';
import 'package:shop_app/models/checkout.dart';
import 'package:shop_app/models/contact_us.dart';
import 'package:shop_app/models/course_model.dart';
import 'package:shop_app/models/inquiry.dart';
import 'package:shop_app/models/login.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/register.dart';
import 'package:shop_app/models/slider.dart';
import 'package:shop_app/models/wishlist.dart';
import 'package:shop_app/screens/complete_order/components/complete_form.dart';
import 'package:shop_app/screens/complete_order2/components/complete_form.dart';
import '../api_constants.dart';

class Api {


  ///get function for arrays
  ///get all categories

  static Future<AllCategoriesModel> getAllCategories() async {
    final response = await http.get(
        '${baseurl + allCatURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
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
      throw Exception('faild');
    }
  }

  ///getslider
  static Future<Sliders> getSlider() async {
    final response = await http.get(
        '${baseurl + 'home/sliders?' + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
    if (response.statusCode == 200) {
      print(response.body);
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
      throw Exception('faild');
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
      throw Exception('faild');
    }
  }

  static Future<dynamic> getdotor(String serial, String url) async {
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


  ///get wishlist
  static Future<Wishlist> getwish(int id) async {
    final response = await http.get(
        '${baseurl + wishlistURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&user_id=" +
            id.toString()}');
    if (response.statusCode == 200) {
      //  print(response.body);
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
      throw Exception('faild');
    }
  }

  ///get all courses

  static Future<Courses> getAllCourses() async {
    final response = await http.get(
        '${baseurl + allCoursesURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode()}');
    if (response.statusCode == 200) {
      //  print(response.body);
      final jsondata = json.decode(response.body);
      Courses courses = Courses.fromJson(jsondata);
      List<AllCourses> Allcourses = [];
      for (var i in Allcourses) {
        AllCourses allCourses = AllCourses.fromJson(i);
        Allcourses.add(allCourses);
      }
      return courses;
    } else {
      throw Exception('faild');
    }
  }

  ///get all products of specific category

  static Future<AllProductsModel> getAllProducts(int cat_Id) async {
    final response = await http.get(
        '${baseurl + allProductURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() +
            "&category_id=" + cat_Id.toString()}');
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
      throw Exception('faild');
    }
  }

  /// get function for json object

  ///get product (details) data

  static Future<Product_model> getproductdetails(int pro_id) async {
    final response = await http.get(
        '${baseurl + productURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&product_id=" +
            pro_id.toString()}');
    if (response.statusCode == 200) {
      print(response.body);
      final jsondata = json.decode(response.body);
      print(jsondata);
      return Product_model.fromJson(jsondata);
    } else {
      throw Exception('faild');
    }
  }


  ///get course (details) data

  static Future<Course_Model> getcoursedetails(int id) async {
    final response = await http.get(
        '${baseurl + courseURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&course_id=" +
            id.toString()}');
    if (response.statusCode == 200) {
      //  print(response.body);
      final jsondata = json.decode(response.body);
      // print(jsondata);
      return Course_Model.fromJson(jsondata);
    } else {
      throw Exception('faild');
    }
  }

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
      throw Exception('faild');
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
      throw Exception('faild');
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
      throw Exception('faild');
    }
  }


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

  static Future<CheckOut> checkout(CompeleteOrder order) async {
    final response = await http.post(
        '${baseurl + CheckoutURL + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&email=" +
            order.email + "&password=" + order.password + "&fullname=" +
            order.fullname + "&address=" + order.address + "&notes=" +
            order.notes + "&orderd_by=" + order.customerid.toString() +
            "&allProducts=" + order.myProducts.toString()}');
    if (response.statusCode == 200) {

      var data = jsonDecode(response.body);
      print(response.body);
      return data['message'];
    } else {
      throw Exception('faild');
    }
  }

  ///applycourse

  static Future<dynamic> confirmcourse(String url, Confirm c, int courseid,
      int userid) async {
    final response = await http.post(
        '${baseurl + url + "api_username=" + name + "&api_password=" +
            password + "&api_lang=" + await getLanguageCode() + "&name=" +
            c.name + "&phone=" +
            c.phone + "&notes=" +
            c.note + "&address=" +
            c.address + "&email=" +
            c.email +
            "&user_id=" +
            userid.toString() +
            "&course_id=" +
            courseid.toString()}');
    if (response.statusCode == 200) {
// print(response.body);
      var data = jsonDecode(response.body);
      return data['message'];
    }
  }

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
 print(response.body);
        var data = jsonDecode(response.body);
        return data['message'];
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




}