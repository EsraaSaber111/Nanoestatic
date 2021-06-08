import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/about_us/AboutUs.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/categories/categories_screen.dart';
import 'package:shop_app/screens/complete_order/complete_order.dart';
import 'package:shop_app/screens/complete_order2/complete_order.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/contact_us/ContactUs.dart';
import 'package:shop_app/screens/course_details/CourseDetailsScreen.dart';
import 'package:shop_app/screens/courses/CourseScreen.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/inquiry/inquiry_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/mainpage/mainpagescreen.dart';
import 'package:shop_app/screens/offers/offers_screen.dart';
import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:shop_app/screens/product_serial/product_serial_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/specific_products/SpecificScreen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/screens/wishlist/wishlist_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
 // DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
 // CourseDetailsScreen.routeName:(context) => CourseDetailsScreen(),
  CategoriesScreen.routeName:(context)=>CategoriesScreen(),
  CourseScreen.routeName:(context)=>CourseScreen(),
  CompleteOrder.routeName:(context)=>CompleteOrder(),
  CompleteOrder2.routeName:(context)=>CompleteOrder2(),
  Contact.routeName:(context)=>Contact(),
  AboutUs.routeName:(context)=>AboutUs(),
  OfferScreen.routeName:(context)=>OfferScreen(),
  InquiryScreen.routeName:(context)=>InquiryScreen(),
  MainPage.routeName:(context)=>MainPage(),
  WishListScreen.routeName:(context)=>WishListScreen(),
 // SpecificScreen.routeName:(context)=>SpecificScreen()
  ProductSerialScreen.routeName:(context)=>ProductSerialScreen(),
};
