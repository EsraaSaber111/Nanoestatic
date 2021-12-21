import 'package:flutter/widgets.dart';
import 'package:nanoestatic/screens/UserProfile/userprofile_screen.dart';
import 'package:nanoestatic/screens/about_us/AboutUs.dart';
import 'package:nanoestatic/screens/cart/cart_screen.dart';
import 'package:nanoestatic/screens/categories/categories_screen.dart';
import 'package:nanoestatic/screens/complete_order/complete_order.dart';
import 'package:nanoestatic/screens/complete_order2/complete_order.dart';
import 'package:nanoestatic/screens/complete_profile/complete_profile_screen.dart';
import 'package:nanoestatic/screens/contact_us/ContactUs.dart';
import 'package:nanoestatic/screens/courses/CourseScreen.dart';
import 'package:nanoestatic/screens/forgot_password/forgot_password_screen.dart';
import 'package:nanoestatic/screens/home/home_screen.dart';
import 'package:nanoestatic/screens/inquiry/inquiry_screen.dart';
import 'package:nanoestatic/screens/login_success/login_success_screen.dart';
import 'package:nanoestatic/screens/mainpage/mainpagescreen.dart';
import 'package:nanoestatic/screens/member_serial/member_serial_screen.dart';
import 'package:nanoestatic/screens/offers/offers_screen.dart';
import 'package:nanoestatic/screens/product_serial/product_serial_screen.dart';
import 'package:nanoestatic/screens/profile/profile_screen.dart';
import 'package:nanoestatic/screens/sign_in/sign_in_screen.dart';
import 'package:nanoestatic/screens/splash/splash_screen.dart';
import 'package:nanoestatic/screens/wishlist/wishlist_screen.dart';

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
  MemberSerialScreen.routeName:(context)=>MemberSerialScreen(),
  UserProfileScreen.routeName:(context)=>UserProfileScreen(),
};
